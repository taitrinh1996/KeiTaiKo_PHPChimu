$(window).on('load', function () {
	var showPopupBought = function() {
	    $('#popup-alert').addClass('show');
	    setTimeout(function() {
	      $('#popup-alert').removeClass('show');
	    },5000)
	}

	$('.close-poup').on('click', function(){
		$('#popup-alert').removeClass('show');
	});

	showPopupBought();
});
