$(document).ready(
		function() {
			$('.buy-ajax').click(
					function() {
						let
						value = $(this).parent().children('.msp-ajax').val();
						let
						current_time = new Date($.now());
						let
						oid = "" + current_time.getHours()
								+ current_time.getMinutes()
								+ current_time.getSeconds();
						$.ajax({
							url : 'http://127.0.0.1:8080/add_items_to_cart',
							method : 'POST',
							data : {
								id : value,
								orderid : oid
							},
							success : function(result) {
								console.log(result);
								if (!isNaN(result))
									$('.amount').html(result);
								else
									window.location.href = "../login";
							}
						})
					});
		});
