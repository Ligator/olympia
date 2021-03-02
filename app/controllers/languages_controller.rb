class LanguagesController < ApplicationController
  def set_language
    if current_or_guest_user.locale == "en"
      current_or_guest_user.update_column(:locale, "es")
    else
      current_or_guest_user.update_column(:locale, "en")
    end
    redirect_to root_path
  end
end
