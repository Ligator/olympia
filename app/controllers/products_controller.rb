class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
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
    respond_to do |format|
      if @product.save
        format.html { redirect_to store_path(@product.store), notice: I18n.t(:product_was_created) }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @store = current_user.store
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product.store, notice: I18n.t(:product_was_updated) }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @store = current_user.store
    @product = @store.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: I18n.t(:successfully_destroy_product) }
      format.json { head :no_content }
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
