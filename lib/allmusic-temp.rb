# temporary file for storing code from allmusic.rb that needs to be removed for testing purposes

def root_row
  @root_row = []
  self.related.each do |i|
    @root_row << Allmusic.new(i.text)
  end
  @root_row
end

def row_mapper(n)
  @root_row
end



<img src="<%= i.artist_image %>" class="influencer-image">


<script>
	$("#<%= i.text.gsub(" ", "-").downcase %>").click(function(){
		$("#influencers-wrapper").append("<% if i.root_row[0] == nil %><div class='influencers'>No Results</div><% else %><% i.root_row.each do |k| %><div class='influencers'><%= k.text.strip %><br><img src='<%= k.artist_image %>' class='influencer-image'><form class='new_query' id='new_query' action='/queries' accept-charset='UTF-8' data-remote='true' method='post'><input name='utf8' type='hidden' value='✓'><input value='<%= k.text %>' type='hidden' name='query[artist_name]' id='query_artist_name'><input type='submit' name='commit' value='See More'></form><br><button type='button' class='growth-button' id='<%= k.text.gsub(" ", "-").downcase %>'>VVV</button></div><% end %><% end %>");
	});
</script>


<!-- work in progress - do not remove -->
<!-- need to add query form -->

<script>
	
	$(document).ready(function(){

	// $('.see-more').click(function(){
	// 	alert("woot");
	// 	$("#influencers-1").append("<br><div id='influencers-2'><% if @artist.root_row[0] == nil %><div class='influencers'>No Results</div><% else %><% @artist.root_row.each do |i| %><div class='influencers'><%= i.artist_name %><br><br><%= form_for @query, remote: true do |f| %><%= f.hidden_field :artist_name, :value => i.artist_name %><%= f.submit 'See More' %><% end %><button type='button' class='btn btn-success see-more2'>VVV</button></div><% end %><% end %></div>");

	// 	window.scrollTo(0,document.body.scrollHeight);
	// })

});

</script>