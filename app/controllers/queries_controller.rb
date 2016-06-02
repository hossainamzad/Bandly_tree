require 'allmusic'

class QueriesController < ApplicationController

  def index
    @query = Query.last
    @queries = Query.all.order('created_at DESC')
      # @queries = Query.all(:order => "created_at DESC")
      # @queries = Query.find(:all, :order => "id desc", :limit => 10).reverse 
  end

  def new
  	@query = Query.new
  end

  def create
  	@query = Query.new(query_params)
    # @query.save
    # redirect_to home_index_path
    respond_to do |format|
      if @query.save
        @artist_query = Query.last
        @artist = Allmusic.new(@artist_query.artist_name)

        # we should be able to delete all the commented out code here:
        # @artist_amg_page = @artist.return_artist_url + "/related"
        # @artist_amg_page_object = Nokogiri::HTML(open(@artist_amg_page))
        # @artist_name = @artist_amg_page_object.css("h1[class='artist-name']").text.strip!
        # @influencers_array_4 = @artist_amg_page_object.css("section[class='related influencers']//a").first(4).compact

        # @artist_bio_page = @artist.return_artist_url + "/biography"
        # @artist_bio_page_object = Nokogiri::HTML(open(@artist_bio_page))
        # @artist_bio = @artist_bio_page_object.css("div[class='text']").text.strip!
        format.html { redirect_to :back, notice: 'You searched for....' }
        format.json { render :show, status: :created, location: @query }
        format.js
      else
        format.html { render :new }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def query_params
  	params.require(:query).permit(:artist_name)
  end

end
