class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :bio
      t.string :social
      t.string :category
      t.integer :user_id
      t.timestamps
    end
  end
end
