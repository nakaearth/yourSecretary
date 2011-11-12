require "spec_helper"

describe HaikuSearch2sController do
  describe "routing" do

    it "routes to #index" do
      get("/haiku_search2s").should route_to("haiku_search2s#index")
    end

    it "routes to #new" do
      get("/haiku_search2s/new").should route_to("haiku_search2s#new")
    end

    it "routes to #show" do
      get("/haiku_search2s/1").should route_to("haiku_search2s#show", :id => "1")
    end

    it "routes to #edit" do
      get("/haiku_search2s/1/edit").should route_to("haiku_search2s#edit", :id => "1")
    end

    it "routes to #create" do
      post("/haiku_search2s").should route_to("haiku_search2s#create")
    end

    it "routes to #update" do
      put("/haiku_search2s/1").should route_to("haiku_search2s#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/haiku_search2s/1").should route_to("haiku_search2s#destroy", :id => "1")
    end

  end
end
