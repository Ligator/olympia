json.extract! card, :id, :number_card, :name_bank, :titular_name, :expiration_date, :type, :created_at, :updated_at
json.url card_url(card, format: :json)
