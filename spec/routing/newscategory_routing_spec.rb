require "spec_helper"

describe NewscategoryController do
  describe "routing" do
  	 it "routes to index page" do
      get("/newscategorys").should route_to("newscategory#index")
    end
  end
end