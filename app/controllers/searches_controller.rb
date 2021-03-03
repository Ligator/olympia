class SearchesController < ApplicationController

  def index
    if params[:filter].present?
      @users = User.where(["first_name ILIKE ? OR last_name ILIKE ?", "%#{params[:filter]}%", "%#{params[:filter]}%"])
      @stores = Store.where("name ILIKE ? OR description ILIKE ?", "%#{params[:filter]}%", "%#{params[:filter]}%")
      @products = Product.where("name ILIKE ? OR description ILIKE ?", "%#{params[:filter]}%", "%#{params[:filter]}%")
    end
  end

  def order_product_by_name
    @store = Store.find(params[:store_id])

  end

end
