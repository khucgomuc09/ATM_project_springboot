<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Chi Tiet San Pham</title>
<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
<style>
#products {
	padding: 20px 0;
}
</style>
<!--    style page-->
<!--    css-->
</head>
<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="products">
			<div class="container">
				<div id="frame-detail" class="d-flex">
					<div class="img-products">
						<img src="../${product.image}" alt="" />
					</div>
					<div class="detail-products">
						<div class="title-top">
							<h3>${product.name }</h3>
							<div class="d-flex">
								<div class="text-producer d-flex">
									<span>Thương hiệu:</span> <span id="producer">${product.supplier }</span>
								</div>
							</div>
						</div>
						<div class="price">
							<div class="align-i-center">
								<jstl:choose>
									<jstl:when test="${product.price > product.price_remaining }">
										<span> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${product.price }" /> vnd
										</span>
										<strong> <fmt:formatNumber type="number"
												maxFractionDigits="3" value="${product.price_remaining }" />
											vnd
										</strong>
									</jstl:when>
									<jstl:otherwise>
										<strong style="text-align: center"><fmt:formatNumber
												type="number" maxFractionDigits="3"
												value="${product.price_remaining }" /> vnd</strong>
									</jstl:otherwise>
								</jstl:choose>
							</div>
							<span class="vat">(Đã bao gồm VAT)</span>
						</div>
						<div class="guarantee d-flex">
							<span>Bảo hành: 24 tháng.</span> <a href="guarentee.jsp">(Quy
								định bảo hành)</a>
						</div>
						<div class="add-to-cart d-flex">
							<input type="hidden" class="msp-ajax" value="${product.id}">
							<button class="btn_buynow buy-ajax">THÊM VÀO GIỎ HÀNG</button>
						</div>
					</div>
				</div>
				<div id="cmt-rating" class="justify-space-between">
					<div class="cmt">
						<div class="info-tech">
							<div>
								<h4>THÔNG SỐ KỸ THUẬT</h4>
								<ul>
									<li><b>Màn hình</b>: ${product.productDetail.monitors}</li>
									<li><b>CPU</b>: ${product.productDetail.cpu}</li>
									<li><b>RAM</b>: ${product.productDetail.ram}</li>
									<li><b>Camera</b>: ${product.productDetail.camera}</li>
									<li><b>PIN</b>: ${product.productDetail.pin}</li>
								</ul>
							</div>

						</div>
						<div class="rating cmt-cus">
							binh luan
							<ul>

								<h6>bình luận</h6>
								<!-- for binhluan -->
								<li class="cus">
									<h6>hoten</h6> <span class="date">ngaybl</span>
									<p>noidung</p>
								</li>
								<h6>Chưa có bình luận</h6>

							</ul>
						</div>
						<h5>Bình luận</h5>
						<form id="cmt-post" action="#" method="post">
							<textarea id="cmt" name="cmt"
								placeholder="Mời bạn để lại bình luận..." minlength="1" required></textarea>
							<div class="justify-center btn-detail">
								<!-- if member null -->
								<button type="submit" id="post">
									Gửi bình luận<i class="fa fa-paper-plane" aria-hidden="true"></i>
								</button>
								<!-- else -->
								<a href="#"
									onclick="return confirm('Bạn cần đăng nhập để bình luận')"
									id="post">Gửi bình luận<i class="fa fa-paper-plane"
									aria-hidden="true"></i></a>
							</div>
						</form>

					</div>
					<div style="width: 38%">
						<div class="rating space-between rt-pro">
							<a href="#"><img src="../${product.image }" alt="" /></a>
							<div class="rating-post">
								<h6>${product.name }</h6>
								<h6>Đánh giá</h6>
								<div id="rating">
									<input type="radio" id="star5" name="rating" value="5" /> <label
										class="full" for="star5" title="Awesome - 5 stars"></label> <input
										type="radio" id="star4half" name="rating" value="4 and a half" />
									<label class="half" for="star4half"
										title="Pretty good - 4.5 stars"></label> <input type="radio"
										id="star4" name="rating" value="4" /> <label class="full"
										for="star4" title="Pretty good - 4 stars"></label> <input
										type="radio" id="star3half" name="rating" value="3 and a half" />
									<label class="half" for="star3half" title="Meh - 3.5 stars"></label>

									<input type="radio" id="star3" name="rating" value="3" /> <label
										class="full" for="star3" title="Meh - 3 stars"></label> <input
										type="radio" id="star2half" name="rating" value="2 and a half" />
									<label class="half" for="star2half"
										title="Kinda bad - 2.5 stars"></label> <input type="radio"
										id="star2" name="rating" value="2" /> <label class="full"
										for="star2" title="Kinda bad - 2 stars"></label> <input
										type="radio" id="star1half" name="rating" value="1 and a half" />
									<label class="half" for="star1half" title="Meh - 1.5 stars"></label>

									<input type="radio" id="star1" name="rating" value="1" /> <label
										class="full" for="star1" title="Sucks big time - 1 star"></label>

									<input type="radio" id="starhalf" name="rating" value="half" />
									<label class="half" for="starhalf"
										title="Sucks big time - 0.5 stars"></label>
								</div>
								<div class="post-rating">
									<button type="button">Gửi đánh giá của bạn</button>
								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</section>
	<!--footer-->
	<jsp:include page="Libs/footer-animation.jsp"></jsp:include>
	<!--footer-->
	<!--js--start-->
	<jsp:include page="Libs/fragment-footer.jsp"></jsp:include>
	<!--js--end-->
	<!--js page-->
	<script src="../../resources/js/addToCart_AJAX.js"
		type="text/javascript"></script>
	<script>
		function calcRate(r) {
			const f = ~~r, //Tương tự Math.floor(r)
			id = 'star' + f + (r % f ? 'half' : '')
			id && (document.getElementById(id).checked = !0)
		}
	</script>
	<!--js page-->
</body>

</html>