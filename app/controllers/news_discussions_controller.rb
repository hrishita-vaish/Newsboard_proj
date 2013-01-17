class NewsDiscussionsController < ApplicationController
  # GET /news_discussions
  # GET /news_discussions.json
  load_and_authorize_resource
  before_filter :authenticate_user!
  #before_filter :news_headline
 # @@hd=@hd
  
   def index
    @news_discussions = NewsDiscussion.all
    @news_discussions = NewsDiscussion.order("id asc").page( params[:page]).per(6)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_discussions }
    end
  end

  # GET /news_discussions/1
  # GET /news_discussions/1.json
  def show
    @news_discussion = NewsDiscussion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news_discussion }
    end
  end

  # GET /news_discussions/new
  # GET /news_discussions/new.json
  def new
    @name = params[:name]
    @hd = params[:hl]
    @news_discussion = NewsDiscussion.new
    respond_to do |format|
    if @hd==nil
      format.html {redirect_to @news_discussion}
    else
      format.html # new.html.erb
      format.json { render json: @news_discussion }
    end
    end
  end

  # GET /news_discussions/1/edit
  def edit
    #@hd=@@hd
    @news_discussion = NewsDiscussion.find(params[:id])
  end

  # POST /news_discussions
  # POST /news_discussions.json
  def create
    @news_discussion = NewsDiscussion.new(params[:news_discussion])
    respond_to do |format|
      if @news_discussion.save
        format.html { redirect_to @news_discussion, notice: 'News discussion was successfully created.' }
        format.json { render json: @news_discussion, status: :created, location: @news_discussion }
      else
        format.html { render action: "new" }
        format.json { render json: @news_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news_discussions/1
  # PUT /news_discussions/1.json
  def update
    @news_discussion = NewsDiscussion.find(params[:id])
    respond_to do |format|
      if @news_discussion.update_attributes(params[:news_discussion])
        format.html { redirect_to @news_discussion, notice: 'News discussion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_discussions/1
  # DELETE /news_discussions/1.json
  def destroy
    @news_discussion = NewsDiscussion.find(params[:id])
    @news_discussion.destroy

    respond_to do |format|
      format.html { redirect_to news_discussions_url }
      format.json { head :no_content }
    end
  end
end
