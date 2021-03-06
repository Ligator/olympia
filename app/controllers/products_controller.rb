class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.with_inventory.all
  end

  # GET /products/1 or /products/1.json
  def show
    @store = Store.find(params[:store_id])
    @product = @store.products.find(params[:id])
    @comment = @product.comments.build
  end

  # GET /products/new
  def new
    @store = current_user.store
    @product = @store.products.build
  end

  # GET /products/1/edit
  def edit
    @store = current_user.store
    @product = @store.products.find(params[:id])
  end

  # POST /products or /products.json
  def create
    @store = current_user.store
    @product = @store.products.new(product_params)
    @product.save
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.update(product_params)
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @store = current_user.store
    @product = @store.products.find(params[:id])
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents, :size, :quantity, images: [])
    end
end
