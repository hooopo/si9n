class MineController < ApplicationController

  before_filter :douban_auth_required

  def signatures
    @signatures = current_user.signatures
  end

  def favorites
    @signatures = current_user.favorite_signatures
  end

  def settings
    @setting = current_user.setting
  end

  def edit_settings
    @setting = current_user.setting
    if @setting.update_attributes(params[:setting])
      flash[:notice] = "修改成功"
      redirect_to :action => :settings
    else
      render :action => :settings
    end
  end

end
