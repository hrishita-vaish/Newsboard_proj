require 'spec_helper'

describe "Comment model" do
	describe "with valid params" do
 	it 'valid when both the arguments are passed' do
    	Comment.new(:commenter=>"himanshu", :body=>"too much cold").should be_valid
    end

    it 'could be without commenter' do
    	Comment.new(:commenter=>nil, :body=>"too much cold").should be_valid
    end
	end

	describe "with invalid params" do
		it 'should not be without body' do
			Comment.new(:commenter=>nil, :body=>nil).should_not be_valid
		end

		it 'body should not be valid without a string argument' do
			comment = Comment.new(:commenter=>nil, :body=>123)
			comment.body.should_not be_a(String)
		end

		it 'commenter should not be valid without a string argument' do
			comment = Comment.new(:commenter=>123, :body=>"too much cold")
			comment.commenter.should_not be_a(String)
		end
	end
	it "should belong to a news discussion" do
    	newscomment = Comment.reflect_on_association(:news_discussion)
    	newscomment.macro.should == :belongs_to
    end
end