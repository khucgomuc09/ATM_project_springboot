<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>San Pham</title>
<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
</head>
<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="products">
			<div class="container">
				<div id="main-products">
					<div class="banner-product">

						<img
							src="../img/banner/banner_<jstl:out value="${supplier }" />.png"
							alt="" />
					</div>
					<div class="product-child box-shadow hover-ab">
						<div class="sort">
							<!-- asc -->
							<a href="#" class="click-sort active">Mới nhất</a> <a href="#"
								class="click-sort ">Giá: Thấp - Cao </a> <a href="#"
								class="click-sort ">Giá: Cao - Thấp</a>
						</div>
						<ul class="homeproduct filter-cate ">
							<jstl:forEach items="${list_products }" var="product">

								<li><a href="${product.supplier }/${product.id}"> <img
										src="${product.image }" alt="" />
										<h3>${product.name}</h3>

										<div class="price">
											<jstl:choose>
												<jstl:when
													test="${product.price_remaining < product.price }">
													<span><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${product.price }" /> VND</span>
													<strong> <fmt:formatNumber type="number"
															maxFractionDigits="3" value="${product.price_remaining }" />
														VND
													</strong>
												</jstl:when>
												<jstl:otherwise>
													<strong> <fmt:formatNumber type="number"
															maxFractionDigits="3" value="${product.price_remaining }" />
														VND
													</strong>
												</jstl:otherwise>
											</jstl:choose>
										</div>
										<div class="ratingresult">
											<i class="fa fa-star" aria-hidden="true"></i> <i
												class="fa fa-star" aria-hidden="true"></i> <i
												class="fa fa-star" aria-hidden="true"></i>
											<jstl:choose>
												<jstl:when test="${product.productDetail.danhgia==4.0 }">
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"
														style="color: darkgray"></i>
												</jstl:when>
												<jstl:when test="${product.productDetail.danhgia==4.5 }">
													<i class="fa fa-star-half-o" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"
														style="color: darkgray"></i>
												</jstl:when>
												<jstl:when test="${product.productDetail.danhgia==5.0 }">
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
												</jstl:when>
												<jstl:otherwise>
													<i class="fa fa-star" aria-hidden="true"
														style="color: darkgray"></i>
													<i class="fa fa-star" aria-hidden="true"
														style="color: darkgray"></i>
												</jstl:otherwise>
											</jstl:choose>

											<span>${product.productDetail.danhgia } đánh giá</span>
										</div>
										<div class="promo noimage">
											<jstl:if test="${product.productDetail!=null }">
												<p>${product.productDetail.gift }</p>
											</jstl:if>

										</div>
										<figure class="bginfo">
											<span>${product.productDetail.monitors }</span>
											<span>${product.productDetail.os }</span>
											<span>${product.productDetail.cpu }</span>
											<span>${product.productDetail.ram }</span>
											<span>${product.productDetail.camera }</span>
											<span>${product.productDetail.pin }</span>
										</figure> <jstl:if test="${product.price_remaining < product.price }">
											<label class="discount">GIẢM <fmt:formatNumber
													type="number" maxFractionDigits="3"
													value="${product.price-product.price_remaining }" /> VND
											</label>
										</jstl:if>
								</a>
									<div class="btnbuy justify-center">
										<div class="hover-btn-cart">
											<input type="hidden" class="msp-ajax" value="${product.id }">
											<button class="btn_buynow buy-ajax">
												Thêm vào giỏ<i class="fa fa-shopping-cart"
													aria-hidden="true"></i>
											</button>
										</div>
									</div></li>
							</jstl:forEach>
						</ul>

						<div class="container pagina">
							<div class="pagination" id="pagination">
								<ul style="display: flex; padding-inline: 16px;">
									<jstl:choose>
										<jstl:when test="${current_page-1>=0}">
											<li style="margin-inline: 5px;"><a
												href="${supplier }?page=${current_page-1}">Previous</a></li>
										</jstl:when>
										<jstl:otherwise>
											<li style="margin-inline: 5px; display: none;"><a
												href="${supplier }?page=${current_page-1}">Previous</a></li>
										</jstl:otherwise>
									</jstl:choose>


									<span style="margin-inline: 5px;">
										${current_page+1}/${total_pages } </span>
									<jstl:choose>
										<jstl:when test="${current_page+1<total_pages}">
											<li style="margin-inline: 5px;"><a
												href="${supplier }?page=${current_page+1}">Next</a></li>
										</jstl:when>
										<jstl:otherwise>
											<li style="margin-inline: 5px; display: none;"><a
												href="${supplier }?page=${current_page+1}">Next</a></li>
										</jstl:otherwise>
									</jstl:choose>

								</ul>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="countPages" value=""> <input
			type="hidden" id="producer" value=""> <input type="hidden"
			id="page" value=""> <input type="hidden" id="sort" value="">
	</section>
	<!--footer-->
	<jsp:include page="Libs/footer-animation.jsp"></jsp:include>
	<!--footer-->
	<!--js--start-->
	<jsp:include page="Libs/fragment-footer.jsp"></jsp:include>
	<!--js--end-->
</body>

<script src="../../resources/js/addToCart_AJAX.js"
	type="text/javascript"></script>

</html>