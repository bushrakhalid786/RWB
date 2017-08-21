class AdvertisementsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

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
    @category = @advertisement.category if @advertisement.present?
    @parent_category = @category.parent if @category.present?
    @bookmark_present = current_user.bookmarks.where(advertisement_id: @advertisement.id).present? rescue nil
    @ad_reply = AdReply.new
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
    @category = Category.where(id: params[:id]).last
  end

  # GET /advertisements/1/edit
  def edit
    @advertisement = Advertisement.where(id: params[:id]).last
    @category = @advertisement.category
  end

  # POST /advertisements
  # POST /advertisements.json
  def create
    ActiveRecord::Base.transaction do
      @advertisement = Advertisement.new(advertisement_params)
      status = @advertisement.save(:validate => false)
      @advertisement.main_image = params[:main_image] if params[:main_image].present?
      @advertisement.alternate_images = params[:alternative_images] if params[:alternative_images].present?
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
    ActiveRecord::Base.transaction do
      @advertisement.attributes = (advertisement_params)
      status = @advertisement.save(:validate => false)
      @advertisement.main_image = params[:main_image] if params[:main_image].present?
      @advertisement.alternate_images = params[:alternative_images] if params[:alternative_images].present?
    end
    respond_to do |format|
      if status
        format.html { redirect_to "/", notice: 'Advertisement was successfully updated.' }
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
      format.html { redirect_to "/", notice: 'Advertisement was successfully destroyed.' }
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
      technical_features = params[:advertisement][:extras].present? ? params[:advertisement][:technical_features].join(",") : nil
      extras = params[:advertisement][:extras].present? ? params[:advertisement][:extras].join(",") : nil
      p = params.require(:advertisement).permit(:extras, :technical_features,:user_id,:make_id,:location_id,:category_id,:active,:title, :price, :make, :description, :kilometers, :year, :condition, :phone_number, :body_type, :color, :transition_type, :regional_specs, :no_of_cylinders, :doors, :horse_power, :warrenty, :fuel_type, :extras, :technical_features, :locate_your_item, :gps_coordinate)
      p.merge!({:technical_features => technical_features,:extras => extras})
    end
end
