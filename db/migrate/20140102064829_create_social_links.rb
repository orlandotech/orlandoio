class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.string :account, :default => ""
      t.string :link, :default => ""

      t.timestamps
    end
  end
end
