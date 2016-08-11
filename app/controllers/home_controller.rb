require 'allmusic'

class HomeController < ApplicationController
  def index
  	@query = Query.new
  	@artist_query = Query.last
    @queries = Query.all.order('created_at DESC')
  	@artist = Allmusic.new(@artist_query.artist_name)
  	# @artist_bio_page = @artist.return_artist_url + "/biography"
  	# we should be able to remove all code below this line (and before end):

  	# @artist_amg_page = @artist.return_artist_url + "/related"
  	# @artist_amg_page_object = Nokogiri::HTML(open(@artist_amg_page))
  	# @artist_name = @artist_amg_page_object.css("h1[class='artist-name']").text.strip!
  	# @influencers_array_4 = @artist_amg_page_object.css("section[class='related influencers']//a").first(4).compact
  	# @artist_bio_page_object = Nokogiri::HTML(open(@artist_bio_page))
  	# @artist_bio = @artist_bio_page_object.css("div[class='text']").text.strip!
  end

end
