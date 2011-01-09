class MineController < ApplicationController

  before_filter :douban_auth_required

  def signatures
    @signatures = current_user.signatures
  end

  def favorites
    @signatures = current_user.favorite_signatures
  end

  def settings
    
  end

end
