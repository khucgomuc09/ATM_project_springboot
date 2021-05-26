<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin</title>

<jsp:include page="Libs-Admin/fragment-main.jsp"></jsp:include>

<link rel="stylesheet" href="../../resources/admin/js/aos-animation/aos.css">


</head>
<body>

	<div id="wrapper">
		<%--   frame--%>
		<jsp:include page="Libs-Admin/frames.jsp"></jsp:include>
		<%--   frame--%>

		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-bar page-header">
							<ul class="page-breadcrumb">
								<li><i class="fa fa-home"></i> <a href="admin">Home</a>
									<i class="fa fa-angle-right"></i></li>
								<li><a href="admin">Thống kê</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-envira fa-3x"></i>
									</div>
									<div class="text-cs">Tổng số sản phẩm</div>
									<div class="col-xs-9 text-right">
										<div class="huge">69</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-money fa-3x"></i>
									</div>
									<div class="text-cs">Tổng số tiền</div>
									<div class="col-xs-9 text-right">
										<div class="huge">89.567.000đ</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-basket fa-3x"></i>
									</div>
									<div class="text-cs">Tổng đơn hàng</div>
									<div class="col-xs-9 text-right">
										<div class="huge">25</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-bank fa-3x"></i>
									</div>
									<div class="text-cs">Doanh thu hôm nay</div>
									<div class="col-xs-9 text-right">
										<div class="huge">20.990.000đ</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-gray">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-calendar-minus-o fa-3x"></i>
									</div>
									<div class="text-cs">Doanh thu tuần</div>
									<div class="col-xs-9 text-right">
										<div class="huge">30.250.000đ</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-darkcyan">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-calendar fa-3x"></i>
									</div>
									<div class="text-cs">Doanh thu tháng</div>
									<div class="col-xs-9 text-right">
										<div class="huge">50.220.000đ</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-cyan">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-users fa-3x"></i>
									</div>
									<div class="text-cs">Tổng số thành viên</div>
									<div class="col-xs-9 text-right">
										<div class="huge">2</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div data-aos="zoom-in" data-aos-duration="700"
						class="col-lg-3 col-md-6">
						<div class="panel panel-cy">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-paw fa-3x"></i>
									</div>
									<div class="text-cs">Lượt truy cập</div>
									<div class="col-xs-9 text-right">
										<div class="huge">534</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%--footer--%>
	<jsp:include page="Libs-Admin/footer.jsp"></jsp:include>
	<%--footer--%>
	<jsp:include page="Libs-Admin/fragment-footer.jsp"></jsp:include>

	<script src="../../resources/admin/js/aos-animation/bs-animation.js"></script>
	<script src="../../resources/admin/js/aos-animation/aos.js"></script>
</body>
</html>
