class CreateFavorites < ActiveRecord::Migration
  def self.up
     create_table :favorites do |t|
       t.integer :user_id
       t.integer :signature_id
     end
  end

  def self.down
    drop_table :favorites
  end
end
