require 'allmusic'

class HomeController < ApplicationController
  def index
  	@query = Query.new
  	@artist_query = Query.last
    @queries = Query.all.order('created_at DESC')
  	# temporarily hardcoding artist name for now -- once search is set up this will change to params:
  	# @artist = Allmusic.new("the roots")
  	@artist = Allmusic.new(@artist_query.artist_name)
  	@artist_amg_page = @artist.return_artist_url + "/related"
  	@artist_amg_page_object = Nokogiri::HTML(open(@artist_amg_page))
  	@artist_name = @artist_amg_page_object.css("h1[class='artist-name']").text.strip!
  	@influencers_array_4 = @artist_amg_page_object.css("section[class='related influencers']//a").first(4).compact
  	@artist_bio_page = @artist.return_artist_url + "/biography"
  	@artist_bio_page_object = Nokogiri::HTML(open(@artist_bio_page))
  	@artist_bio = @artist_bio_page_object.css("div[class='text']").text.strip!
  	# hardcoded version of Nokogiri parse:
  	# @artist_amg_page_object = Nokogiri::HTML(open("http://www.allmusic.com/artist/interpol-mn0000096576/related"))
  end

  def new
  	@home = Home.new
  end

  def create
  	@home = Home.new(home_params)
  	@home.save
  end

  def expand_roots
  	respond_to do |format|
			format.js
		end 
	end

end
