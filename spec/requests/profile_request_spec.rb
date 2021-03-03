require 'rails_helper'

RSpec.describe "Profiles", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/profile/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /profile" do
    it "returns http success" do
      get "/profile/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /shipments" do
    it "returns http success" do
      get "/profile/shipments"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /orders" do
    it "returns http success" do
      get "/profile/orders"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /products" do
    it "returns http success" do
      get "/profile/products"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /cards" do
    it "returns http success" do
      get "/profile/cards"
      expect(response).to have_http_status(:success)
    end
  end

end
