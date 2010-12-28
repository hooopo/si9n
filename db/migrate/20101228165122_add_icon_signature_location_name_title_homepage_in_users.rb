class AddIconSignatureLocationNameTitleHomepageInUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :icon, :string
    add_column :users, :location_name, :string
    add_column :users, :title, :string
    add_column :users, :homepage, :string
    add_column :users, :signature, :string
  end

  def self.down
    remove_column :users, :icon
    remove_column :users, :location_name
    remove_column :users, :title
    remove_column :users, :homepage
    remove_column :users, :signature
  end
end
