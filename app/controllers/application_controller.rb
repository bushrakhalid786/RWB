class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_menu,:set_role
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.new_user_session_path, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id,:email_confirmation, :first_name, :last_name, :gender, :dob_day, :dob_month, :dob_year, :country_id, :designation, :education, :allow_third_party_emails, :allow_dubizzle_email_updates])
  end

  def set_menu
  	@categories = Category.where(parent_id: nil)
  end

  def set_role 
    @normal_user_role = Role.where(name: "Normal User").last
  end
  
end
