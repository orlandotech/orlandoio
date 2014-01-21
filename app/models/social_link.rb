# == Schema Information
#
# Table name: social_links
#
#  id         :integer          not null, primary key
#  account    :string(255)      default("")
#  link       :string(255)      default("")
#  created_at :datetime
#  updated_at :datetime
#  profile_id :integer
#

class SocialLink < ActiveRecord::Base
  belongs_to :profile
end
