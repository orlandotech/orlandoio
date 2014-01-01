# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  bio        :string(255)
#  social     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Profile < ActiveRecord::Base
  belongs_to :user 
 
end
