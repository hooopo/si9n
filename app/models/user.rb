class User < ActiveRecord::Base
  
  def self.create_from_xml(info)
    info = info["entry"]
    User.find_or_create_by_uid(info["uid"]["__content__"],
      :location => info["location"]["id"],
      :content => info["content"]["__content__"],
      :link => info["link"].find{|link| link["rel"] == "alternate"}["href"]
    )
  end

end
