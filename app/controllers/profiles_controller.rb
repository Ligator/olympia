class ProfilesController < ApplicationController
  def index
    render layout: 'profile'
  end

  def show
    if current_user.blank? || current_user.store.blank?
      redirect_to statics_home_path
      return
    end
    render layout: 'profile'
  end

  def shipments
    render layout: 'profile'
  end

  def orders
    render layout: 'profile'
  end

  def products
    render layout: 'profile'
  end

  def cards
    render layout: 'profile'
  end

end
