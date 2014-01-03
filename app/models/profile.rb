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
#

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :social_links, dependent: :destroy  
  accepts_nested_attributes_for :social_links, :reject_if => lambda { |a| a[:link].blank? }, :allow_destroy => true

  has_attached_file :avatar, styles: { 
    large: "450x450#",
    medium: "300x300#", 
    thumb: "100x100#",
    mini: "32x32#" 
  }, 
    default_url:"/images/:style/missing.png"
end