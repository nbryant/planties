require "rails_helper"

RSpec.describe PlantsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/plants").to route_to("plants#index", :format => :json)
    end


    it "routes to #show" do
      expect(:get => "/plants/1").to route_to("plants#show", :id => "1", :format => :json)
    end


    it "routes to #create" do
      expect(:post => "/plants").to route_to("plants#create", :format => :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/plants/1").to route_to("plants#update", :id => "1", :format => :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/plants/1").to route_to("plants#update", :id => "1", :format => :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/plants/1").to route_to("plants#destroy", :id => "1", :format => :json)
    end

  end
end
