# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include DoubanHelper
  include ApplicationHelper


end