class ChangeUidTypeInIdnetities < ActiveRecord::Migration
   def up
   change_column :identities, :uid, :integer, :limit => 8
  end

  def down
   change_column :identities, :uid, :integer
  end
end
