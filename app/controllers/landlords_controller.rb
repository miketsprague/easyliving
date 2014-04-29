class LandlordsController < ApplicationController
  before_action :set_landlord, only: [:show, :edit, :update, :destroy]

  # GET /landlords
  # GET /landlords.json
  def index
    @landlords = Landlord.all
  end

  def load_from_csv(file)
    Landlord.load_from_csv(file)
  end

  # GET /landlords/1
  # GET /landlords/1.json
  def show
  end

  # GET /landlords/new
  def new
    @landlord = Landlord.new
  end

  # GET /landlords/1/edit
  def edit
  end

  # POST /landlords
  # POST /landlords.json
  def create
    @landlord = Landlord.new(landlord_params)

    respond_to do |format|
      if @landlord.save
        format.html { redirect_to @landlord, notice: 'Property manager was successfully created.' }
        format.json { render action: 'show', status: :created, location: @landlord }
      else
        format.html { render action: 'new' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landlords/1
  # PATCH/PUT /landlords/1.json
  def update
    respond_to do |format|
      if @landlord.update(landlord_params)
        format.html { redirect_to @landlord, notice: 'Property manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @landlord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landlords/1
  # DELETE /landlords/1.json
  def destroy
    @landlord.destroy
    respond_to do |format|
      format.html { redirect_to landlords_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def landlord_params
      params.require(:landlord).permit(:name, :description, :email, :phone_number, :address)
    end
end
