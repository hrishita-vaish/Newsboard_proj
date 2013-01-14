require "spec_helper"

describe NewscategoryController do
  describe "routing" do
  	 it "routes to index page" do
      #get("/newscategory").should route_to("newscategory#index")

      expect(:get => "/newscategory").to route_to(
      :controller => "newscategory",
      :action => "index"
    )
    end
  end
end