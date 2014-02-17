# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  bio                 :string(255)
#  social              :string(255)
#  category            :string(255)
#  user_id             :integer
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :social_links, dependent: :destroy
  accepts_nested_attributes_for :social_links, :reject_if => lambda { |a| a[:link].blank? }, :allow_destroy => true
  acts_as_taggable
  has_attached_file :avatar, styles: {
    large: "450x450#",
    medium: "300x300#",
    thumb: "100x100#",
    mini: "32x32#"
  },
  default_url:"/images/:style/missing.png"

scope :published, -> { where(public: true)}

def update_for_profile(profile_params)
  self.attributes = profile_params
  self.set_profile_completeness
  self.save
end

def self.tokens(query)
  tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{query}%")
  if tags.empty?
    [{id: "#{query}", name: "#{query}"}]
  else
    tags.map{|t| {:id => t.name, :name => t.name }}
  end
end

# private? where to put private
  def set_profile_completeness
    self.public = (self.bio.present? && self.avatar.present? && self.category.present?)
  end

end
