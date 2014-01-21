class AddPublicToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :public, :boolean, default: false
  end
end
