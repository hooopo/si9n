class CreateSignatures < ActiveRecord::Migration
  def self.up
    create_table :signatures do |t|
      t.text :body
      t.integer :rank, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :signatures
  end
end
