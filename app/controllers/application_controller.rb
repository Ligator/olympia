class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_or_guest_user.locale || I18n.default_locale
    @currency = locale == "es" ? "mxn" : "usd"
    I18n.with_locale(locale, &action)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :first_name, :last_name, :phone, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit({ roles: [] }, :first_name, :last_name, :phone, :email, :password, :password_confirmation, :current_password)
    end
  end
end

