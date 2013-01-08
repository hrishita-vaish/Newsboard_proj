class CommentsController < ApplicationController
	def create
    @news_discussions = NewsDiscussion.find(params[:news_discussion_id])
    @comment = @news_discussions.comments.create(params[:comment])
    redirect_to news_discussion_path(@news_discussions)
  end

  def destroy
    @news_discussions = NewsDiscussion.find(params[:news_discussion_id])
    @comment = @news_discussions.comments.find(params[:id])
    @comment.destroy
    redirect_to news_discussion_path(@news_discussions)
  end
end
