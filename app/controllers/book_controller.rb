class BookController < ApplicationController
  before_filter :douban_auth_required

  def search
    unless params[:q].blank?
      #puts douban.search_books(params[:q])
      render :xml => douban.search_books(params[:q])
    end
  end
end
