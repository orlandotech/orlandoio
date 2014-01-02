class AddProfileIdToSocialLink < ActiveRecord::Migration
  def change
    add_column :social_links, :profile_id, :integer
  end
end
