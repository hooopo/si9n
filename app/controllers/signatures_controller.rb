class SignaturesController < ApplicationController

  before_filter :douban_auth_required, :only => [:syn, :up, :create]

  respond_to :html, :js, :except => [:create, :up]

  def syn
    @signature = Signature.find(params[:id])
    douban.miniblog(@signature.body_merge_url(:url => signature_url(@signature)))
    render :js => "alert('同步成功！');"
  end

  def random
    @signature = Signature.random
    respond_with(@signature)
  end

  def up
    @signature = Signature.find(params[:id])
    @signature.up!
    respond_to do |format|
      format.js
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
    @signature = Signature.new(params[:signature])
    #flash[:notice] = "添加成功！" if @signature.save
    respond_to do |format|
      if @signature.save
        format.html { redirect_to(@signature, :notice => '添加成功！') }
        format.js
      else
        format.html { render :action => "new" }
        format.js
      end
    end
  end

end
