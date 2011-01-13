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
        @current_user = User.create_from_xml(ActiveSupport::XmlMini.parse(resp.body))
        session[:user_id] = @current_user.id
        cookies.permanent.signed[:user_id] = @current_user.id
      end

    end
    
    redirect_to(session[:back] || '/')
    session[:back] = nil
  end
  
  def destroy
    return unless douban_authorized?
    session[:douban] = nil
    cookies[:douban] = nil
    session[:user_id] = nil
    cookies[:user_id] = nil
    douban.destroy
    redirect_to '/'
  end
end