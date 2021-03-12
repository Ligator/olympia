require "rails_helper"

RSpec.describe AgremmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/agremments").to route_to("agremments#index")
    end

    it "routes to #new" do
      expect(get: "/agremments/new").to route_to("agremments#new")
    end

    it "routes to #show" do
      expect(get: "/agremments/1").to route_to("agremments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/agremments/1/edit").to route_to("agremments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/agremments").to route_to("agremments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/agremments/1").to route_to("agremments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/agremments/1").to route_to("agremments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/agremments/1").to route_to("agremments#destroy", id: "1")
    end
  end
end
