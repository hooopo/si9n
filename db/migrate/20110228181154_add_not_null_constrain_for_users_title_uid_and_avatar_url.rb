class AddNotNullConstrainForUsersTitleUidAndAvatarUrl < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :title, :string, :null => false
      t.change :uid, :string, :null => false
      t.change :avatar_url, :string, :null => false
    end
  end

  def self.down
    change_table :users do |t|
      t.change :title, :string
      t.change :uid, :string
      t.change :avatar_url, :string
    end
  end
end
