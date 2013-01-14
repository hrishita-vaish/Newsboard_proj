require 'spec_helper'

describe CommentsController do

	def valid_attributes
    	{ 
        "commenter" => "hrishita",
      	 "body" => "reading",
        # @news_discussion = NewsDiscussion.create(:headline => "winter", :content => "temperatures drops", :name => "hrishita")
    	}
  end

  	def valid_session
    	{}
  	end
  	
  	before(:each) do
 	 	  @news_discussion = NewsDiscussion.create(:headline => "winter", :content => "temperatures drops", :name => "hrishita")
  		@comment = {:commenter => "hrish", :body => "very cold"}
      p "+=+=+=+=+==+====++++=+=+="
       p @new_discussion
	end

	describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment for the discussion" do
        expect {
          #post :create, {:comment => valid_attributes}#, valid_session
          post :create, :comment => @comment, :news_discussion_id => @news_discussion.id
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        #post :create, {:comment => valid_attributes}#, valid_session
        post :create, :comment => @comment, :news_discussion_id => @news_discussion.id
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the created comment" do
        #post :create, {:comment => valid_attributes}#, valid_session
        post :create, :comment => @comment, :news_discussion_id => @news_discussion.id
        #response.should redirect_to(NewsDiscussion.Comment.last)
        response.should redirect_to news_discussion_path(@news_discussion)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        #post :create, {:comment => { "name" => "invalid value" }}#, valid_session
        post :create, :comment => @comment, :news_discussion_id => @news_discussion.id
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-redirects to the newsdiscussion/show page" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        #post :create, {:comment => { "name" => "invalid value" }}#, valid_session
        post :create, :comment => @comment, :news_discussion_id => @news_discussion.id
        #response.should render_template("new")
        response.should redirect_to news_discussion_path(@news_discussion)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the corresponding comment" do
      comment = Comment.create! valid_attributes #@comment, :news_discussion_id => @news_discussion.id#valid_attributes
      p "?????????????????????????"
      p comment
      p "hhhhhhhhhhhhhhhhhhhh"
      p @news_discussion
      p @news_discussion.id
      #comment = Comment.create! {:comment => @comment, :news_discussion_id => @news_discussion.id}
      #comment = @comment, :news_discussion_id => @news_discussion.id
      #expect { delete :destroy, :comment => @comment, :news_discussion_id => @news_discussion.id
        delete :destroy, {:news_discussion_id => @news_discussion.id.to_param, :id => comment.to_param}
      #}.to change(Comment, :count).by(-1)
    end

    it "redirects to the discussions and comments list" do
      comment = Comment.create! valid_attributes
      #post :create, :comment => @comment, :news_discussion_id => @news_discussion.id
      delete :destroy, {:id => comment.to_param}#, valid_session
      response.should redirect_to news_discussion_path(@news_discussion)
    end
  end
 end