$(document).ready(function(){


	var search = function(query){
		$.ajax({
			type: "GET",
			url: 'https://api.spotify.com/v1/search',
			data: {
				q: query,
				type: 'artist'
			}, 
			success: function(response){
				update(response)
				console.log(response)
				var id = response.artists.items[0].id;
				get_tracks(id)
			}
		});


		var get_tracks = function(x){
			$.ajax({
				type: "GET",
				url: "https://api.spotify.com/v1/artists/"+x+"/top-tracks?country=US",
				success: function(response){
					console.log(response);
					gen_tracks(response);
				}
			});
		};
	};


var update = function(x){
		clear_tracks();
		var i = 0
		var artist = x.artists.items[0];
		console.log(artist);
		var name = artist.name;
		var bio = artist.description;
		var image = artist.images[i].url;
		var width = artist.images[i].width;
		var height = artist.images[i].height;
		var images = artist.images;
		var url = artist.external_urls.spotify;


		artist_pic(artist, i);
		
	};

	var artist_pic = function(x, y){
		var image = x.images[y].url;
		$('#artist-image').html("<img src='" + image + "'></img>");
	};

	var clear_tracks = function(){
		$('#tracks').empty();
	}

	var clear_play = function(){
		$('#npTitle').empty();
		$('#play').empty();
	}


	var gen_tracks = function(x){
		clear_tracks();
		$('#tt_title').text("Top Tracks");
		$('#tt_subtitle').text("select a song to listen")

		var tracks = x.tracks;
		for(var t = 0; t < tracks.length && t < 5; t++){
			$('#tracks').append("<li class='track_text' data-track="+tracks[t].uri+">"+tracks[t].name+"</li>")
		};

		$('.track_text').on('click', function(){
			clear_play();
			uri = $(this).data("track");
			console.log(uri)
			$('#npTitle').text("Now Playing");
			$('#play').append("<iframe src='https://embed.spotify.com/?uri="+uri+"' width='300' frameborder='0'></iframe>")
		});
	};

	

	x = $('#artist-name').html();
		if(x.length > 2){
			search(x)
		}
		
});

