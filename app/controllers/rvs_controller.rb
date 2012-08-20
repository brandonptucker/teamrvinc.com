class RVsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  # GET /rvs
  # GET /rvs.json
  def index
    @rvs = RV.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rvs }
    end
  end

  # GET /rvs/1
  # GET /rvs/1.json
  def show
    @rv = RV.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rv }
    end
  end

  # GET /rvs/new
  # GET /rvs/new.json
  def new
    @rv = RV.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rv }
    end
  end

  # GET /rvs/1/edit
  def edit
    @rv = RV.find(params[:id])
  end

  # POST /rvs
  # POST /rvs.json
  def create
    @rv = RV.new(params[:rv])

    respond_to do |format|
      if @rv.save
        format.html { redirect_to @rv, notice: 'RV was successfully created.' }
        format.json { render json: @rv, status: :created, location: @rv }
      else
        format.html { render action: "new" }
        format.json { render json: @rv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rvs/1
  # PUT /rvs/1.json
  def update
    @rv = RV.find(params[:id])

    respond_to do |format|
      if @rv.update_attributes(params[:rv])
        format.html { redirect_to @rv, notice: 'RV was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rvs/1
  # DELETE /rvs/1.json
  def destroy
    @rv = RV.find(params[:id])
    @rv.destroy

    respond_to do |format|
      format.html { redirect_to rvs_url }
      format.json { head :no_content }
    end
  end
end
