<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="navbar-header">
			<a class="navbar-brand" href="../../">ATM</a>
		</div>

		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

		<ul class="nav navbar-nav navbar-left navbar-top-links">
			<li><a href="/"><i class="fa fa-home fa-fw"></i>
					Website</a></li>
		</ul>

		<ul class="nav navbar-right navbar-top-links">
			<li class="dropdown navbar-inverse"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<b class="caret"></b>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> Bình luận mới <span
									class="pull-right text-muted small">4 minutes ago</span>
							</div>
					</a></li>
					<li><a href="#">
							<div>
								<i class="fa fa-users fa-fw"></i> Thành viên mới <span
									class="pull-right text-muted small">12 minutes ago</span>
							</div>
					</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>${user.fullname }
					<b class="caret"></b>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<%--                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>--%>
					<%--                </li>--%>
					<%--                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>--%>
					<%--                </li>--%>
					<%--                <li class="divider"></li>--%>
					<li><a href="../../logout"><i class="fa fa-sign-out fa-fw"></i>
							Logout</a></li>
				</ul></li>
		</ul>

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="Search...">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</li>
					<li><a href="../admin" class="active"><i
							class="fa  fa-dashboard fa-fw"></i> Thống kê</a></li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							Danh mục<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="../../admin/supplier_manage"><i
									class="fa  fa-home fa-fw"></i>Nhà cung cấp</a></li>
							<li><a href="../../admin/products_manage"><i
									class="fa  fa-pencil-square-o fa-fw"></i>Quản lý sản phẩm</a></li>
						</ul></li>

					<li><a href="../../admin/order_manage"><i
							class="fa  fa-shopping-cart fa-fw"></i> Quản lý đơn hàng</a></li>
					<li><a href="../../admin/user_manage"><i
							class="fa  fa-user fa-fw"></i>Quản lý tài khoản</a></li>

				</ul>
			</div>
		</div>
	</nav>
</body>
</html>