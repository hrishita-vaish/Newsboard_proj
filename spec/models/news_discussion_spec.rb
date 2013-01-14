require 'spec_helper'

describe "News Discussion model" do
	describe "with valid params" do
 		it 'valid when all the arguments are passed' do
    		NewsDiscussion.new(:headline=>"what a winter!", :content=>"many decades' records break", :name=>"Kanishka").should be_valid
   		end

   		it 'valid when all the arguments passed are string' do
    		newsdiscussion = NewsDiscussion.new(:headline=>"what a winter!", :content=>"many decades records break", :name=>"Kanishka")
   			newsdiscussion.headline.should be_a(String)
   			newsdiscussion.content.should be_a(String)
   			newsdiscussion.name.should be_a(String)
   		end
   	end
   	describe "with invalid params" do
 		it 'invalid when headline is not passed' do
    		NewsDiscussion.new(:headline=>nil, :content=>"many decades' records break", :name=>"Kanishka").should_not be_valid
   		end

   		it 'invalid when content is not passed' do
    		NewsDiscussion.new(:headline=>"what a winter!", :content=>nil, :name=>"Kanishka").should_not be_valid
   		end

   		it 'invalid when name is not passed' do
    		NewsDiscussion.new(:headline=>"what a winter!", :content=>"many decades' records break", :name=>nil).should_not be_valid
   		end

   		it 'invalid when any argument is not string' do
    		newsdiscussion = NewsDiscussion.new(:headline=>1234, :content=>"many decades records break", :name=>"Kanishka")
   			newsdiscussion.headline.should_not be_a(String)
   			newsdiscussion.content.should be_a(String)
   			newsdiscussion.name.should be_a(String)
   		end

   		it 'valid when all the arguments passed are string' do
    		newsdiscussion = NewsDiscussion.new(:headline=>"what a winter!", :content=>1234, :name=>"Kanishka")
   			newsdiscussion.headline.should be_a(String)
   			newsdiscussion.content.should_not be_a(String)
   			newsdiscussion.name.should be_a(String)
   		end

   		it 'valid when all the arguments passed are string' do
    		newsdiscussion = NewsDiscussion.new(:headline=>"what a winter!", :content=>"many decades records break", :name=>nil)
   			newsdiscussion.headline.should be_a(String)
   			newsdiscussion.content.should be_a(String)
   			newsdiscussion.name.should_not be_a(String)
   		end
   	end
   	it "should have many users" do
    	news = NewsDiscussion.reflect_on_association(:comments)
    	news.macro.should == :has_many
    end

  it "comments should be destroyed when discussion is destroyed" do
    newsdiscussion = NewsDiscussion.create(:headline => "too much fog")
    newsdiscussion.comments << Comment.create(:body => "visibility hampered")
    p "+++++++++++++++++"
    p newsdiscussion
    p newsdiscussion.comments
    expect {
    newsdiscussion.destroy
    }.to change(Comment, :count).by(-1)
    NewsDiscussion.all.should_not include("visibility hampered")
    p "!!!!!!!!!!!!!!!!!!!!!!!"
    p newsdiscussion
    p newsdiscussion.comments
  end
end