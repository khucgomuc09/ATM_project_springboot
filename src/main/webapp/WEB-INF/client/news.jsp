<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Tin Tuc</title>
<jsp:include page="Libs/fragment-header.jsp"></jsp:include>
</head>
<body>
	<!--header-->
	<jsp:include page="Libs/header.jsp"></jsp:include>
	<!--header-->
	<section id="body">
		<div id="news" class="bg-news">
			<div class="container">
				<div class="content-news justify-space-between">
					<div class="news-new">
						<h5>TIN TỨC MỚI NHẤT</h5>
						<div class="content-left">
							<jstl:forEach items="${list_news }" var="news">
								<jstl:if test="${news.type==0 }">
									<div class="frame-content">
										<a href="news_detail/${news.id }">
											<div class="img-news">
												<img src="${news.image }" alt="">
											</div>
											<div class="title-news">
												<h6>${news.title }</h6>
												<span class="date">${news.byDate }</span>
												<figure class="content-news-main">${news.description }...
												</figure>
											</div>
										</a>
									</div>
								</jstl:if>
							</jstl:forEach>
						</div>
						<div class="justify-center see-plus-news">
							<button class="see-btn-news" type="button">
								Xem thêm<i class="fa fa-plus" aria-hidden="true"></i>
							</button>
						</div>
					</div>
					<div class="sale-new">
						<h5>TIN KHUYẾN MÃI MỚI NHẤT</h5>
						<div class="content-right">

							<jstl:forEach items="${list_news }" var="news">
								<jstl:if test="${news.type==1 }">
									<div class="news-text-img-subs">
										<a href="news_detail/${news.id }">
											<div class="img-news">
												<img src="${news.image }" alt="">
											</div>
											<div class="title-news">
												<h6>${news.title }</h6>
												<span class="date">${news.byDate }</span>
												<figure class="content-news-main">${news.description }...
												</figure>
											</div>
										</a>
									</div>
								</jstl:if>
							</jstl:forEach>
						</div>
						<div class="justify-center see-plus-news">
							<button class="see-btn-news" type="button">
								Xem thêm<i class="fa fa-plus" aria-hidden="true"></i>
							</button>
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
	<!--js page-->
	<script>
    $(document).ready(function () {
        $('.see-btn-news').click(function () {
            let parent = this.parentNode.parentNode;
            let child = parent.children.item(1);
            if (this.innerHTML.includes('Xem thêm')) {
                this.innerHTML = this.innerHTML.replace('Xem thêm', 'Thu gọn');
                child.style.height = 'max-content';
            } else {
                this.innerHTML = this.innerHTML.replace('Thu gọn', 'Xem thêm');
                child.style.height = '500px';
            }

        });
    });
</script>
	<!--js page-->
	<!--js--start-->
</body>

</html>