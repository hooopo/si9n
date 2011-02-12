# encoding: utf-8
class ApplicationController < ActionController::Base 
  #has_mobile_fu
  
  protect_from_forgery
  include DoubanHelper
  include ApplicationHelper


end