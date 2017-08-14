class AdRepliesController < ApplicationController
  before_action :set_ad_reply, only: [:show, :edit, :update, :destroy]

  # GET /ad_replies
  # GET /ad_replies.json
  def index
    @ad_replies = AdReply.all
  end

  # GET /ad_replies/1
  # GET /ad_replies/1.json
  def show
  end

  # GET /ad_replies/new
  def new
    @ad_reply = AdReply.new
  end

  # GET /ad_replies/1/edit
  def edit
  end

  # POST /ad_replies
  # POST /ad_replies.json
  def create
    @ad_reply = AdReply.new(ad_reply_params)
    advertisement = @ad_reply.advertisement
    respond_to do |format|
      if @ad_reply.save
        AdReplyMailer.reply_email(@ad_reply,advertisement).deliver
        format.html { redirect_to advertisement_path(ad_reply_params[:advertisement_id]), notice: 'Ad reply was successfully Sent.' }
        format.json { render :show, status: :created, location: @ad_reply }
      else
        format.html { render :new }
        format.json { render json: @ad_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ad_replies/1
  # PATCH/PUT /ad_replies/1.json
  def update
    respond_to do |format|
      if @ad_reply.update(ad_reply_params)
        format.html { redirect_to @ad_reply, notice: 'Ad reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad_reply }
      else
        format.html { render :edit }
        format.json { render json: @ad_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ad_replies/1
  # DELETE /ad_replies/1.json
  def destroy
    @ad_reply.destroy
    respond_to do |format|
      format.html { redirect_to ad_replies_url, notice: 'Ad reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad_reply
      @ad_reply = AdReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_reply_params
      params.require(:ad_reply).permit(:email,:phone_number,:message,:advertisement_id)
    end
end
