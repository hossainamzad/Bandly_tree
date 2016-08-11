# testing a refactored version of this class

require 'nokogiri'
require 'fuzzystringmatch'

module Artistlink
	attr :artist_url

  def make_url(root, path)
		clean_url = URI.escape(File.join(root, path))
		return clean_url
	end

	def return_artist_url
  	# general AMG search URL
  	search_url = "http://www.allmusic.com/search/artists/"
  	# constructor function that appends artist name to search URL
  	artist_search_url = make_url(search_url, @artist)
  	# compiles search results into Nokogiri object
  	artist_search_page = Nokogiri::HTML(open(artist_search_url))
    puts "scrape artist url " + artist_search_url
  	# parses Nokogiri object and returns array of possible matches
  	artist_urls = artist_search_page.xpath("//ul[@class='search-results']//div[@class='name']/a")
  	# uses fuzzystringmatch to find most viable match
  	@artist_url = best_match(@artist, artist_urls)
  end

  # might need this method if search results page comes up empty:

  # def no_search_result?(page)
  #   return !page.xpath('//div[@class="no-results"]').empty?
  # end

  # fuzzystringmatch gem for finding most likely match
  def best_match(target, candidates)
    confidence = 0
    best_url = nil
    jarow = FuzzyStringMatch::JaroWinkler.create( :native )
    candidates.each do |candidate|
      title = candidate.text
      distance = jarow.getDistance(target, title)
      if distance > confidence
        confidence = distance
        best_url = candidate['href']
      end
    end
    return best_url
  end

end


class Allmusic

	include Artistlink

	def initialize( artist = nil )
    @artist = artist
  end

  def artist_name
    @artist.split.map(&:capitalize).join(' ')
  end

  def related
    self.return_artist_url
    artist_related_url = @artist_url + "/related"
    artist_related_url_object = Nokogiri::HTML(open(artist_related_url))
    puts "scrape related " + @artist_url
    @influencers_array_4 = artist_related_url_object.css("section[class='related influencers']//a").first(4).compact
  end

  def bio
    self.return_artist_url
    artist_bio_url = @artist_url + "/biography"
    artist_bio_url_object = Nokogiri::HTML(open(artist_bio_url))
    puts "scrape bio " + @artist_url
    @artist_bio = artist_bio_url_object.css("div[class='text']").text.strip!
  end

  def short_bio
    self.return_artist_url
    artist_bio_url = @artist_url + "/biography"
    artist_bio_url_object = Nokogiri::HTML(open(artist_bio_url))
    puts "scrape short bio " + @artist_url
    if
      artist_bio_string = artist_bio_url_object.css("div[class='text']").text.strip!
      @short_bio = artist_bio_string[0..800]
    else
      @short_bio = ""
    end
  end

  def amg_artist_name
    self.return_artist_url
    artist_url_object = Nokogiri::HTML(open(@artist_url))
    puts "scrape artist name " + @artist_url
    @amg_artist_name = artist_url_object.css("h1[class='artist-name']").text.strip!
  end

  def artist_image
    self.return_artist_url
    artist_url_object = Nokogiri::HTML(open(@artist_url))
    puts "scrape artist image " + @artist_url
    artist_image_url_object = artist_url_object.css("div[class='artist-image']//img")
    if artist_image_url_object.length == 0
      @artist_image_url = "http://watercoolerconvos.com/wp-content/uploads/2014/12/IHOP-fleek.jpg"
    else
      @artist_image_url = artist_image_url_object[0]['src'].chomp('?partner=allrovi.com')
    end
  end
end