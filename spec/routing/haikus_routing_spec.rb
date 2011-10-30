require "spec_helper"

describe HaikusController do
  describe "routing" do

    it "routes to #index" do
      get("/haikus").should route_to("haikus#index")
    end

    it "routes to #new" do
      get("/haikus/new").should route_to("haikus#new")
    end

    it "routes to #show" do
      get("/haikus/1").should route_to("haikus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/haikus/1/edit").should route_to("haikus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/haikus").should route_to("haikus#create")
    end

    it "routes to #update" do
      put("/haikus/1").should route_to("haikus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/haikus/1").should route_to("haikus#destroy", :id => "1")
    end

  end
end
