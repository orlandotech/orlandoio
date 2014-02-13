# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  full_name              :string(255)
#  category               :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  uid                    :string(255)
#  provider               :string(255)
#  slug                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable #, :omniauth_providers => [:facebook, :github]

  has_one :profile, dependent: :destroy
  has_many :social_links, through: :profile 
  has_many :identities, dependent: :destroy  
  after_create :build_profile

  #scope :with_published_users, User.joins(:profile).where(Profile.published)
  scope :with_published_profile, -> { joins(:profile).merge(Profile.published) }
  # scope :recent, -> { where('created_at > ?', 2.days.ago) }
  #User.joins(:profile).merge(Profile.published)

  # -> lamda runs when called

  def self.create_with_omniauth(info)
    create(name: info["name"])
  end

  
  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :history, :finders]

def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    identity = Identity.where(:provider => auth.provider, :uid => auth.uid, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if identity.user.blank?
      user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
      if user.blank?
       user = User.new
       user.password = Devise.friendly_token[0,10]
       user.full_name = auth.info.name
       user.email = auth.info.email
       auth.provider == "twitter" ?  user.save(:validate => false) :  user.save
     end
     identity.username = auth.info.nickname
     identity.user_id = user.id
     identity.save
   end
   identity.user
 end

 def build_profile
  profile = Profile.create(user: self)
  SocialLink.create(profile_id: profile.id)
 end





  # def password_required?
  #   super && provider.blank?
  # end

  # def email_required?
  #   super && provider.blank?
  # end

 
end
