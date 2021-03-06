class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  # GET /stores or /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1 or /stores/1.json
  def show
    @store = Store.find(params[:id])
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores or /stores.json
  def create
    if current_user.store.nil?
      @store = current_user.build_store(store_params)
      respond_to do |format|
        if @store.save
          format.html { redirect_to @store, notice: I18n.t(:store_was_created)  }
          format.json { render :show, status: :created, location: @store }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = I18n.t(:store_exists)
      redirect_to stores_path
    end
  end

  # PATCH/PUT /stores/1 or /stores/1.json
  def update
    if current_user.store.eql?(@store)
      respond_to do |format|
        if @store.update(store_params)
          format.html { redirect_to @store, notice: I18n.t(:store_was_updated) }
          format.json { render :show, status: :ok, location: @store }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @store.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:alert] = I18n.t(:cannot_edit_store)
      render :index
    end
  end

  # DELETE /stores/1 or /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: I18n.t(:successfully_destroy_store) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :description)
    end
end
