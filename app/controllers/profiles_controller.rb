class ProfilesController < ApplicationController
  before_action :layout_profile
  def index
  end

  def show
  end

  def shipments
  end

  def orders
  end

  def products
  end

  def cards
  end

  private
    def layout_profile
      render layout: 'profile'
    end
end
