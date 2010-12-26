module DoubanHelper
  def douban
    @douban ||= (session[:douban] && session[:douban][:access_token]) ? Douban.load(session[:douban]) : nil
    @douban ||= begin
      cookies_json = cookies.signed[:douban]
      if cookies_json
        cookies_hash = JSON.parse(cookies_json)
        cookies_hash = Hash[cookies_hash.map{|k,v|[k.to_sym, v]}]
        @douban = Douban.load(cookies_hash)
      end
    end
    #    @douban ||= begin
    #      cookies_json = cookies.signed[:douban]
    #      if cookies_json
    #        @douban = Douban.load(JSON.parse(cookies_json))
    #      end
    #    end
  end
  
  def douban_authorized?
    !douban.nil?
  end
  
  def douban_auth_required
    douban_authorized? || redirect_to(douban_login_path)
  end
  
  def douban_auth_or_login_required
    douban_authorized? || login_required
  end
  
  def self.included(base)
    base.send :helper_method, :douban_authorized? if base.respond_to? :helper_method
  end
end