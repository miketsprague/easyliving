class PropertyManagersController < ApplicationController
  before_action :set_property_manager, only: [:show, :edit, :update, :destroy]

  # GET /property_managers
  # GET /property_managers.json
  def index
    @property_managers = PropertyManager.all
  end

  def import(file)
    PropertyManager.import(file)
  end

  # GET /property_managers/1
  # GET /property_managers/1.json
  def show
  end

  # GET /property_managers/new
  def new
    @property_manager = PropertyManager.new
  end

  # GET /property_managers/1/edit
  def edit
  end

  # POST /property_managers
  # POST /property_managers.json
  def create
    @property_manager = PropertyManager.new(property_manager_params)

    respond_to do |format|
      if @property_manager.save
        format.html { redirect_to @property_manager, notice: 'Property manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property_manager }
      else
        format.html { render action: 'new' }
        format.json { render json: @property_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_managers/1
  # PATCH/PUT /property_managers/1.json
  def update
    respond_to do |format|
      if @property_manager.update(property_manager_params)
        format.html { redirect_to @property_manager, notice: 'Property manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_managers/1
  # DELETE /property_managers/1.json
  def destroy
    @property_manager.destroy
    respond_to do |format|
      format.html { redirect_to property_managers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_manager
      @property_manager = PropertyManager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_manager_params
      params.require(:property_manager).permit(:name, :description, :email, :phone_number, :address)
    end
end
