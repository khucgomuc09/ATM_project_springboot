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
<title>Home</title>
<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
<link rel="stylesheet" href="../../resources/libs/slick/slick.css">
<link rel="stylesheet" href="../../resources/libs/slick/slick-theme.css">
<!--    css-->
</head>

<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="banner">
			<div class="container d-flex">
				<div class="contain-slide">
					<div id="icon-pre" class="icon-flow">
						<i class="fa fa-angle-left" aria-hidden="true"></i>
					</div>
					<div id="icon-next" class="icon-flow">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</div>
					<div class="slides">
						<div id="s1" class="slide">
							<img src="img/slider/1.png" alt="">
						</div>
						<div class="slide">
							<img src="img/slider/2.jpg" alt="">
						</div>
						<div class="slide">
							<img src="img/slider/3.png" alt="">
						</div>
						<div class="slide">
							<img src="img/slider/4.png" alt="">
						</div>
						<div class="slide">
							<img src="img/slider/5.jpg" alt="">
						</div>
					</div>
				</div>
				<div class="news-banner">
					<div class="news-img news-bd">
						<div class="news-img-top news-bd">
							<a href="#"><img src="img/news/news-img-1.png" height="110"
								width="398" alt="" /></a>
						</div>
						<div class="news-img-bot news-bd">
							<a href="#"><img src="img/news/new-img-2.png" height="110"
								width="398" alt="" /></a>
						</div>
					</div>
					<div class="news-text news-bd">
						<div class="news-text-title space-between">
							<h6>TIN CÔNG NGHỆ NỔI BẬT</h6>
							<a href="news">Xem tất cả</a>
						</div>
						<div class="news-text-img">
							<!--  -->
							<jstl:forEach items="${hightlight_news}" var="news">

								<div class="news-text-img-subs space-between">
									<div class="img-news">
										<a href="news/${news.id }"> <img src="${news.image }"
											alt="" /></a>
									</div>
									<div class="text-news">
										<a href="news/${news.id }"> ${news.description }</a>
									</div>
								</div>

							</jstl:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="banner-home container">
			<img src="img/banner/1200-75-1200x75.png" alt="">
		</div>
		<div id="products">
			<div class="container">
				<div id="main-products">
					<div class="title-product">
						<h2>SẢN PHẨM MỚI</h2>
						<a class="more_product_type" href="#" style="margin-left: 10px">xem
							thêm</a>
					</div>
					<div class="new-products box-shadow hover-ab">
						<div class="autoplay slider" data-sizes="50vw">
							<%--    0:new, 1Hot, 2Sale--%>
							<!-- foreach items new product -->
							<jstl:forEach items="${newProducts }" var="newProduct">

								<div class="owl-item">
									<div class="item">
										<a href="${newProduct.supplier }/${newProduct.id }"> <img
											src="${newProduct.image }" alt="" />
											<h3 style="text-align: center">${newProduct.name }</h3>
											<div class="price">
												<jstl:choose>
													<jstl:when
														test="${newProduct.price > newProduct.price_remaining }">
														<span> <fmt:formatNumber type="number"
																maxFractionDigits="3" value="${newProduct.price }" />
															vnd
														</span>
														<strong> <fmt:formatNumber type="number"
																maxFractionDigits="3"
																value="${newProduct.price_remaining }" /> vnd
														</strong>
													</jstl:when>
													<jstl:otherwise>
														<strong style="text-align: center"><fmt:formatNumber
																type="number" maxFractionDigits="3"
																value="${newProduct.price_remaining }" /> vnd</strong>
													</jstl:otherwise>
												</jstl:choose>
											</div> <jstl:if
												test="${newProduct.price > newProduct.price_remaining }">
												<label class="discount"> Giảm <fmt:formatNumber
														type="number" maxFractionDigits="3"
														value="${newProduct.price-newProduct.price_remaining }" />
													"vnd"
												</label>
											</jstl:if>
										</a>
									</div>
								</div>
							</jstl:forEach>
						</div>
					</div>

					<div class="title-product">
						<h2>SẢN PHẨM HOT</h2>
						<a class="more_product_type" href="#" style="margin-left: 10px">xem
							thêm</a>
					</div>

					<div class="hot-products box-shadow hover-ab">
						<div class="regular slider" data-sizes="50vw">
							<jstl:forEach items="${hotProducts }" var="hotProduct">

								<div class="owl-item">
									<div class="item">
										<a href="${hotProduct.supplier }/${hotProduct.id }"> <img
											src="${hotProduct.image }" alt="" />
											<h3 style="text-align: center">${hotProduct.name }</h3>
											<div class="price">
												<jstl:choose>
													<jstl:when
														test="${hotProduct.price > hotProduct.price_remaining }">
														<span> <fmt:formatNumber type="number"
																maxFractionDigits="3" value="${hotProduct.price }" />
															vnd
														</span>
														<strong> <fmt:formatNumber type="number"
																maxFractionDigits="3"
																value="${hotProduct.price_remaining }" /> vnd
														</strong>
													</jstl:when>
													<jstl:otherwise>
														<strong style="text-align: center"> <fmt:formatNumber
																type="number" maxFractionDigits="3"
																value="${hotProduct.price_remaining }" /> vnd
														</strong>
													</jstl:otherwise>
												</jstl:choose>
											</div> <jstl:if
												test="${hotProduct.price > hotProduct.price_remaining }">
												<label class="discount"> Giảm <fmt:formatNumber
														type="number" maxFractionDigits="3"
														value="${hotProduct.price - hotProduct.price_remaining }" />
													"vnd"
												</label>
											</jstl:if>
										</a>
									</div>
								</div>
							</jstl:forEach>
						</div>

					</div>

					<div class="title-product">
						<h2>SẢN PHẨM KHUYẾN MẠI</h2>
						<a class="more_product_type" href="#" style="margin-left: 10px">xem
							thêm</a>
					</div>

					<div class="sale-products box-shadow hover-ab">
						<div class="regular slider" data-sizes="50vw">

							<jstl:forEach items="${saleProducts }" var="saleProduct">

								<div class="owl-item">
									<div class="item">
										<a href="${saleProduct.supplier }/${saleProduct.id }"> <img
											src="${saleProduct.image }" alt="" />
											<h3 style="text-align: center">${saleProduct.name }</h3>
											<div class="price">
												<jstl:choose>
													<jstl:when
														test="${saleProduct.price > saleProduct.price_remaining }">
														<span> <fmt:formatNumber type="number"
																maxFractionDigits="3" value="${saleProduct.price }" />
															vnd
														</span>
														<strong><fmt:formatNumber type="number"
																maxFractionDigits="3"
																value="${saleProduct.price_remaining }" /> vnd</strong>
													</jstl:when>
													<jstl:otherwise>
														<strong style="text-align: center"><fmt:formatNumber
																type="number" maxFractionDigits="3"
																value="${saleProduct.price_remaining }" /> vnd</strong>
													</jstl:otherwise>
												</jstl:choose>
											</div> <jstl:if
												test="${saleProduct.price > saleProduct.price_remaining }">
												<label class="discount"> Giảm <fmt:formatNumber
														type="number" maxFractionDigits="3"
														value="${saleProduct.price-saleProduct.price_remaining }" />
													"vnd"
												</label>
											</jstl:if>
										</a>
									</div>
								</div>
							</jstl:forEach>


						</div>
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
	<!--js--page-->
	<script src="../../resources/js/slides-banner.js"></script>
	<script src="../../resources/libs/slick/slick-types.js"></script>
	<script src="../../resources/libs/slick/slick.js"></script>
	<!--js page-->
	<!--js--end-->

</body>

</html>