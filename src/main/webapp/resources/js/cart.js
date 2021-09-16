$(document).ready(function() {
	let
	soluong = $('.number-pro').val;
	let
	id = "";
	$('.number-pro').on('keyup', function() {
		let
		tmp = $(this).val();
		if (tmp === '') {
			soluong = 1;
			$(this).val(1);
		} else {
			soluong = parseInt(tmp);
		}
		id = $(this).parent().children('.msp').val();
		let
		parent = $(this).parent();
		$(parent).parent().children('.upgrade').css('display', 'block');
	});
	$('.plus').on('click', function() {
		let
		parent = $(this).parent();
		$(parent).parent().children('.upgrade').css('display', 'block');
		let
		input_amount = $(this).parent().children('.number-pro');
		id = $(this).parent().children('.msp').val();
		let
		amount = parseInt($(input_amount).val());
		$(input_amount).val(amount + 1);
		soluong = parseInt($(input_amount).val());

	});
	$('.subject').on('click', function() {
		let
		parent = $(this).parent();
		let
		input_amount = $(this).parent().children('.number-pro');
		id = $(this).parent().children('.msp').val();
		let
		amout = parseInt($(input_amount).val()) - 1;
		if (amout < 1) {
			amout = 1;
		} else {
			$(parent).parent().children('.upgrade').css('display', 'block');
		}
		$(input_amount).val(amout.toString());
		soluong = parseInt($(input_amount).val());
	});

	$('.upgrade').on('click', function() {
		$(this).css('display', 'none');
		$.ajax({
			url : 'http://127.0.0.1:8080/update_item',
			method : 'POST',
			data : {
				id : id,
				amount : soluong,
			},
			success : function(result) {

				let
				value = result.split("-");
				console.log(value[0] + value[1] + value[2]);
				$('#count-pro').html(value[0] + " ");
				$('#total').html(formatNumber(value[1]) + " VND");
				// let ele = $('.flex-direction-col').find("#" + value[3]);
				// ele.html(formatNumber(value[2]) + " VND");

			}
		})
	});
	$('.trash').on('click', function() {
		let
		parentNode = this.parentNode;
		let
		id = $(this).parent().children('.msp-trash').val();
		let
		name = $(this).parent().children('.tensp-trash').val();
		if (confirm("Bạn có chắc xóa " + name + " ra khỏi giỏ hàng?")) {
			$.ajax({
				url : 'http://127.0.0.1:8080/delete_cartItem',
				method : 'POST',
				data : {
					id : id,
				},
				success : function(result) {
					let
					value = result.split("-");
					$('#count-pro').html(value[0] + " ");
					$('#total').html(formatNumber(value[1]) + " VND");
					$(parentNode.parentNode).remove();
					if (value[0] === '0') {
						$('#btn-submit').remove();
					}
				}
			})
		}
	});

});
function formatNumber(num) {
	return num.split(/(?=(?:...)*$)/).join(',');
}