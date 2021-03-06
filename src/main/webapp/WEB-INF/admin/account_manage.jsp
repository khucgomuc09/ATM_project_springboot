<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Quản lý tài khoản</title>

<jsp:include page="Libs-Admin/fragment-main.jsp"></jsp:include>

<jsp:include page="Libs-Admin/frag-table-header.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/admin/css/form-style.css">


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
								<li><i class="fa fa-home"></i> <a href="../../admin">Home</a>
									<i class="fa fa-angle-right"></i></li>
								<li><a href="../../admin/account-manage">Quản lý tài
										khoản</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading  d-flex">
								<div>
									<i class="fa fa-shopping-cart"></i> Tài khoản
								</div>
								<a class="add " data-toggle="modal" data-target="#myModal"
									href="#">
									<div id="add" class="">
										<i class="fa fa-plus"></i> <span>Thêm mới</span>
									</div>
								</a>
								<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
												<h4 class="modal-title">THÊM TÀI KHOẢN</h4>
											</div>
											<div class="modal-body">
												<div id="update-info" class="like-form">
													<form class="form-style" action="../../admin/create_user"
														method="post" id="form-validate">
														<input type="hidden" name="action" value="them">
														<ul class="row">
															<li class="row">
																<div class="col-sm-4 col-xs-6">
																	<input type="text" id="usr-name" name="username"
																		value=""> <label for="usr-name">Tài
																		khoản<span>*</span>
																	</label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<input type="text" id="password" name="password"
																		value=""> <label for="password">Mật
																		khẩu<span>*</span>
																	</label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<input type="text" id="full-name" name="fullname"
																		value=""> <label for="full-name">Họ
																		tên<span>*</span>
																	</label>
																</div>
															</li>
															<li class="row">
																<div class="col-sm-4 col-xs-6">
																	<select id="gender" name="gender">
																		<option value="Nam">Nam</option>
																		<option value="Nữ">Nữ</option>
																	</select> <label for="gender" class="level-span">Giới
																		tính</label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<input type="text" id="email" name="email" value="">
																	<label for="email">Email<span>*</span></label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<input type="number" id="sdt" name="phone" value="">
																	<label for="sdt">Điện thoại<span>*</span></label>
																</div>

															</li>
															<li class="row">
																<div class="col-sm-8 col-xs-6">
																	<input type="text" id="address" name="address" value="">
																	<label for="address">Địa chỉ</label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<select id="level" name="level">
																		<option value="0">0 (User)</option>
																		<option value="1">1 (Admin)</option>
																	</select> <label for="level" class="level-span">Level</label>
																</div>

															</li>
														</ul>
														<div class="btn-submit">
															<button type="submit" id="update-btn">Thêm</button>
														</div>
													</form>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
							</div>
							<div class="panel-body">
								<jsp:include page="Libs-Admin/dialog-admin.jsp"></jsp:include>
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr class="text-small">
												<th>#</th>
												<th>Họ & Tên</th>
												<th>Giới tính</th>
												<th>Email</th>
												<th>Điện thoại</th>
												<th>Địa chỉ</th>
												<th>Level</th>
												<th class="remove" style="text-align: center">Sửa</th>
												<th class="remove" style="text-align: center">Xóa</th>
											</tr>
										</thead>
										<tbody>
											<jstl:set var="count" value="1"></jstl:set>
											<jstl:forEach items="${list_user }" var="user">
												<tr class="odd gradeX">
													<td>${count }</td>
													<td>${ user.fullname}</td>
													<td>${user.gender}</td>
													<td>${ user.email}</td>
													<td>${ user.phone}</td>
													<td>${ user.address}</td>
													<td style="text-align: center"><jstl:choose>
															<jstl:when test="${user.level==0 }">
																<span class="label label-success">User</span>
															</jstl:when>
															<jstl:otherwise>
																<span class="label label-danger">Admin</span>
															</jstl:otherwise>
														</jstl:choose></td>
													<td style="text-align: center"><a
														href="../../admin/edit_user/${user.id }"
														class="btn default btn-xs purple btn-edit"> <i
															class="fa fa-edit"></i></a></td>
													<td style="text-align: center"><a data-toggle="modal"
														data-target="#${user.id }cf"
														class="btn default btn-xs black btn-delete"><i
															class="fa fa-trash-o"></i></a>
														<div id="${user.id }cf" class="modal fade modal-confirm"
															role="dialog">
															<div class="modal-dialog modal-sm">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-body">
																		<p class="text-content">
																			Xác nhận xóa tài khoản <em>${user.username }</em>
																		</p>
																	</div>
																	<div class="modal-footer">
																		<form action="../../admin/delete_user/${user.id }"
																			method="post">
																			<button type="submit" class="btn-cf">Xác
																				nhận</button>
																			<button type="button" class="tbn-cancle"
																				data-dismiss="modal">Hủy</button>
																		</form>

																	</div>
																</div>
															</div>
														</div></td>
												</tr>
												<jstl:set var="count" value="${count+1 }"></jstl:set>
											</jstl:forEach>
										</tbody>
									</table>
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
	<jsp:include page="Libs-Admin/frag-table-footer.jsp"></jsp:include>
	<!-- Custom Theme JavaScript -->
	<script src="../../resources/admin/js/form-style.js"></script>
	<script src="../../resources/admin/js/validation-form/vali-form.js"></script>

</body>
</html>
