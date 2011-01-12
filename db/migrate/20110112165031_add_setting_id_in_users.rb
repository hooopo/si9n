class AddSettingIdInUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :setting_id, :integer
  end

  def self.down
    remove_column :users, :setting_id
  end
end
