require "spec_helper"

describe HaikuSearchesController do
  describe "routing" do

    it "routes to #index" do
      get("/haiku_searches").should route_to("haiku_searches#index")
    end

    it "routes to #new" do
      get("/haiku_searches/new").should route_to("haiku_searches#new")
    end

    it "routes to #show" do
      get("/haiku_searches/1").should route_to("haiku_searches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/haiku_searches/1/edit").should route_to("haiku_searches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/haiku_searches").should route_to("haiku_searches#create")
    end

    it "routes to #update" do
      put("/haiku_searches/1").should route_to("haiku_searches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/haiku_searches/1").should route_to("haiku_searches#destroy", :id => "1")
    end

  end
end
