$(document).ready(function() {
			let wrap = $('.wrap-suggestion');
			$('#search').on('keyup', function() {
				let input = $('#search').val();
				if (input === "") {
					wrap.css("display", "none").html("");
				} else {
					$.ajax({
						method : 'POST',
						url : 'http://127.0.0.1:8080/search',
						data : {
							keywords : input
						},
						success : function(result) {
						console.log(result);
						
							if (result === "empty") {
								wrap.css("display", "none");
							} else {
						
									let arr = result.map(x => '<li> <a href="http://127.0.0.1:8080/'+x.split(',')[1]+'/'+x.split(',')[0]+'"> <img src="'+x.split(',')[3]+'" width="60"/>'+ x.split(',')[2]+' </a> </li>')
								wrap.css("display", "block");
								
								wrap.html(arr);
						
							}
						}
					})
				}
			});
		})