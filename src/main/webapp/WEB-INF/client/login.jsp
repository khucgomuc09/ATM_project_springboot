<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Login</title>

<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/css/popup-forget-pass.css">

</head>

<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="login-atm">
			<div class="login box-shadow-form">
				<span class="err-login">er</span>
				<div class="title-form" data-aos="zoom-out-down"
					data-aos-duration="800">
					<h1>Đăng nhập</h1>
				</div>
				<form id="form-login" class="form-style" action="login"
					method="post">
					<label for="usr-name">Tài khoản</label> <input type="text"
						id="usr-name" name="username" placeholder="Tài khoản" value="">
					<label for="password">Mật khẩu</label> <input type="password"
						id="password" name="password" placeholder="Mật khẩu" value="">
					<div class="remember-pass">
						<input id="remember" type="checkbox"> <label
							for="remember">Lưu mật khẩu</label>
					</div>
					<button id="confirm-btn" type="submit">ĐĂNG NHẬP</button>
					<div class="forgot-register">
						<a data-toggle="modal" data-target="#myModal" href="">Quên mật
							khẩu</a> <a href="register.jsp">Đăng ký</a>
					</div>
					<button id="login-wfb" type="button">
						<i class="fa fa-facebook" aria-hidden="true"></i>Đăng Nhập Bằng
						Facebook
					</button>
					<button id="login-wgg" type="button">
						<i class="fa fa-google" aria-hidden="true"></i>Đăng nhập bằng
						Google
					</button>
				</form>
			</div>
		</div>
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Đặt Lại Mật Khẩu</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="forget-pass">
							<form id="form-forget" class="form-style-fg" action="#"
								method="post">
								<ul>
									<li class="row">
										<div class="col-sm-12 col-xs-6">
											<h5 class="modal-title">Vui lòng nhập địa chỉ email bạn
												đã đăng ký trên ATM</h5>
										</div>
										<div class="col-sm-12 col-xs-6">
											<input type="text" id="email" name="email"
												placeholder="Email">
										</div>
									</li>
								</ul>
								<div class="btn-submit">
									<button type="submit" class="update-btn">Xác nhận</button>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</section>
	<%--footer--%>
	<jsp:include page="Libs/footer-animation.jsp"></jsp:include>
	<%--footer--%>
	<!--js--start-->
	<jsp:include page="Libs/fragment-footer.jsp"></jsp:include>
	<!--js--end-->
	<script src="../../resources/js/validation-form/vali-login.js"></script>
	<script src="../../resources/js/validation-form/vali-forget.js"></script>

</body>

</html>