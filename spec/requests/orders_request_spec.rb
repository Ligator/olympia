require 'rails_helper'

RSpec.describe "Orders", type: :request do

  describe "GET /cart" do
    it "returns http success" do
      get "/orders/cart"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /checkout" do
    it "returns http success" do
      get "/orders/checkout"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /thank_you" do
    it "returns http success" do
      get "/orders/thank_you"
      expect(response).to have_http_status(:success)
    end
  end

end
