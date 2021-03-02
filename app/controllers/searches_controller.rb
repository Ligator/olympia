class SearchesController < ApplicationController

  def index
    @user = User.where("email ILIKE ?", "%#{params[:filter]}%")
    @store = Store.where("name ILIKE ?", "%#{params[:filter]}%")
    @product = Product.where("name ILIKE ?", "%#{params[:filter]}%")
  end

end
