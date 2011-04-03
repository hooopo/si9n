# encoding: utf-8
class MineController < ApplicationController

  before_filter :douban_auth_required

  def signatures
    @signatures = current_user.signatures.order("id DESC").paginate :per_page => 15, :page => params[:page]
  end

  def favorites
    @signatures = current_user.favorite_signatures.order("id DESC").paginate :per_page => 15, :page => params[:page]
  end


end
