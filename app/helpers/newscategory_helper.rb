module NewscategoryHelper

	def newsheadline(newsobj)
		news = Hash.new "newsobj"
		news.items.each do |n|
        	p n.try(:title)		
        	headline = n.try(:title)
        	link_article = n.try(:link)
    	end
	end
end