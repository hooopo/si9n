class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :status
      t.integer :signature_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
