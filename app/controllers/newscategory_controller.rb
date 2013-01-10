class NewscategoryController < ApplicationController
#include 'newscategory_helper'
 #before_filter :authenticate_user!
   require 'simple-rss'
  require 'open-uri'


def index
  @rss = SimpleRSS.parse open("http://rss.cnn.com/rss/cnn_latest.rss")
  @rssp = SimpleRSS.parse open("http://feeds.hindustantimes.com/HT-HomePage-TopStories")
  @rssb = SimpleRSS.parse open("http://rss.cnn.com/rss/edition_business.rss")
  @rsssp = SimpleRSS.parse open("http://rss.cnn.com/rss/edition_sport.rss")
end
 
  def latestnews_page
  	
  end

  def popularnews_page
  	
  end

  def businessnews_page
  
  end

  def sportsnews_page
  	
  end

   def description
 	 @hd ,@rsss, @a_link = params[:hl] ,params[:rss] ,params[:al]
  end
  def aboutus
  end
end