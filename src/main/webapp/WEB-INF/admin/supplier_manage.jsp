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

<title>Nhà cung cấp</title>

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
								<li><i class="fa fa-home"></i> <a href="../">Home</a> <i
									class="fa fa-angle-right"></i></li>
								<li><a href="#">Danh mục</a> <i class="fa fa-angle-right"></i>
								</li>
								<li><a href="../supplier_manage">Nhà cung cấp</a></li>
							</ul>
						</div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<!-- /.panel-heading -->
							<div class="panel-heading  d-flex">
								<div>
									<i class="fa fa-home"></i> Nhà cung cấp
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
												<h4 class="modal-title">THÊM NHÀ CUNG CẤP</h4>
											</div>
											<div class="modal-body">
												<div id="update-info" class="like-form">
													<form id="form-validate" class="form-style"
														action="../../admin/create_supplier" method="post">
														<input type="hidden" name="action" value="them">
														<ul class="row">
															<li class="row">
																<div class="col-sm-12 col-xs-6">
																	<input type="text" id="id-producer" name="id">
																	<label for="id-producer">Mã nhà cung cấp<span>*</span></label>
																</div>
															</li>
															<li class="row">
																<div class="col-sm-12 col-xs-6">
																	<input type="text" id="name-producer" name="name">
																	<label for="name-producer">Tên nhà cung cấp<span>*</span></label>
																</div>

															</li>
															<li class="row">
																<div class="col-sm-12 col-xs-6">
																	<input type="text" id="add-producer" name="address">
																	<label for="add-producer">Địa chỉ<span>*</span>
																	</label>
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

							<!-- /.panel-heading -->
							<div class="panel-body">
								<jsp:include page="Libs-Admin/dialog-admin.jsp"></jsp:include>
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Mã nhà cung cấp</th>
												<th>Tên nhà cung cấp</th>
												<th>Địa chỉ</th>
												<th class="remove" style="text-align: center">Sửa</th>
												<th class="remove" style="text-align: center">Xóa</th>
											</tr>
										</thead>
										<tbody>
											<jstl:forEach items="${list_suppliers }" var="s">

												<tr class="odd gradeX">
													<td>${s.id }</td>
													<td>${s.name }</td>
													<td>${s.address }</td>
													<td style="text-align: center"><a
														href="../../admin/edit_supplier/${s.id }"
														class="btn default btn-xs purple btn-edit"> <i
															class="fa fa-edit"></i></a></td>
													<td style="text-align: center"><a data-toggle="modal"
														data-target="#${s.id }cf"
														class="btn default btn-xs black btn-delete"><i
															class="fa fa-trash-o"></i></a>
														<div id="${s.id }cf" class="modal fade modal-confirm"
															role="dialog">
															<div class="modal-dialog modal-sm">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-body">
																		<p class="text-content">
																			Xác nhận xóa nhà cung cấp <em>${s.name }</em>
																		</p>
																	</div>
																	<div class="modal-footer">
																		<form action="../../admin/delete_supplier/${s.id }"
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
											</jstl:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.panel-body -->
						</div>
						<!-- /.panel -->
					</div>
					<!-- /.col-lg-12 -->
				</div>
			</div>
		</div>
	</div>
	<%--footer--%>
	<%@include file="Libs-Admin/footer.jsp"%>
	<%--footer--%>
	<%@include file="Libs-Admin/fragment-footer.jsp"%>
	<%@include file="Libs-Admin/frag-table-footer.jsp"%>
	<!-- Custom Theme JavaScript -->
	<script src="js/form-style.js"></script>
	<script src="js/validation-form/vali-form.js"></script>


</body>
</html>
