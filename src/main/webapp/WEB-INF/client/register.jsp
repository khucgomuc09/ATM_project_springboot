<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Register</title>

<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
</head>

<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="login-atm">
			<div class="login box-shadow-form">
				<div class="title-form" data-aos="zoom-out-down"
					data-aos-duration="800">
					<h1>Đăng Ký</h1>
				</div>
				<form id="form-validate" class="form-style" action="register"
					method="post">
					<label for="usr-name">Tài khoản* <span
						style="color: red; font-size: 15px; margin-left: 5px;">check
							user exist</span>

					</label> <input type="text" id="usr-name" name="username" value="">
					<label for="password">Mật khẩu*</label> <input 
						id="password" name="password" type="password" value=""> <label
						for="c-password">Xác nhận mật khẩu*</label> <input
						type="password" id="c-password" name="c-password" value="">
					<label
						for="full-name">Họ tên*</label> <input type="text" id="full-name"
						name="fullname" value=""> <label for="gender">Giới
						tính</label> <select id="gender" name="gender">
						<option value="Nam">Nam</option>
						<option value="Nữ">Nữ</option>
					</select> <label for="email">Email* <span
						style="color: red; font-size: 15px; margin-left: 5px;">check
							email exist</span>
					</label> <input type="text" id="email" name="email" value=""> <label
						for="sdt">Số điện thoại*</label> <input type="number" id="sdt"
						name="phone" value=""> <label for="address">Địa chỉ*</label>
					<input type="text" id="address" name="address" value="">
					<button id="confirm-btn" type="submit">TẠO TÀI KHOẢN</button>
				</form>
			</div>
		</div>
	</section>
	<!--footer-->
	<jsp:include page="Libs/footer-animation.jsp"></jsp:include>
	<!--footer-->
	<!--js--start-->
	<jsp:include page="Libs/fragment-footer.jsp"></jsp:include>
	<script src="../../resources/js/validation-form/vali-form.js"></script>
	<!--js--end-->
</body>

</html>