class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    if params[:filter].present?
      @products = Product.
                    with_inventory.
                    where("name ILIKE ? OR description ILIKE ?", "%#{params[:filter]}%", "%#{params[:filter]}%").
                    with_attached_images
    else
      @products = Product.with_inventory.all.with_attached_images
    end
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
    price_in_cents = product_params[:price_in_cents].to_d * 100
    @store = current_user.store
    @product = @store.products.new(product_params.merge(price_in_cents: price_in_cents))
    @product.save
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    price_in_cents = product_params[:price_in_cents].to_d * 100
    @product.update(product_params.merge(price_in_cents: price_in_cents))
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @store = current_user.store
    @product = @store.products.find(params[:id])
    if @product.comments.present?
      flash[:alert] = "Un producto con comentarios no puede ser eliminado, si deseas que el producto desaparezca de la tienda coloque la cantidad de piezas en 0"
      respond_to do |format|
        format.html { redirect_to profile_products_path }
      end
    else
      @product.destroy
    end
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
