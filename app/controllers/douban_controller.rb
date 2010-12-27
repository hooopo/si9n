class DoubanController < ApplicationController
  def new
    douban = Douban.new
    douban.callback = douban_callback_url
    authorize_url = douban.authorize_url
    
    respond_to do |wants|
      session[:back]   = request.env['HTTP_REFERER'] unless request.env['HTTP_REFERER'].blank?
      session[:douban] = douban.dump
      wants.html {redirect_to authorize_url}
    end
  end
  
  def callback
    if session[:douban]
      douban = Douban.load(session[:douban])
      douban.authorize
      session[:douban] = douban.dump
      cookies.permanent.signed[:douban] = douban.dump.try(:to_json)
      resp = douban.get("/people/%40me")
      if resp.message == "OK"
        require 'pp'
        xml = resp.body
        user_info = ActiveSupport::XmlMini.parse(xml)
        pp user_info["entry"]
        user_info = user_info["entry"]
        User.create :location => user_info["location"]["id"],
          :uid => user_info["uid"]["__content__"],
          :content => user_info["content"]["__content__"],
          :link => user_info["link"].find{|link| link["rel"] == "alternate"}["href"]
      end

    end
    
    redirect_to(session[:back] || '/')
    session[:back] = nil
  end
  
  def destroy
    return unless douban_authorized?
    session[:douban] = nil
    cookies[:douban] = nil
    douban.destroy
    redirect_to '/'
  end
end