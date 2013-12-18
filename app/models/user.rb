class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  extend FriendlyId
  friendly_id :full_name, use: [:slugged, :history, :finders]
  # [:slugged, :finders, :history]

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    #binding.pry
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.full_name = auth["info"]["name"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(sessions["devise.user_attributes"], without_protection: true) do |use|
        user.attibutes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def email_required?
    super && provider.blank?
  end

  has_attached_file :avatar, styles: { 
    large: "450x450#",
    medium: "300x300#", 
    thumb: "100x100#",
    mini: "32x32#" 
  }, 
    default_url:"/images/:style/missing.png"
end
