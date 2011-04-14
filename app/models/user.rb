# encoding: utf-8
class User < ActiveRecord::Base

  default_value_for :level, 0
  
  attr_protected :level

  has_many :signatures
  has_many :favorites
  has_many :favorite_signatures, :through => :favorites, :source => "signature"
  has_many :comments
  
  belongs_to :setting

  validates :title, :presence => true
  validates :uid, :presence => true
  validates :avatar_url, :presence => true

  before_create :init_setting

  def up(signature)
    signature.up!
    Favorite.create(:signature_id => signature.id, :user_id => self.id)
    Rails.cache.write(build_cache_key(signature), true, :expires_in => Config::USER_UP_DELAY)
  end

  def build_cache_key(signature)
    [self.id, signature.id].join("_")
  end

  def self.create_from_xml(info)
    info = info["entry"]
    User.find_or_create_by_uid(info["uid"]["__content__"],
      :content        => info["content"]["__content__"],
      :link           => info["link"].find{|link| link["rel"] == "alternate"}["href"],
      :avatar_url     => info["link"].find{|link| link["rel"] == "icon"}["href"],
      :signature      => info["signature"]["__content__"],
      :title          => info["title"]["__content__"]
    )
  end
  
  def init_setting
    self.setting = Setting.create!
  end

  
  def admin?
    self.level == 1
  end

end
