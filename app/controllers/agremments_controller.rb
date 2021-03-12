class AgremmentsController < ApplicationController
  before_action :set_agremment, only: %i[ show edit update destroy ]

  # GET /agremments or /agremments.json
  def index
    @agremments = Agremment.all
  end

  # GET /agremments/1 or /agremments/1.json
  def show
  end

  # GET /agremments/new
  def new
    @agremment = Agremment.new
  end

  # GET /agremments/1/edit
  def edit
  end

  # POST /agremments or /agremments.json
  def create
    @agremment = Agremment.new(agremment_params)

    respond_to do |format|
      if @agremment.save
        format.html { redirect_to @agremment, notice: "Agremment was successfully created." }
        format.json { render :show, status: :created, location: @agremment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agremment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agremments/1 or /agremments/1.json
  def update
    respond_to do |format|
      if @agremment.update(agremment_params)
        format.html { redirect_to @agremment, notice: "Agremment was successfully updated." }
        format.json { render :show, status: :ok, location: @agremment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agremment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agremments/1 or /agremments/1.json
  def destroy
    @agremment.destroy
    respond_to do |format|
      format.html { redirect_to agremments_url, notice: "Agremment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agremment
      @agremment = Agremment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agremment_params
      params.require(:agremment).permit(:title, :description, :state, :users_id)
    end
end
