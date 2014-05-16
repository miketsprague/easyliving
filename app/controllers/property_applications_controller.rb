class PropertyApplicationsController < ApplicationController
  require 'net/http'
#  before_action :set_property_application, only: []
  # GET /property_applications
  # GET /property_applications.json
  def index
    @property_applications = PropertyApplication.all
  end

  # GET /property_applications/1
  # GET /property_applications/1.json
  def show
  end

  # GET /property_applications/new
  def new
    @property_application = PropertyApplication.new
  end

  # GET /property_applications/1/edit
  def edit
  end

  # POST /property_applications
  # POST /property_applications.json
  def create
    @property_application = PropertyApplication.new(property_application_params)

    respond_to do |format|
      if @property_application.save
        args = { :id => @property_application.property_id, :first_name => @property_application.first_name, :last_name => @property_application.last_name, :email => @property_application.email}
        Net::HTTP.post_form(URI.parse(property_url(@property_application.property_id) + "/apply"), args )
#        @property_application.apply
        format.html { redirect_to root_url, notice: 'Property application was successfully created.' }
#         format.json { render action: 'show', status: :created, location: @property_application }
      else
        format.html { render action: 'new' }
        format.json { render json: @property_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_applications/1
  # PATCH/PUT /property_applications/1.json
  def update
    respond_to do |format|
      if @property_application.update(property_application_params)
        format.html { redirect_to @property_application, notice: 'Property application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_applications/1
  # DELETE /property_applications/1.json
  def destroy
    @property_application.destroy
    respond_to do |format|
      format.html { redirect_to property_applications_url }
      format.json { head :no_content }
    end
  end

  def apply
    if @property_application.first_name.blank?
      flash[:error] = "You must enter your first name"
      redirect_to @property_application.property
      return
    end

    if @property_application.last_name.blank?
      flash[:error] = "You must enter your last name"
      redirect_to @property_application.property
      return
    end

    begin
      m = Mail::Address.new(@property_application.email)
      # We must check that value contains a domain and that value is an email address
      r = m.domain && m.address == @property_application.email
      t = m.__send__(:tree)
      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e   
      r = false
    end

    if @property_application.email.blank? || !r
      flash[:error] = "You must enter a valid email address"
      redirect_to @property_application.property
      return
    end

    body_message =  "Hi " + property.landlord.name + "!\n" + (@property_application.first_name) + " " + (@property_application.last_name) + " is interested in leasing " + @property_application.property.address + " from you!\n" + "You can contact them at " + (@property_application.email)
    to = property.landlord.name + "<" + property.landlord.email + ">; Mike <mike@findivhousing.com>; Dane <dane@findivhousing.com>"
    
    message = Mail.new do
      from            'mike@findivhousing.com'
      to              to
      subject         'Inquiry about ' + property.address + ' (via FindIVHousing.com)'
      body           body_message 

      delivery_method Mail::Postmark, :api_key => ENV['POSTMARK_API_KEY']
    end

    if message.deliver 
      flash[:notice] = "Email sent"
    else
      flash[:error] = "Error sending " + body_message
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_application
      @property_application = PropertyApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_application_params
      params.require(:property_application).permit(:first_name, :last_name, :email, :start_date, :number_of_cotenants, :attends_a_school, :school, :planned_graduation_date, :phone_number, :property_id)
    end
end
