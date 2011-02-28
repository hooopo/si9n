class ChangeUserIconToAvatarUrl < ActiveRecord::Migration
  def self.up
    change_table :users do |user|
      user.rename :icon, :avatar_url
    end
  end

  def self.down
    change_table :users do |user|
      user.rename :avatar_url, :icon
    end
  end
end
