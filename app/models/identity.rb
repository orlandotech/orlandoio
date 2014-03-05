# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  uid        :integer
#  provider   :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#  secret     :string(255)
#  username   :string(255)
#

class Identity < ActiveRecord::Base
  belongs_to :user
  after_create :fetch_details



  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}")
  end


  def fetch_details_from_facebook
  end


  def fetch_details_from_twitter
  end


  def fetch_details_from_github
  end


  def fetch_details_from_linkedin

  end

  def fetch_details_from_google_oauth2

  end
end
