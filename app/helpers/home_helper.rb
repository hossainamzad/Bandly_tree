module HomeHelper

	# A new instance of this class with the argument "Artist" will return Artist's All Music Guide URL by calling instance.return_artist_url
	# Modified/simplified version of Richard J. Lyon's allmusic Gem: https://github.com/richardjlyon/allmusic
	class Allmusic

	def initialize( artist = nil )
    @artist = artist
  end

  # def url
  #   return @artist_url
  # end

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

end
