class HomeController < ApplicationController
  #before_filter :douban_auth_required
  def index
    @signature = Signature.random
  end

end
