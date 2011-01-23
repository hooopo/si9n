# encoding: utf-8
class User < ActiveRecord::Base

  has_many :signatures
  has_many :favorites
  has_many :favorite_signatures, :through => :favorites, :source => "signature"

  belongs_to :setting

  validates_presence_of :title
  validates_presence_of :uid

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
      :icon           => info["link"].find{|link| link["rel"] == "icon"}["href"],
      :signature      => info["signature"]["__content__"],
      :title          => info["title"]["__content__"]
    )
  end
  
  def init_setting
    self.setting = Setting.create!
  end

  def random_signature
    case Setting::RANDOM_MODE_NAMES[self.setting.random_mode]
    when :all
      Signature.all.sample
    when :hotest_100
      Signature.order("up DESC").limit(100).sample
    when :latest_100
      Signature.order("created_at DESC").limit(100).sample
    end

  end
  
  def avatar_url
    self.icon
  end



end
