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
				console.log(response.artists.items[0].id)
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
		var url = artist.external_urls.spotify;

		artist_pic(artist, i);
	};



	var artist_pic = function(x, y){
		var image = x.images[y].url;
		$('#image').html("<img id='artist-spotify-pic' src='" + image + "'></img>");
	};



	var clear_tracks = function(){
		$('#tracks').empty();
	}



	var clear_play = function(){
		$('#play').empty();
	}



	var gen_tracks = function(x){
		clear_tracks();

		var tracks = x.tracks;
		$('#play').append("<iframe src='https://embed.spotify.com/?uri="+tracks[0].uri+"' frameborder='0'></iframe>")

		for(var t = 0; t < tracks.length && t < 5; t++){
			$('#tracks').append("<li class='track_text' data-track="+tracks[t].uri+">"+tracks[t].name+"</li>")
		};

		$('.track_text').on('click', function(){
			clear_play();
			uri = $(this).data("track");
			console.log(this)
			console.log(uri)
			$('#play').append("<iframe src='https://embed.spotify.com/?uri="+uri+"' frameborder='0'></iframe>")
		});
	};



	x = $('#artist-name').html();
			search(x)



//Managing the tabbed info:

		$("#someMusic").show();
		$('#musics').css("background-color", "white")


		$('#musics').click(function(){
			$('#musics').css("background-color", "white")
			$('#someMusic').show();

			$('#bios').css("background-color", "#2CDA9D")
			$('#someBio').hide();

			$('#recents').css("background-color", "#2CDA9D")
			$('#someSearches').hide();
		});


		$('#bios').click(function(){
			$('#musics').css("background-color", "#2CDA9D")
			$('#someMusic').hide();

			$('#bios').css("background-color", "white")
			$('#someBio').show();

			$('#recents').css("background-color", "#2CDA9D")
			$('#someSearches').hide();
		});


		$('#recents').click(function(){
			$('#musics').css("background-color", "#2CDA9D")
			$('#someMusic').hide();

			$('#bios').css("background-color", "#2CDA9D")
			$('#someBio').hide();

			$('#recents').css("background-color", "white")
			$('#someSearches').show();
		});
});

