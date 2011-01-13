class AddRememberMeColumnInSettings < ActiveRecord::Migration
  def self.up
    add_column :settings, :remember_me, :bool, :default => true
  end

  def self.down
    remove_column :settings, :remember_me
  end
end
