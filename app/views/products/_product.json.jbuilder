json.extract! product, :id, :name, :description, :price_in_cents, :size, :quantity, :store_id, :created_at, :updated_at
json.url product_url(product, format: :json)
