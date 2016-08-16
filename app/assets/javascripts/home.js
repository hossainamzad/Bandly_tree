$(document).ready(function(){

	$(".tree").on("click", function(){
		$("#name").animate({
			marginTop: "135px"
		}, 600).animate({
			marginTop: "145px"
		}, 400).animate({
			marginTop: "138px"
		}, 300).animate({
			marginTop: "142px"
		}, 200).animate({
			marginTop: "140px"
		}, 100);
	})

	$("#name").on("click", function(){
		$("#mainline").animate({
			height: "17px"
		}, 500);
	})

	$("#textBar").on("keydown", function(){
		$("#start-here").hide();
		$(".search-bar").css("marginLeft", 0);
	})

	$(function(){
		setInterval(function(){
			$("#start-here").animate({
				marginLeft: "0px"
			}, 300).animate({
				marginLeft: "-5px"
			}, 300);
		}, 600);
	});

	// var startHere = function(){
	// 	$("#start-here").animate({
	// 		marginLeft: "0px"
	// 	}, 300).animate({
	// 		marginLeft: "-20px"
	// 	}, 300);
	// }

	// $("#start-here").on("click", function(){
	// 	startHere();
	// });

	// $("#submit").click(function(){
	// 	$(".line1").animate({
	// 		visibility: "visible",
	// 		height: "100px"
	// 	}, 3000);

	// 	$(".line2").animate({
	// 		visibility: "visible",
	// 		width: "566px", 
	// 		// marginLeft: 0
	// 	}, 3000);

	$("#submit").click(function(){

		$(".line1").animate({
			visibility: "visible",
			height: "100px"
		}, 3000);

		$(".line2").delay(3000).animate({
			visibility: "visible",
			height: "10px", 
			// marginLeft: 0
		}, 1000);

	});


	$(".event1").click(function(){
		$(".line3").css("marginLeft", 125)
			$(".line3").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line4").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);
		// 	$(".line3").animate({
		// 	// visibility: "visible"
		// 	width:110, marginLeft: 0
		// }, 3000);

	    // $("ul").append(@artist_name);
		});


	$(".event2").click(function(){

		$(".line3").css("marginLeft", 310)
		$(".line3").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line4").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);
		// 	$(".line3").animate({
		// 	// visibility: "visible"
		// 	width:110, marginLeft: 0
		// }, 3000);

	    // $("ul").append(@artist_name);
		});

	$(".event3").click(function(){

		$(".line3").css("marginLeft", 520)
		$(".line3").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line4").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);

		});

	$(".event4").click(function(){

		$(".line3").css("marginLeft", 713)
		$(".line3").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line4").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);

		});

	$(".row2-event1").click(function(){

		$(".line5").css("marginLeft", 713)
		$(".line5").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line6").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);

		});

	$(".row2-event2").click(function(){

		$(".line5").css("marginLeft", 713)
		$(".line5").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line6").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);

		});


	$(".row2-event3").click(function(){

		$(".line5").css("marginLeft", 713)
		$(".line5").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line6").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);

		});


	$(".row2-event4").click(function(){

		$(".line5").css("marginLeft", 713)
		$(".line5").animate({
				visibility: "visible",
				height: "100px"
			}, 3000);

			$(".line6").delay(3000).animate({
				visibility: "visible",
				height: "10px", 
				// marginLeft: 0
			}, 1000);

		});

});

// $(document).ready(function(){
// 	$("#see-more").click(function(){
// 	    $("ul").append(image,artist_name);
// 	});
// });