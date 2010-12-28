class ApplicationController < ActionController::Base
  protect_from_forgery
  include DoubanHelper

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    #重复了？？？
    @current_user ||= User.find_by_id(cookies[:user_id])
  end

  def current_user= (user)
    @current_user = user
  end

end
