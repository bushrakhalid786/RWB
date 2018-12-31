class UsersController < ApplicationController
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email_confirmation, :first_name, :last_name, :gender, :dob_day, :dob_month, :dob_year, :country_id, :designation, :education, :allow_third_party_emails, :allow_dubizzle_email_updates])
  end
end