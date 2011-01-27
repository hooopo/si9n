class Admin::SignaturesController < ApplicationController
  def index
    @signatures = Signature.paginate :per_page => 10, :page => params[:page]
  end

  def update
    render :text => "ok"
  end
end
