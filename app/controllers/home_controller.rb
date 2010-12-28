class HomeController < ApplicationController
  # #before_filter :douban_auth_required
  def index
    resp = douban.get("/people/%40me")
    if resp.message == "OK"
      require 'pp'
      pp ActiveSupport::XmlMini.parse(resp.body)
    end
    @signature = Signature.random
  end

end
