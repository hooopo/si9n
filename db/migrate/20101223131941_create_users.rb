class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :location
      t.string :uid
      t.text :content
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
