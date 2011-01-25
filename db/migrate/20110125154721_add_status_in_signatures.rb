class AddStatusInSignatures < ActiveRecord::Migration
  def self.up
    add_column :signatures, :status, :integer, :default => 1
  end

  def self.down
    remove_column :signatures, :status
  end
end
