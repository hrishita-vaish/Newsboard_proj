require 'spec_helper'

  describe NewsDiscussionsController do

  before do
    @user = User.create!({
      :email => 'user@test.com',
      :password => 'please',
      :password_confirmation => 'please' 
    })
    sign_in @user
  end

  	def valid_attributes
    {:headline=>"what a winter!", 
     :content=>"many decades records break", 
     :name=>"Kanishka"
    }
	end

    #def valid_session
    	#{
    		#:email=>"abc@123.com",
    		#:password=>"123456"
    	#}
 	#end

  	describe "GET index" do
    it "assigns all discussions as @news_discussions" do
      newsdiscussion = NewsDiscussion.create! valid_attributes
      get :index, {}#, valid_session
      assigns(:news_discussions).should eq([newsdiscussion])
    end
    end

    describe "GET show" do
    it "assigns the requested discussion as @news_discussion" do
      newsdiscussion = NewsDiscussion.create! valid_attributes
      get :show, {:id => newsdiscussion.to_param}#, valid_session
      assigns(:news_discussion).should eq(newsdiscussion)
    end
  end

  describe "GET new" do
    it "assigns a new discussion as @news_discussion" do
      get :new, {}#, valid_session
      assigns(:news_discussion).should be_a_new(NewsDiscussion)
    end

    it "redirect back" do
      get :new, {:hl => nil}
      #if :hl == "winter"
        response.should redirect_to(news_discussions_url)
     # else
        #response.should redirect_to(news_discussions_url)
     #end
    end

    it "redirect to new page" do
      get :new, {:hl => "winter"}
      response.should render_template("new")
    end
  end

   describe "GET edit" do
    it "assigns the requested discussion as @news_discussion" do
      newsdiscussion = NewsDiscussion.create! valid_attributes
      get :edit, {:id => newsdiscussion.to_param}#, valid_session
      assigns(:news_discussion).should eq(newsdiscussion)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new discussion" do
        expect {
          post :create, {:news_discussion => valid_attributes}#, valid_session
        }.to change(NewsDiscussion, :count).by(1)
      end

      it "assigns a newly created discussion as @news_discussion" do
        post :create, {:news_discussion => valid_attributes}#, valid_session
        assigns(:news_discussion).should be_a(NewsDiscussion)
        assigns(:news_discussion).should be_persisted
      end

      it "redirects to the created discussion" do
        post :create, {:news_discussion => valid_attributes}#, valid_session
        response.should redirect_to(NewsDiscussion.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved discussion as @news_discussion" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewsDiscussion.any_instance.stub(:save).and_return(false)
        post :create, {:news_discussion => { "headline" => "invalid value" }}#, valid_session
        assigns(:news_discussion).should be_a_new(NewsDiscussion)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        NewsDiscussion.any_instance.stub(:save).and_return(false)
        post :create, {:news_discussion => { "headline" => "invalid value" }}#, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested discussion" do
        newsdiscussion = NewsDiscussion.create! valid_attributes
        p "============================" 
        p newsdiscussion
        # Assuming there are no other demos in the database, this
        # specifies that the Demo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.

        newsdiscussion.update_attribute(:headline, "MyString")
        #NewsDiscussion.any_instance.should_receive(:update_attributes).with({ "headline" => "MyString" })
        #put :update, {:id => newsdiscussion.to_param, :news_discussion => { "headline" => "MyString" }}
        p "============================" 
        p newsdiscussion
      end

      it "assigns the requested discussion as @news_discussion" do
        newsdiscussion = NewsDiscussion.create! valid_attributes
        put :update, {:id => newsdiscussion.to_param, :news_discussion => valid_attributes}
        assigns(:news_discussion).should eq(newsdiscussion)
      end

      it "redirects to the discussion" do
        newsdiscussion = NewsDiscussion.create! valid_attributes
        put :update, {:id => newsdiscussion.to_param, :news_discussion => valid_attributes}
        response.should redirect_to(newsdiscussion)
      end
    end

    describe "with invalid params" do
      it "assigns the discussion as @news_discussion" do
        newsdiscussion = NewsDiscussion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewsDiscussion.any_instance.stub(:save).and_return(false)
        put :update, {:id => newsdiscussion.to_param, :news_discussion => { "headline" => "invalid value" }}
        assigns(:news_discussion).should eq(newsdiscussion)
      end

      it "re-renders the 'edit' template" do
        newsdiscussion = NewsDiscussion.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        NewsDiscussion.any_instance.stub(:save).and_return(false)
        put :update, {:id => newsdiscussion.to_param, :news_discussion => { "headline" => "invalid value" }}  
        response.should render_template("edit")
      end
    end
  end

  before do
    @user = User.create!({
      :email => 'abc@123.com',
      :password => 'hrishita',
      :password_confirmation => 'hrishita',
      :role => 'admin'
    })
    sign_in @user
  end

   describe "DELETE destroy" do
    it "destroys the requested discussion" do
      newsdiscussion = NewsDiscussion.create! valid_attributes
      expect {
        delete :destroy, {:id => newsdiscussion.to_param}
      }.to change(NewsDiscussion, :count).by(-1)
    end

    it "redirects to the discussions list" do
      newsdiscussion = NewsDiscussion.create! valid_attributes
      delete :destroy, {:id => newsdiscussion.to_param}
      response.should redirect_to(news_discussions_url)
    end
  end

  end