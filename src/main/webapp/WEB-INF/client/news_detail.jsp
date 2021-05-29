<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Chi Tiet Tin Tuc</title>
<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
</head>
<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="news-detail" class="bg-news">
			<div class="container">
				<div class="content-news justify-space-between">

					
					<div class="content-post">
						<h5 id="title-news">${news.title }</h5>
						<span class="date">${news.byDate }</span>
						<div class="content-left">
							${news.content }
							<div class="author">
								<b>Theo: </b><span>ATM</span>
							</div>
						</div>
					</div>
					<div class="frame-hot-post">
						<div class="hot-post">
							<h5>BÀI VIẾT NỔI BẬT</h5>

							<div class="content-right">
								<jstl:forEach items="${listNews }" var="news">
									<div class="news-text-img-subs">
										<a href="../../news_detail/${news.id }">
											<div class="img-news">
												<img src="../${news.image }" alt="" />
											</div>
											<figure>
												<div class="text-news">${news.title }</div>
												<span class="date">${news.byDate }</span>
												<p class="content-sale">${news.description }</p>
											</figure>
										</a>
									</div>
								</jstl:forEach>
							</div>
						</div>
						<div class="social">
							<h5>THEO DÕI ATM TRÊN SOCIAL</h5>
							<div class="icon-social d-flex justify-content-around">
								<div class="ss-facebook justify-center">
									<i class="fa fa-facebook"></i> <span>FACEBOOK</span>
								</div>
								<div class="ss-youtube justify-center">
									<i class="fa fa-youtube-play"></i> <span>YOUTUBE</span>
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
</body>

</html>