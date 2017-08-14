class UsersController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: :add_bookmark

  def my_profile
  	@user = current_user
  	@advertisements = @user.advertisements
    bookmarks = current_user.bookmarks.pluck("advertisement_id").uniq
    @bookmark_advertisements = Advertisement.where(id: bookmarks)
  	render "my_profile"
  end

  def add_bookmark
    Bookmark.create(advertisement_id: params[:advertisement_id],user_id: params[:user_id])
    return false
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email_confirmation, :first_name, :last_name, :gender, :dob_day, :dob_month, :dob_year, :country_id, :designation, :education, :allow_third_party_emails, :allow_dubizzle_email_updates])
  end
end