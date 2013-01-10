require 'spec_helper'

  describe NewsDiscussionsController do

  	def valid_attributes
    {:headline=>"what a winter!", 
     :content=>"many decades records break", 
     :name=>"Kanishka"
    }
	end

    def valid_session
    	{
    		:email=>"abc@123.com",
    		:encrypted_password=>"123456"
    	}
 	end

  	describe "GET index" do
    it "assigns all discussions as @news_discussions" do
      newsdiscussion = NewsDiscussion.create! valid_attributes
      get :index, {}, valid_session
      assigns(:news_discussions).should eq([newsdiscussion])
    end
    end
  end