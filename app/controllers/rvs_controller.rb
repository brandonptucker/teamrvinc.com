class RVsController < ApplicationController
  before_filter :authorize, :except => [:index, :show, :send_rv_request]
  # GET /rvs
  # GET /rvs.json
  def index
    @category_rv_map = RV.all.sort { |a, b| b.year <=> a.year }
                        .group_by(&:category)
                        .sort { |a,b| b[1].length <=> a[1].length }
    @categories = RV.uniq.pluck(:category)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rvs }
    end
  end

  # GET /rvs/1
  # GET /rvs/1.json
  def show
    @rv = RV.find(params[:id])
    @rv_request = RVRequest.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rv }
    end
  end

  # GET /rvs/new
  # GET /rvs/new.json
  def new
    @rv = RV.new
    @categories = RV.uniq.pluck(:category)
    @makes = RV.uniq.pluck(:make)
    @rv.get_max_assets.times { @rv.assets.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rv }
    end
  end

  # GET /rvs/1/edit
  def edit
    @rv = RV.find(params[:id])
    @categories = RV.uniq.pluck(:category)
    @makes = RV.uniq.pluck(:make)
    (@rv.get_max_assets - @rv.assets.length).times { @rv.assets.build }
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
        if @rv.errors.any?
          flash.now[:error] = "Sorry, the RV could not be created! Please correct the errors below and create the RV again."
        end
        (@rv.get_max_assets - @rv.assets.length).times { @rv.assets.build }
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
        if @rv.errors.any?
          flash.now[:error] = "Sorry, the RV could not be updated! Please correct the errors below and update the RV again."
        end
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

  def send_rv_request
    # @contact_message = ContactMessage.new(params[:contact_message])
    # if @contact_message.valid?
    #   ContactMailer.new_message(@contact_message).deliver
    #   flash[:notice] = "Message sent! Thank you for contacting us."
    #   redirect_to contact_path
    # else
    #   if @contact_message.errors.any?
    #     flash.now[:error] = "Sorry, the message could not be sent! Please correct the errors below and submit the message again."
    #   end
    #   render :action => "contact"
    # end
    @rv_request = RVRequest.new(params[:rv_request])
    @rv = RV.find(@rv_request.id)
    if @rv_request.valid?
      RVMailer.new_request(@rv_request).deliver
      flash[:notice] = "Request sent! Thank you for contacting us."
      redirect_to rv_path(@rv)
    else
      if @rv_request.errors.any?
         flash.now[:error] = "Sorry, the request could not be sent! Please correct the errors below and submit the request again."
      end
      render :action => :show
    end
  end

  def rv_report
    @categories = RV.all.group_by(&:category).sort
  end
end
