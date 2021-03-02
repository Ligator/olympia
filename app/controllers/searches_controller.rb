class SearchesController < ApplicationController

  def index
    @users = User.where("email ILIKE ?", "%#{params[:filter]}%")
    @stores = Store.where("name ILIKE ?", "%#{params[:filter]}%")
    @products = Product.where("name ILIKE ?", "%#{params[:filter]}%")
  end

end
