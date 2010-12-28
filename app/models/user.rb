class User < ActiveRecord::Base
  
  #  {"entry"=>
  #      {"uri"=>{"__content__"=>"http://api.douban.com/people/26793699"},
  #      "location"=>{"id"=>"beijing", "__content__"=>"北\344\272\254"},
  #      "title"=>{"__content__"=>"hoopo"},
  #      "signature"=>
  #        {"__content__"=>"1小豆+1小豆+1小豆-1小豆=2小\350\261\206"},
  #      "uid"=>{"__content__"=>"26793699"},
  #      "id"=>{"__content__"=>"http://api.douban.com/people/26793699"},
  #      "content"=>
  #        {"__content__"=>
  #          "人生总有许多巧合，两条平行线也可能会有交汇的一天。\n人生总有许多意外，握在手里面的风筝也会突然断了线。\n在这个熟悉又陌生的城市中，无助地寻找一个陌生又熟悉的身影。\n\n-\n Rails3 初上手指南：http://guides.ruby.tw/rails3/getting_started.html\n Bundler: http://gembundler.com/\n Ihower：http://ihower.tw/blog/?s=bundle\n Some of the Problems Bundler Solves：http://yehudakatz.com/2010/04/12/some-of-the-problems-bundler-solves/\n mark评论：http://www.rubyinside.com/fibers-eventmachine-rack-performance-gains-3395.html\nhttp://macournoyer.com/blog/2009/06/04/pusher-and-async-with-thin/\nhttp://zh-cn.w3support.net/index.php?db=so&id=101427\n http://www.cnblogs.com/capricornus/archive/2010/02/05/1664446.html\n\n http://www.slideshare.net/koppel/facebook-ruby\n    http://www.redmine.org/projects/redmine/repository/entry/trunk/lib/redmine/i18n.rb\n\nhttp://prezi.com/\n\nhttp://codebeef.com/automated-deploy-with-unicorn-and-git/\n\nhttp://ihower.tw/rails3/ruby-recipes.html\nhttp://www.cfff.net/"},
  #      "attribute"=>
  #        [{"name"=>"n_mails", "__content__"=>"0"},
  #        {"name"=>"n_notifications", "__content__"=>"0"}],
  #      "link"=>
  #        [{"href"=>"http://api.douban.com/people/26793699", "rel"=>"self"},
  #        {"href"=>"http://www.douban.com/people/26793699/", "rel"=>"alternate"},
  #        {"href"=>"http://img3.douban.com/icon/u26793699-20.jpg", "rel"=>"icon"},
  #        {"href"=>"http://hooopo.javaeye.com", "rel"=>"homepage"}]}}

  
  def self.create_from_xml(info)
    info = info["entry"]
    User.find_or_create_by_uid(info["uid"]["__content__"],
      :location       => info["location"]["id"],
      :location_name  => info["location"]["__content__"],
      :content        => info["content"]["__content__"],
      :link           => info["link"].find{|link| link["rel"] == "alternate"}["href"],
      :icon           => info["link"].find{|link| link["rel"] == "icon"}["href"],
      :homepage       => info["link"].find{|link| link["rel"] == "homepage"}["href"],
      :signature      => info["signature"]["__content__"],
      :title          => info["title"]["__content__"]
    )
  end

end
