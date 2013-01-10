class Comment < ActiveRecord::Base
  belongs_to :news_discussion
  attr_accessible :commenter, :body

  #validates :commenter,  :presence => true
  validates :body,  :presence => true
end
