$(document).ready(function() {
	$('.buy-ajax').click(function() {
		let value = $(this).parent().children('.msp-ajax').val();
		let current_time = new Date($.now());
		let oid = "" + current_time.getHours() + current_time.getMinutes() + current_time.getSeconds();
		$.ajax({
			url: 'http://localhost:8080/add_items_to_cart',
			method: 'POST',
			data: {
				id: value,
				orderid: oid
			},
			success: function(result) {
				console.log(result);
				// let value = result.split("-");
				$('.amount').html(result);
			}
		})
	});
});

