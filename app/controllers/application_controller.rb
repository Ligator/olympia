class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_or_guest_user.locale || I18n.default_locale
    @currency = locale == "es" ? "mxn" : "usd"
    I18n.with_locale(locale, &action)
  end
end
