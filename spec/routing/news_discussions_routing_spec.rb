require "spec_helper"

describe NewsDiscussionsController do
  describe "routing" do

    it "routes to #index" do
      get("/news_discussions").should route_to("news_discussions#index")
    end

    it "routes to #new" do
      #newsdiscussion = NewsDiscussion.create! (:headline=> "winter", :content=> "very cold", :name=> "hrishita")
      #if :hl = newsdiscussion.to_param
      #get("/news_discussions/new").should route_to("news_discussions#new")
    #else
      get("/news_discussions/new").should route_to("news_discussions#new")
    #end
    end

    it "routes to #show" do
      get("/news_discussions/1").should route_to("news_discussions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/news_discussions/1/edit").should route_to("news_discussions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/news_discussions").should route_to("news_discussions#create")
    end

    it "routes to #update" do
      put("/news_discussions/1").should route_to("news_discussions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/news_discussions/1").should route_to("news_discussions#destroy", :id => "1")
    end

  end
end

