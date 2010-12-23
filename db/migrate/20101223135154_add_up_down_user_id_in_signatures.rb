class AddUpDownUserIdInSignatures < ActiveRecord::Migration
  def self.up
    add_column :signatures, :up, :integer, :default => 0
    add_column :signatures, :down, :integer, :default => 0
    add_column :signatures, :user_id, :integer
  end

  def self.down
    remove_column :signatures, :user_id
    remove_column :signatures, :up
    remove_column :signatures, :down
  end
end
