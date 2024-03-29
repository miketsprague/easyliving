class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :apply]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
    @json = @properties.to_gmaps4rails
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property }
      else
        format.html { render action: 'new' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url }
      format.json { head :no_content }
    end
  end

  def load_from_csv(file)
    Properties.load_from_csv(file)
  end

  # POST /properties/1/apply
  def apply
    property = Property.find(params[:id])
    if params[:first_name].blank?
      flash[:error] = "You must enter your first name"
      redirect_to @property
      return
    end

    if params[:last_name].blank?
      flash[:error] = "You must enter your last name"
      redirect_to @property
      return
    end

    begin
      m = Mail::Address.new(params[:email])
      # We must check that value contains a domain and that value is an email address
      r = m.domain && m.address == params[:email]
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

    if params[:email].blank? || !r
      flash[:error] = "You must enter a valid email address"
      redirect_to @property
      return
    end

    body_message =  "Hi " + property.landlord.name + "!\n" + (params[:first_name]) + " " + (params[:last_name]) + " is interested in leasing " + property.address + " from you!\n" + "You can contact them at " + (params[:email])
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
      flash[:notice] = "There was an issue sending the email"
    end
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :address, :property_type, :description, :size_type, :rent, :date_available, :security_deposit, :image_urls, :landlord_id)
    end
end
