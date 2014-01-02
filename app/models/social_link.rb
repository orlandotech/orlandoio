# == Schema Information
#
# Table name: social_links
#
#  id         :integer          not null, primary key
#  account    :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  profile_id :integer
#

class SocialLink < ActiveRecord::Base
  belongs_to :profile
 


end
