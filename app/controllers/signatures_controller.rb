# encoding: utf-8
class SignaturesController < ApplicationController

  before_filter :douban_auth_required, :only => [:syn, :up, :create]

  respond_to :html, :js, :except => [:create, :up]

  def syn
    @signature = Signature.find(params[:id])
    douban.miniblog(@signature.body_merge_url(:url => signature_url(@signature)))
    current_user.up(@signature) unless Rails.cache.read(current_user.build_cache_key(@signature))
    
    render :js => "$.jGrowl('同步成功！');"
  end

  def random
    if current_user
      @signature = current_user.random_signature
    else
      @signature = Signature.random
    end
 
    respond_with(@signature)
  end

  def up
    @signature = Signature.find(params[:id])

    if Rails.cache.read(current_user.build_cache_key(@signature))
      render :js => "$.jGrowl('已经收藏过！');"
    else
      current_user.up(@signature)
      render :js => "$.jGrowl('收藏成功！');"
    end
  end


  def index
    @signatures = Signature.order("up DESC").limit(10)
    respond_with(@signature)
  end

  def show
    @signature = Signature.find(params[:id])
    respond_with(@signature)
  end
  
  def new
    @signature = Signature.new
    respond_with(@signature)
  end

  def create
    @signature = Signature.new(params[:signature].merge(:user_id => current_user.id))
    
    respond_to do |format|
      if @signature.save
        format.html { redirect_to(@signature, :notice => '添加成功！') }
        format.js{render :js => "$.jGrowl('添加成功！');"}
      else
        format.html { render :action => "new" }
        format.js{render :js => "$.jGrowl('#{@signature.error_text}');"}
      end
    end
  end
end
