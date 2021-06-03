<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title></title>
</head>
<body>
	<div data-aos="fade-down" data-aos-once="true" id="header-top">
		<div class="container">
			<div class="header-top d-flex space-between">
				<ul class="d-flex">
					<li><a href="#"><i class="fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
					<li><span>Hotline: 0xx-xxx-xxxx | Email:
							atm.pro@gmail.com</span></li>
				</ul>
				<ul class="d-flex">
					<li><a><i class="fa fa-truck fa-flip-horizontal"></i></a><span>Ship
							COD toàn quốc</span></li>
					<li><a><i class="fa fa-bar-chart"></i></a><span>Mặt
							hàng đa dạng</span></li>
					<li><a><i class="fa fa-heart"></i></a><span>Cam kết
							chất lượng</span></li>
				</ul>
			</div>
		</div>
	</div>
	<section id="header">
		<div id="main-header">
			<div class="container">
				<div class="header-logo space-between">
					<div class="header-main-logo d-flex space-between">
						<a href="/" data-aos="fade-right" data-aos-once="true"
							class="logo"> <img src="../img/common/logo-atm.png"
							height="87" width="128" alt="atm" />
						</a>
						<form id="serach-form" action="#" method="post">
							<div class="search">
								<input type="text" placeholder="Bạn cần tìm gì?" id="search"
									name="search" value="">
								<button type="submit" id="icon-search">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
								<ul class="wrap-suggestion"></ul>
							</div>
						</form>
					</div>
					<div data-aos="fade-left" data-aos-once="true"
						id="header-main-center">
						<div class="news-request d-flex">
							<div class="news">
								<a class="transform-para" href="../../news">Tin tức</a>
							</div>
							<div class="request">
								<a class="transform-para" href="../../question">Hỏi đáp</a>
							</div>
						</div>

						<ul class="icon-profile">
							<li id="hello-user">
								<div class="flex-user">
									<jstl:choose>
										<jstl:when test="${user!=null }">
											<span>Xin chào</span>
											<a href="#"><span class="user-text">${user.fullname }</span>
											</a>
											<a href="../logout"><span class="exit">Thoát</span></a>
										</jstl:when>
										<jstl:otherwise>
											<a href="#"><span class="user-text">username</span> </a>
										</jstl:otherwise>
									</jstl:choose>
								</div>

							</li>
							<jstl:choose>
								<jstl:when test="${user!=null&&user.level==1 }">
									<li id="user"><a style="margin-right: 10px" href="admin"><i
											class="fa fa-cog fa-spin ic-level"></i></a> <span
										class="span-level">Admin</span></li>
								</jstl:when>
								<jstl:when test="${user==null}">

									<li id="user"><i class="fa fa-user-circle-o"
										id="user-icon"></i>
										<ul class="sub-user">
											<li class="login"><a href="../login">Đăng nhập</a><span>/</span><a
												href="../register">Đăng ký</a></li>
											<li><span>hoặc</span></li>
											<li class="login-with-fb"><a href="#">Đăng nhập bằng</a>
												<i class="fa fa-facebook" aria-hidden="true"></i></li>
											<li class="login-with-gg"><a href="#">Đăng nhập bằng</a>
												<i class="fa fa-google" aria-hidden="true"></i></li>
										</ul></li>
								</jstl:when>
							</jstl:choose>

							<li style="width: 24px"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="menu-header">
		<div class="container">
			<div id="menu">
				<ul class="list-menu d-flex">
					<li id="home-menu"><a href="/"><i class="fa fa-home"
							aria-hidden="true"></i><span>TRANG CHỦ</span></a></li>


					<li class=""><a href="/iphone"><img
							src="../img/common/logo-nsx/iPhone-(Apple)42-b_16.jpg"
							alt="i-phone"></a></li>
					<li class=""><a href="/samsung"><img
							src="../img/common/logo-nsx/Samsung42-b_25.jpg" alt="samsung"></a></li>
					<li class=""><a href="/xiaomi"><img
							src="../img/common/logo-nsx/Xiaomi42-b_31.png" alt="xiaomi"></a></li>
					<li class=""><a href="/vivo"><img
							src="../img/common/logo-nsx/Vivo42-b_50.jpg" alt="vivo"></a></li>
					<li class=""><a href="/oppo"><img
							src="../img/common/logo-nsx/OPPO42-b_57.jpg" alt="oppo"></a></li>
					<li class=""><a href="/huawei"><img
							src="../img/common/logo-nsx/Huawei42-b_30.jpg" alt="hua"></a></li>
				</ul>
			</div>
		</div>
	</div>
	<ul
		style="position: sticky; top: 8px; z-index: 100; margin-top: -97px; float: right; right: 145px;">
		<li id="cart"><a href="../cart"><i
				class="fa fa-shopping-cart"></i></a><span class="amount"> <jstl:choose>
					<jstl:when test="${order!=null}">
						${order.total}
						</jstl:when>
					<jstl:otherwise>
						0</jstl:otherwise>
				</jstl:choose>
		</span></li>
	</ul>

	<script>
		$(document).ready(function() {
			let wrap = $('.wrap-suggestion');
			$('#search').on('keyup', function() {
				let input = $('#search').val();
				if (input === "") {
					wrap.css("display", "none").html("");
				} else {
					$.ajax({
						method : 'POST',
						url : 'http://localhost:8080/search',
						data : {
							keywords : input
						},
						success : function(result) {
						console.log(result);
						
							if (result === "empty") {
								wrap.css("display", "none");
							} else {
							
						/*	var items = result.forEach(getItem);
							function getItem(value){
							let v = value.split(",");
								console.log('id '+ v[0]);
								console.log('name '+ v[2]);
								
								wrap.css("display", "block");
								
								wrap.html('<li> <a href="http://localhost:8080/'+v[1]+'/'+v[0]+'"> <img src="'+v[3]+'" width="60"/>'+ v[2]+' </a> </li>');
							}
							*/
							let arr = result.map(x => '<li> <a href="http://localhost:8080/'+x.split(',')[1]+'/'+x.split(',')[0]+'"> <img src="'+x.split(',')[3]+'" width="60"/>'+ x.split(',')[2]+' </a> </li>')
								wrap.css("display", "block");
								
								wrap.html(arr);
						
							}
						}
					})
				}
			});
		})
	</script>
</body>
</html>