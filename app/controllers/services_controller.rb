class ServicesController < ApplicationController
  before_filter :authorize, :except => [:index, :show, :send_service_appointment]
  # GET /services
  # GET /services.json
  def index
    if logged_in?
      @services = Service.all
    else
      @services = Service.where(:active => true)
    end
    @service_appointment = ServiceAppointment.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to services_path, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        if @service.errors.any?
          flash.now[:error] = "Sorry, the service could not be created! Please correct the errors below and create the service again."
        end
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to services_path, notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        if @service.errors.any?
          flash.now[:error] = "Sorry, the service could not be updated! Please correct the errors below and update the service again."
        end
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end

  def send_service_appointment
    @service_appointment = ServiceAppointment.new(params[:service_appointment])
    if @service_appointment.valid?
      ServiceMailer.new_appointment(@service_appointment).deliver
      flash[:notice] = "Appointment request sent! Thank you for contacting us."
      redirect_to services_path
    else
      if @service_appointment.errors.any?
        flash.now[:error] = "Sorry, the request could not be sent! Please correct the errors below and submit the request again."
      end
      if logged_in?
        @services = Service.all
      else
        @services = Service.where(:active => true)
      end
      render action: "index"
    end
  end
end
