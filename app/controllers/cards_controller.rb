class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1 or /cards/1.json
  def show
    @card = current_user.build_card
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = current_user.build_card(card_params)
    @card.save
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    @card.update(card_params)
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = current_user.card
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:number_card, :name_bank, :titular_name, :expiration_date, :type, :user_id)
    end
end
