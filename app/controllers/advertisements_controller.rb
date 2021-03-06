class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]

  # GET /advertisements
  # GET /advertisements.json
  def index
    @advertisements = Advertisement.all
  end

  # GET /advertisements/1
  # GET /advertisements/1.json
  def show
    @advertisement = Advertisement.where(id: params[:id]).last
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
    @category = Category.where(id: params[:id]).last
  end

  # GET /advertisements/1/edit
  def edit
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    ActiveRecord::Base.transaction do
      @advertisement = Advertisement.new(advertisement_params)
      status = @advertisement.save
      @advertisement.main_image = params[:advertisement][:main_image] if params[:advertisement][:main_image].present?
      @advertisement.alternate_images = params[:advertisement][:alternative_images] if params[:advertisement][:alternative_images].present?
    end
    respond_to do |format|
      if status
        format.html { redirect_to "/", notice: 'Advertisement was successfully created.' }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1
  # PATCH/PUT /advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1
  # DELETE /advertisements/1.json
  def destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: 'Advertisement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisement_params
      params.require(:advertisement).permit(:category_id,:active,:title, :price, :make, :description, :kilometers, :year, :condition, :phone_number, :body_type, :color, :transition_type, :regional_specs, :no_of_cylinders, :doors, :horse_power, :warrenty, :fuel_type, :extras, :technical_features, :locate_your_item, :gps_coordinate)
    end
end
