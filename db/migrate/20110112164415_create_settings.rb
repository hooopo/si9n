class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.integer :random_mode, :default => 0
    end
  end

  def self.down
    drop_table :settings
  end
end
