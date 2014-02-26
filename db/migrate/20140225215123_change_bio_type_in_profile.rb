class ChangeBioTypeInProfile < ActiveRecord::Migration
  def up
   change_column :profiles, :bio, :text
  end

  def down
   change_column :profiles, :bio, :string
  end
end
