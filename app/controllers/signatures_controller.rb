# encoding: utf-8
class SignaturesController < ApplicationController

  before_filter :douban_auth_required, :only => [:syn, :up, :create]


  respond_to :html, :js, :mobile, :except => [:create, :up]

  def syn
    @signature = Signature.find(params[:id])
    douban.miniblog(@signature.body_merge_url(:url => signature_url(@signature)))
    current_user.up(@signature) unless Rails.cache.read(current_user.build_cache_key(@signature))
    
    render :js => "$.jGrowl('同步成功！');"
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

  def delay_up
    @signature = Signature.find(params[:id])
    if current_user && !Rails.cache.read(current_user.build_cache_key(@signature))
      current_user.up(@signature)
      render :text => "OK"
    else
      render :nothing => true
    end
  end


  def index
    @signatures = Signature.normal.order("rank DESC").order("id DESC").includes(:user).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html
      format.rss { render :layout => false} 
    end
  end

  def hottest
    @signatures = Signature.normal.order("up DESC").order("id DESC").includes(:user).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html
      format.rss { render :layout => false}
    end
  end

  def latest
    @signatures = Signature.normal.order("id DESC").includes(:user).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html
      format.rss { render :layout => false}
    end
  end

  def show
    @signatures = Signature.normal.where("id <= ?", params[:id]).order("id DESC").limit(5)
    respond_with(@signatures)
  end
  
  def new
    @signature = Signature.new
    respond_with(@signature)
  end

  def create
    @signature = Signature.new(params[:signature].merge(:user_id => current_user.id))
    
    respond_to do |format|
      if @signature.save
        if params[:also_post_at_douban] == "true" 
          begin
            douban.miniblog(@signature.body_merge_url(:url => signature_url(@signature)))
          rescue Exception => error
            Rails.logger.error "创建时同步到豆瓣我说不成功..."
          end 
        end
        format.html { redirect_to(@signature, :notice => '添加成功！') }
        format.js{render :js => "$.jGrowl('添加成功！');$('#dialog').dialog('close');"}
      else
        format.html { render :action => "new" }
        format.js{render :js => "$.jGrowl('#{@signature.error_text}');"}
      end
    end
  end
end
