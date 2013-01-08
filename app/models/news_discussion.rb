class NewsDiscussion < ActiveRecord::Base
	attr_accessible :headline, :content, :name

	validates :headline,  :presence => true
	validates :content,  :presence => true
	validates :name,  :presence => true

	has_many :comments, :dependent => :destroy
end
