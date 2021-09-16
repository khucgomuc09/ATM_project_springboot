<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoá đơn thanh toán</title>
<link rel="stylesheet" href="../../resources/css/invoice.css"
	media="all" />
</head>
<body>
	<main>
		<h1 class="clearfix">
			<small><span>DATE</span><br />${date }</small> Hoá Đơn Thanh Toán <small><span>TIME</span><br />${time }</small>
		</h1>
		<table>
			<thead>
				<tr>
					<th class="service">#</th>
					<th class="desc">Sản Phẩm</th>
					<th>Đơn Giá</th>
					<th>Số Lượng</th>
					<th>Tổng</th>
				</tr>
			</thead>
			<tbody>
				<jstl:set var="count" value="1"></jstl:set>
				<jstl:forEach items="${order.cartItems }" var="cartItem">

					<tr>
						<td class="service">${count}</td>
						<td class="desc">${cartItem.product.name }</td>
						<td class="unit"><fmt:formatNumber type="number"
								maxFractionDigits="3"
								value="${cartItem.product.price_remaining }" /> VND</td>
						<td class="qty">${cartItem.quantity }</td>
						<td class="total"><fmt:formatNumber type="number"
								maxFractionDigits="3" value="${cartItem.price }" /> VND</td>
					</tr>
					<jstl:set var="count" value="${count+1 }"></jstl:set>
				</jstl:forEach>


				<tr>
					<td colspan="4" class="grand total">Tổng Cộng</td>
					<td class="grand total"><fmt:formatNumber type="number"
							maxFractionDigits="3" value="${order.total_price }" /> VND</td>
				</tr>
			</tbody>
		</table>
		<div id="details" class="clearfix">
			<div id="project">
				<div class="arrow">
					<div class="inner-arrow">
						<span>PROJECT</span> ATM Website
					</div>
				</div>
				<div class="arrow">
					<div class="inner-arrow">
						<span>CLIENT</span> ${user.fullname }
					</div>
				</div>
				<div class="arrow">
					<div class="inner-arrow">
						<span>ADDRESS</span> ${user.address }
					</div>
				</div>
				<div class="arrow">
					<div class="inner-arrow">
						<span>EMAIL</span> <a href="#">${user.email }</a>
					</div>
				</div>
			</div>
			<div id="company">
				<div class="arrow back">
					<div class="inner-arrow">
						ATM <span>COMPANY</span>
					</div>
				</div>
				<div class="arrow back">
					<div class="inner-arrow">
						NongLam University <span>ADDRESS</span>
					</div>
				</div>
				<div class="arrow back">
					<div class="inner-arrow">
						(602) 519-0450 <span>PHONE</span>
					</div>
				</div>
				<div class="arrow back">
					<div class="inner-arrow">
						<a href="mailto:atm_selling_phone@gmail.com">atm_selling_phone@gmail.com</a>
						<span>EMAIL</span>
					</div>
				</div>
			</div>
		</div>
		<div id="notices">
			<div>NOTICE:</div>
			<div class="notice">Hoá đơn này chỉ có khi khách hàng thanh
				toán online</div>
		</div>
		<a id="home-menu" href="/"><span>Quay lại ATM website</span></a>
	</main>
	<footer> ATM rất hân hạnh được phục vụ quý khách </footer>
</body>
</html>