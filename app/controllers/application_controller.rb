class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_menu
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.new_user_session_path, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email_confirmation, :first_name, :last_name, :gender, :dob_day, :dob_month, :dob_year, :country_id, :designation, :education, :allow_third_party_emails, :allow_dubizzle_email_updates])
  end

  def set_menu
  	@categories = Category.where(parent_id: nil)
  end
  
end
