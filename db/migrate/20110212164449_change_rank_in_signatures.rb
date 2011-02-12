class ChangeRankInSignatures < ActiveRecord::Migration
  def self.up
    change_table(:signatures) do |t|
      t.change :rank, :decimal , :precision => 10, :scale => 2, :default => 0
    end
  end

  def self.down
    change_table(:signatures) do |t|
      t.change :rank, :integer, :default => 0
    end
  end
end
