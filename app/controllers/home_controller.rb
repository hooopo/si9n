class HomeController < ApplicationController
  #before_filter :douban_auth_required
  def index

#    p session[:douban]
#    p "-" * 10
#    require 'json'
    p  JSON.parse(cookies.signed[:douban]).class if cookies.signed[:douban]
    if douban
     p 1
      #log ger.debug("ooo")
      #douban.miniblog(session)
    end
  end

end
