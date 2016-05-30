require 'allmusic'

class HomeController < ApplicationController
  def index
  	@home = Home.new
  end

  def new
  	@home = Home.new
  end

  def create
  	@home = Home.new(home_params)
  	@home.save

  end

  private
  
  def home_params
  	params.require(:home).permit(:artist_name)

  	# temporarily hardcoding artist name for now -- once search is set up this will change to params:
  	@artist = Allmusic.new("interpol")
  	@artist_amg_page = @artist.return_artist_url + "/related"
  	@artist_amg_page_object = Nokogiri::HTML(open(@artist_amg_page))
  	# hardcoded version of Nokogiri parse:
  	# @artist_amg_page_object = Nokogiri::HTML(open("http://www.allmusic.com/artist/interpol-mn0000096576/related"))

  end
end
