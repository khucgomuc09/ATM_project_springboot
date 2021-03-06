<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Quản lý sản phẩm</title>

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
							<ul class="page-breadcrumb" style="position: relative">
								<jsp:include page="Libs-Admin/dialog-admin.jsp"></jsp:include>
								<li><i class="fa fa-home"></i> <a href="index.jsp">Home</a>
									<i class="fa fa-angle-right"></i></li>
								<li><a href="#">Danh mục</a> <i class="fa fa-angle-right"></i>
								</li>
								<li><a href="products-manage.jsp">Quản lý sản phẩm</a></li>
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
									<i class="fa fa-envira"></i> Sản Phẩm
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
												<h4 class="modal-title">THÊM SẢN PHẨM</h4>
											</div>
											<!-- chi tiet sp -->
											<div class="modal-body">
												<div id="update-info" class="like-form">
													<form id="form-validate" class="form-style"
														action="add_product" method="POST"
														enctype="multipart/form-data">
														<ul class="row">
															<li class="row">
																<div class="col-sm-4 col-xs-6">
																	<input type="text" id="name-product"
																		name="name-product" value="tensp"> <label
																		for="name-product">Tên sản phẩm<span>*</span></label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<select id="type" name="type">
																		<option value="0">0 (Sản phẩm Mới)</option>
																		<option value="2">2 (Sản phẩm khuyến mãi)</option>
																		<option value="1">1 (Sản phẩm Hot)</option>
																	</select> <label for="type" class="level-span">Loại</label>
																</div>
																<div class="col-sm-4 col-xs-6">
																	<select id="producer" name="producer">

																		<option value="">nha cung cap</option>
																	</select> <label for="producer" class="level-span">Nhà
																		cung cấp<span>*</span>
																	</label>
																</div>
															<li class="row">
																<div class="col-sm-3 col-xs-6">
																	<input type="number" id="sale-price" name="sale-price"
																		value="gia da giam"> <label for="sale-price">Giá
																		đã giảm</label>
																</div>
																<div class="col-sm-3 col-xs-6">
																	<input type="number" id="price" name="price"
																		value="gia ban"> <label for="price">Giá
																		bán</label>
																</div>
																<div class="col-sm-2 col-xs-6">
																	<input type="number" id="count-product"
																		name="count-product" value="soluong"> <label
																		for="count-product">Số lượng<span>*</span></label>
																</div>
																<div class="col-sm-2 col-xs-6">
																	<input type="file" id="link-img" name="link-img"
																		accept="image/jpeg, image/png"> <label
																		for="link-img">Hình ảnh</label>
																</div>
																<div class="col-sm-2 col-xs-6">
																	<select id="status" name="status">
																		<option value="2">2 (Mở bán)</option>
																		<option value="1">1 (Gần hết hàng)</option>
																		<option value="0">0 (Ẩn)</option>
																	</select> <label for="status" class="level-span">Trạng
																		thái</label>
																</div>
															</li>
														</ul>
														<ul class="row">
															<h3 class="col-sm-12"
																style="text-align: center; margin-bottom: 20px; color: #215862; font-weight: 600">
																Chi tiết sản phẩm</h3>
															<li class="row">
																<div class="col-sm-12 col-xs-6">
																	<input type="text" id="gift" name="gift"
																		value="qua tang"> <label for="gift">Quà
																		tặng</label>
																</div>
															</li>
															<li class="row">
																<div class="col-sm-6 col-xs-6">
																	<input type="text" id="screen" name="screen"
																		value="man hinh"> <label for="screen">Màn
																		hình</label>
																</div>
																<div class="col-sm-6 col-xs-6">
																	<input type="text" id="hdh" name="hdh"
																		value="he dieu hanh"> <label for="hdh">Hệ
																		điều hành</label>
																</div>
															</li>
															<li class="row">
																<div class="col-sm-6 col-xs-6">
																	<input type="text" id="cpu" name="cpu" value="cpu">
																	<label for="cpu">CPU</label>
																</div>
																<div class="col-sm-6 col-xs-6">
																	<input type="text" id="ram" name="ram" value="ram">
																	<label for="ram">RAM</label>
																</div>
															</li>
															<li class="row">
																<div class="col-sm-6 col-xs-6">
																	<input type="text" id="camera" name="camera"
																		value="camera"> <label for="camera">CAMERA</label>
																</div>
																<div class="col-sm-6 col-xs-6">
																	<input type="text" id="pin" name="pin" value="pin">
																	<label for="pin">PIN</label>
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
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên sản phẩm</th>
												<th>Nhà cung cấp</th>
												<th>Giá đã giảm</th>
												<th>Giá bán</th>
												<th>Số lượng</th>
												<th class="remove">Hình ảnh</th>
												<th class="remove">Trạng thái</th>
												<th>Loại</th>
												<th class="remove" style="text-align: center">Sửa</th>
												<th class="remove" style="text-align: center">Xóa</th>
											</tr>
										</thead>
										<tbody>

											<!--  for each -->
											<jstl:forEach items="${products}" var="product">


												<tr class="odd gradeX">
													<td>${product.id }</td>
													<td>${product.name }</td>
													<td>${product.supplier }</td>
													<td><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${product.price_remaining }" /></td>
													<td><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${product.price }" /></td>
													<td><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${product.amount }" /></td>
													<td><img src="../${product.image }" alt="" width="60"></td>
													<td style="text-align: center; font-size: 17px"><jstl:choose>
															<jstl:when test="${product.status==2 }">
																<i class="fa fa-check" aria-hidden="true"
																	style="color: #0a7f7f"></i>
															</jstl:when>
															<jstl:when test="${product.status==1 }">
																<i class="fa fa-exclamation-circle" aria-hidden="true"
																	style="color: #ff8e27"></i>
															</jstl:when>
															<jstl:otherwise>
																<i class="fa fa-ban" aria-hidden="true"
																	style="color: #de1d18"></i>
															</jstl:otherwise>

														</jstl:choose></td>
													<td style="text-align: center; font-weight: 700"><jstl:choose>
															<jstl:when test="${product.product_type==2 }">
																<span style="color: #de8f04">Sale</span>
															</jstl:when>
															<jstl:when test="${product.product_type==1 }">
																<span style="color: #de1d18">Hot</span>
															</jstl:when>
															<jstl:otherwise>
																<span style="color: #31de21">New</span>
															</jstl:otherwise>
														</jstl:choose></td>
													<td style="text-align: center"><a
														href="edit_product/${product.id }"
														class="btn default btn-xs purple btn-edit"> <i
															class="fa fa-edit"></i></a></td>
													<td style="text-align: center"><a data-toggle="modal"
														data-target="#ma san pham cf"
														class="btn default btn-xs black btn-delete"><i
															class="fa fa-trash-o"></i></a>
														<div id="ma san pham cf" class="modal fade modal-confirm"
															role="dialog">
															<div class="modal-dialog modal-sm">
																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-body">
																		<p class="text-content">
																			Xác nhận xóa sản phẩm <em>${product.name }</em>
																		</p>
																	</div>
																	<div class="modal-footer">
																		<button type="button"
																			onclick="return location.href='../delete_product/${product.id }'"
																			class="btn-cf">Xác nhận</button>
																		<button type="button" class="tbn-cancle"
																			data-dismiss="modal">Hủy</button>
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
	<jsp:include page="Libs-Admin/footer.jsp"></jsp:include>
	<%--footer--%>
	<jsp:include page="Libs-Admin/fragment-footer.jsp"></jsp:include>
	<jsp:include page="Libs-Admin/frag-table-footer.jsp"></jsp:include>
	<!-- Custom Theme JavaScript -->
	<script src="../../resources/admin/js/form-style.js"></script>
	<script src="../../resources/admin/js/validation-form/vali-form.js"></script>
</body>
</html>
