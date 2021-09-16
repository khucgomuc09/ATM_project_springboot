<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Cart</title>
<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
<style type="text/css">
.button-vnp {
	background-color: #0095ff;
	border: 1px solid transparent;
	border-radius: 3px;
	box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	font-family: -apple-system, system-ui, "Segoe UI", "Liberation Sans",
		sans-serif;
	font-size: 13px;
	font-weight: 400;
	line-height: 1.15385;
	margin: 0;
	outline: none;
	padding: 8px .8em;
	position: relative;
	text-align: center;
	text-decoration: none;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: baseline;
	white-space: nowrap;
	width: 40%; margin-left : 32px;
	margin-right: 8px;
	margin-left: 32px;
}

.button-vnp:hover, .button-vnp:focus {
	background-color: #07c;
}

.button-vnp:focus {
	box-shadow: 0 0 0 4px rgba(0, 149, 255, .15);
}

.button-vnp:active {
	background-color: #0064bd;
	box-shadow: none;
}

.button-cod {
	width: 40%;
	background-color: #848484;
	border: 1px solid transparent;
	border-radius: 3px;
	box-shadow: rgba(255, 255, 255, .4) 0 1px 0 0 inset;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	display: inline-block;
	font-family: -apple-system, system-ui, "Segoe UI", "Liberation Sans",
		sans-serif;
	font-size: 13px;
	font-weight: 400;
	line-height: 1.15385;
	margin: 0;
	outline: none;
	padding: 8px .8em;
	position: relative;
	text-align: center;
	text-decoration: none;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
	vertical-align: baseline;
	white-space: nowrap;
}

.button-cod:hover, .button-cod:focus {
	opacity: 0.8;
}

.button-cod:focus {
	box-shadow: 0 0 0 4px #6f6e6e4a;
}

.button-cod:active {
	background-color: #676767d4;
	box-shadow: none;
}

.text-payment {
	text-align: center;
	margin: 0;
	font-size: 18px;
	color: #28a745;
}
</style>
</head>

<body>
	<!--header-->
	<jsp:include page="Libs/header-simple.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="frame-cart">
			<div class="container d-flex">
				<div id="info-product">
					<div class="title-top space-between">

						<div class="title-ic">
							<!-- session gio hang user -->
							<span><i class="fa fa-shopping-cart"></i>Giỏ hàng của
								bạn(có</span> <span id="count-pro"><jstl:choose>
									<jstl:when test="${order!=null}">
						${order.total}
						</jstl:when>
									<jstl:otherwise>
						0</jstl:otherwise>
								</jstl:choose></span><span>sản phẩm)</span>
						</div>
						<a href="/">Tiếp tục mua hàng</a>
					</div>
					<div class="contain-product">
						<ul>
							<!-- gio hang -->
							<jstl:choose>
								<jstl:when test="${order.cartItems!=null }">
									<jstl:forEach items="${order.cartItems }" var="item">

										<li class="item-cart">
											<div class="d-flex">
												<div class="img-pro">
													<a href="../${item.product.supplier }/${item.product.id }">
														<img src="${item.product.image }" alt="" />
													</a>
												</div>
												<div class="tit-cou">
													<h5>${item.product.name }</h5>
													<div class="d-flex align-i-center">
														<span class="count">Số lượng:</span>
														<div class="frame-num d-flex">
															<button class="subject">-</button>
															<input type="number" class="number-pro"
																value="${item.quantity }" min="1" required>
															<button class="plus">+</button>
															<input type="hidden" class="msp"
																value="${item.product.id }">
														</div>
														<span class="upgrade"><i class="fa fa-upload"
															aria-hidden="true"></i></span>
													</div>
												</div>
											</div>
											<div class="price-pro flex-direction-col">
												<div class="flex-direction-col">
													<span class="price" id=${ item.product.id }><fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${item.product.price_remaining }" /> VND</span> <span>(Giá
														đã bao gồm VAT)</span>
												</div>
												<input type="hidden" class="msp-trash"
													value="${item.product.id }"> <input type="hidden"
													class="tensp-trash" value="${item.product.name }">
												<span class="trash"><i class="fa fa-trash"
													aria-hidden="true"></i></span>
											</div>
										</li>

									</jstl:forEach>
								</jstl:when>
								<jstl:otherwise>
									<div class="cart-empty">Không có gì trong giỏ hàng.</div>
								</jstl:otherwise>
							</jstl:choose>


						</ul>
					</div>
					<div class="payment space-between">
						<div class="total d-flex align-i-center">
							<!-- check gio hang empty -->
							<h5>TỔNG CỘNG</h5>
							<span id="total"><fmt:formatNumber type="number"
									maxFractionDigits="3" value="${order.total_price }" /> VND</span>
						</div>
						<!--  chech gio hang & user !null  location.href='../payment' -->
						<jstl:choose>
							<jstl:when
								test="${user!=null&&order!=null&&order.cartItems!=null }">

								<button id="btn-submit" data-toggle="modal"
									data-target="#payment-method">ĐẶT HÀNG</button>


								<div id="payment-method" class="modal fade modal-confirm"
									role="dialog">
									<div class="modal-dialog modal-sm">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-body">
												<p class="text-payment">Xác nhận phương thức thanh toán
												</p>
											</div>
											<div class="modal-footer">
												<form action="payment/vnpay" method="post" id="form-vnpay">
												</form>
												<form action="payment" method="post" id="form-cod"></form>

												<button type="button" class="button-cod"
													onclick="document.getElementById('form-cod').submit();">COD</button>
												<button type="button" class="button-vnp"
													onclick="document.getElementById('form-vnpay').submit();">VNPAY</button>
											</div>
										</div>
									</div>
								</div>


							</jstl:when>
							<jstl:otherwise>
								<button data-toggle="modal" data-target="#checkout"
									id="btn-submit">ĐẶT HÀNG</button>
								<div id="checkout" class="modal fade modal-confirm"
									role="dialog">
									<div class="modal-dialog modal-sm">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-body">
												<p class="text-content">Đăng nhập để thực hiện đặt hàng!</p>
											</div>
											<div class="modal-footer">

												<button type="button" onclick="location.href='../login'"
													class="btn-cf">Đăng nhập</button>
												<button type="button" class="tbn-cancle"
													data-dismiss="modal">Hủy</button>
											</div>
										</div>
									</div>
								</div>
							</jstl:otherwise>
						</jstl:choose>
					</div>
				</div>
				<div id="info-user">
					<div class="title-top title-ic">
						<span>Thông tin nhận hàng</span>
					</div>
					<div class="form-info form-cart">
						<jstl:choose>
							<jstl:when test="${user!=null }">
								<form id="form-validate" class="form-style" action="#">
									<div>
										<span>Họ và Tên:</span> <input type="text" id="full-name"
											name="fullname" value="${user.fullname }" disabled>
									</div>
									<div>
										<span>Số điện thoại:</span> <input name="phone" id="sdt"
											type="number" value="${user.phone }" disabled>
									</div>
									<div>
										<span>Địa chỉ Email:</span> <input type="text" id="email"
											name="email" value="${user.email }" disabled>
									</div>
									<div>
										<span>Địa chỉ:</span> <input type="text" id="address-oder"
											name="address-oder" value="${user.address }" disabled>
									</div>
								</form>
							</jstl:when>
							<jstl:otherwise>
								<form id="form-validate" class="form-style" action="#">
									<div>
										<span>Họ và Tên:</span> <input type="text" id="full-name"
											name="fullname" value="" disabled>
									</div>
									<div>
										<span>Số điện thoại:</span> <input name="phone" id="sdt"
											type="number" value="" disabled>
									</div>
									<div>
										<span>Địa chỉ Email:</span> <input type="text" id="email"
											name="email" value="" disabled>
									</div>
									<div>
										<span>Địa chỉ:</span> <input type="text" id="address-oder"
											name="address-oder" value="" disabled>
									</div>
								</form>
							</jstl:otherwise>
						</jstl:choose>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--footer-->
	<jsp:include page="Libs/footer.jsp"></jsp:include>
	<!--footer-->
	<!--js--start-->
	<jsp:include page="Libs/fragment-footer.jsp"></jsp:include>
	<!--js page-->
	<script src="../../resources/js/cart.js"></script>
	<!--js page-->
	<!--js--end-->
</body>

</html>