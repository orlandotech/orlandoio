class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :account
      t.string :link

      t.timestamps
    end
  end
end
