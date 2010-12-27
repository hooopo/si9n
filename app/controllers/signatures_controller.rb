class SignaturesController < ApplicationController

  respond_to :html, :js, :except => [:create, :up, :down]

  def random
    p douban.search_books("http")
    p douban.get("/people/xiaohaibai")
    p douban.get("/people/%40me")
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

  def down
    @signature = Signature.find(params[:id])
    @signature.increment!(:down)
    respond_to do |format|
      format.js
    end
  end


  def index
    @signatures = Signature.order("(up - down) DESC").limit(10)
    respond_with(@signature)
  end

  def show
    @signature = Signature.find(params[:id])
    respond_with(@signature)
  end
  #
  # GET /signatures/new
  # GET /signatures/new.xml
  def new
    @signature = Signature.new
    respond_with(@signature)
  end

  #  # GET /signatures/1/edit
  #  def edit
  #    @signature = Signature.find(params[:id])
  #  end
  #
  #  # POST /signatures
  #  # POST /signatures.xml
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
  #
  #  # PUT /signatures/1
  #  # PUT /signatures/1.xml
  #  def update
  #    @signature = Signature.find(params[:id])
  #
  #    respond_to do |format|
  #      if @signature.update_attributes(params[:signature])
  #        format.html { redirect_to(@signature, :notice => 'Signature was successfully updated.') }
  #        format.xml  { head :ok }
  #      else
  #        format.html { render :action => "edit" }
  #        format.xml  { render :xml => @signature.errors, :status => :unprocessable_entity }
  #      end
  #    end
  #  end
  #
  #  # DELETE /signatures/1
  #  # DELETE /signatures/1.xml
  #  def destroy
  #    @signature = Signature.find(params[:id])
  #    @signature.destroy
  #
  #    respond_to do |format|
  #      format.html { redirect_to(signatures_url) }
  #      format.xml  { head :ok }
  #    end
  #  end
end
