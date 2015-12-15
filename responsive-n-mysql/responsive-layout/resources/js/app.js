$(document).ready(function() {
	// just to make sure we're up and running
	console.log('app.js is linked');

	// grab green column
	$('.col--green').click(function() {
		alert('You have clicked on the green column');
	});

	//grab white column

	var $whiteCol = $('.col--white')

	var makeAnotherColor = function() {
		$(this).animate({backgroundColor: '#6600cc'}, 3000);
	};

	$whiteCol.on('click', makeAnotherColor)

	// grab blue column
	$('.col--blue').click(function() {
		var nameGiven = prompt('What is your name?');
		console.log(nameGiven);
	});

});
