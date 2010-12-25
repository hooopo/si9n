class SignaturesController < ApplicationController

  def random
    @signature = Signature.random
    respond_to do |format|
      format.html
      format.js
    end
  end


#  # GET /signatures
#  # GET /signatures.xml
#  def index
#    @signatures = Signature.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @signatures }
#    end
#  end
#
#  # GET /signatures/1
#  # GET /signatures/1.xml
#  def show
#    @signature = Signature.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @signature }
#    end
#  end
#
#  # GET /signatures/new
#  # GET /signatures/new.xml
#  def new
#    @signature = Signature.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @signature }
#    end
#  end
#
#  # GET /signatures/1/edit
#  def edit
#    @signature = Signature.find(params[:id])
#  end
#
#  # POST /signatures
#  # POST /signatures.xml
#  def create
#    @signature = Signature.new(params[:signature])
#
#    respond_to do |format|
#      if @signature.save
#        format.html { redirect_to(@signature, :notice => 'Signature was successfully created.') }
#        format.xml  { render :xml => @signature, :status => :created, :location => @signature }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @signature.errors, :status => :unprocessable_entity }
#      end
#    end
#  end
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
