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
<meta name="ATM" content="">

<title>Cập nhật sản phẩm</title>

<jsp:include page="Libs-Admin/fragment-main.jsp"></jsp:include>

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
								<li><i class="fa fa-home"></i> <a href="admin">Home</a> <i
									class="fa fa-angle-right"></i></li>
								<li><a href="#">Danh mục</a> <i class="fa fa-angle-right"></i>
								</li>
								<li><a href="admin/product_manage">Quản lý sản phẩm</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading  d-flex">
								<div>
									<i class="fa  fa-pencil-square-o fa-fw"></i> Cập nhật sản phẩm
								</div>
							</div>

							<div class="panel-body">
								<div id="update" class="like-form">
									<form id="form-validate" class="form-style"
										action="../update_product" method="post">
										<input type="hidden" name="action" value="xulysua"> <input
											type="hidden" name="id" value="${product.id }">
										<ul class="row">
											<li class="row">
												<div class="col-sm-4 col-xs-6">
													<input type="text" id="name-product" name="name"
														value="${product.name }"> <label for="name">Tên
														sản phẩm<span>*</span>
													</label>
												</div>
												<div class="col-sm-4 col-xs-6">
													<select id="type" name="product_type">
														<jstl:choose>
															<jstl:when test="${product.product_type==0 }">
																<option value="0">0 (Sản phẩm Mới)</option>
																<option value="1">1 (Sản phẩm Hot)</option>
																<option value="2">2 (Sản phẩm khuyến mãi)</option>
															</jstl:when>
															<jstl:when test="${product.product_type==1 }">
																<option value="1">1 (Sản phẩm Hot)</option>
																<option value="2">2 (Sản phẩm khuyến mãi)</option>
																<option value="0">0 (Sản phẩm Mới)</option>
															</jstl:when>
															<jstl:otherwise>
																<option value="2">2 (Sản phẩm khuyến mãi)</option>
																<option value="1">1 (Sản phẩm Hot)</option>
																<option value="0">0 (Sản phẩm Mới)</option>
															</jstl:otherwise>
														</jstl:choose>
													</select> <label for="product_type" class="level-span">Loại</label>
												</div>
												<div class="col-sm-4 col-xs-6">
													<select id="producer" name="supplier">
														<jstl:forEach items="${ suppliers}" var="s">
															<jstl:choose>
																<jstl:when test="${s.name eq product.supplier }">

																	<option value="${s.name }" selected="selected">${s.name }
																	</option>
																</jstl:when>

																<jstl:otherwise>
																	<option value="${s.name }">${s.name }</option>
																</jstl:otherwise>
															</jstl:choose>


														</jstl:forEach>

													</select> <label for="supplier" class="level-span">Nhà cung
														cấp<span>*</span>
													</label>
												</div>
											<li class="row">
												<div class="col-sm-3 col-xs-6">
													<input type="number" id="sale-price" name="price_remaining"
														value="${ product.price_remaining}"> <label
														for="price_remaining">Giá đã giảm</label>
												</div>
												<div class="col-sm-3 col-xs-6">
													<input type="number" id="price" name="price"
														value="${ product.price}"> <label for="price">Giá
														bán</label>
												</div>
												<div class="col-sm-2 col-xs-6">
													<input type="number" id="count-product" name="amount"
														value="${product.amount }"> <label for="amount">Số
														lượng<span>*</span>
													</label>
												</div>
												<div class="col-sm-2 col-xs-6">
													<input type="text" id="link-img" name="image"
														value="${product.image }"> <label for="image">Hình
														ảnh</label>
												</div>
												<div class="col-sm-2 col-xs-6">
													<select id="status" name="status">
														<jstl:choose>
															<jstl:when test="${product.status==0 }">
																<option value="0">0 (Ẩn)</option>
																<option value="1">1 (Gần hết hàng)</option>
																<option value="2">2 (Mở bán)</option>
															</jstl:when>
															<jstl:when test="${product.status==1}">
																<option value="1">1 (Gần hết hàng)</option>
																<option value="0">0 (Ẩn)</option>
																<option value="2">2 (Mở bán)</option>
															</jstl:when>
															<jstl:otherwise>
																<option value="2">2 (Mở bán)</option>
																<option value="1">1 (Gần hết hàng)</option>
																<option value="0">0 (Ẩn)</option>
															</jstl:otherwise>
														</jstl:choose>

													</select> <label for="status" class="level-span">Trạng thái</label>
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
														value="${product.productDetail.gift }"> <label
														for="gift">Quà tặng</label>
												</div>
											</li>
											<li class="row">
												<div class="col-sm-6 col-xs-6">
													<input type="text" id="screen" name="monitors"
														value="${product.productDetail.monitors }"> <label
														for="monitors">Màn hình</label>
												</div>
												<div class="col-sm-6 col-xs-6">
													<input type="text" id="hdh" name="os"
														value="${product.productDetail.os }"> <label
														for="os">Hệ điều hành</label>
												</div>
											</li>
											<li class="row">
												<div class="col-sm-6 col-xs-6">
													<input type="text" id="cpu" name="cpu"
														value="${product.productDetail.cpu }"> <label
														for="cpu">CPU</label>
												</div>
												<div class="col-sm-6 col-xs-6">
													<input type="text" id="ram" name="ram"
														value="${product.productDetail.ram }"> <label
														for="ram">RAM</label>
												</div>
											</li>
											<li class="row">
												<div class="col-sm-6 col-xs-6">
													<input type="text" id="camera" name="camera"
														value="${product.productDetail.camera }"> <label
														for="camera">CAMERA</label>
												</div>
												<div class="col-sm-6 col-xs-6">
													<input type="text" id="pin" name="pin"
														value="${product.productDetail.pin }"> <label
														for="pin">PIN</label>
												</div>
											</li>
										</ul>
										<div class="btn-submit">
											<a href="../products_manage"
												class="btn default btn-xs black go-to-back">Trở lại</a>
											<button type="submit" id="update-btn">
												<i class="fa fa-pencil-square-o fa-fw" aria-hidden="true"></i>Cập
												nhật
											</button>
										</div>
									</form>
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
	<!-- Custom Theme JavaScript -->
	<script src="../../resources/js/validation-form/vali-form.js"></script>
</body>
</html>
