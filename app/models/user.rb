class User < ActiveRecord::Base

  has_many :signatures
  has_many :favorites
  has_many :favorite_signatures, :through => :favorites, :source => "signature"

  validates_presence_of :title
  validates_presence_of :uid

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

end
