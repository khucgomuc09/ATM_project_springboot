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

<title>Đơn Hàng</title>

<jsp:include page="Libs-Admin/fragment-main.jsp"></jsp:include>

<jsp:include page="Libs-Admin/frag-table-header.jsp"></jsp:include>


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
								<li><i class="fa fa-home"></i> <a href="/">Home</a> <i
									class="fa fa-angle-right"></i></li>
								<li><a href="order_manage">Quản lý đơn hàng</a></li>
							</ul>
						</div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-shopping-cart"></i> Đơn hàng
							</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<jsp:include page="Libs-Admin/dialog-admin.jsp"></jsp:include>
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>#</th>
												<th>Tên khách hàng</th>
												<%--                                        <th>Email</th>--%>
												<th>Số điện thoại</th>
												<th>Địa chỉ</th>
												<!-- <th>Ngày tạo</th>  -->
												<th class="remove">Xem chi tiết</th>
												<th class="remove">Trạng thái</th>
												<th class="remove" style="text-align: center">Xóa</th>
											</tr>
										</thead>
										<tbody>

											<jstl:forEach items="${list_users }" var="user">
												<jstl:forEach items="${user.orders }" var="order">


													<tr class="odd gradeX">
														<td id="">${ order.id}</td>
														<td>${user.fullname }</td>
														<%--                                        <td><%=gh.getEmail()%>--%>
														<%--                                        </td>--%>
														<td>${user.phone }</td>
														<td>${user.address }</td>
														<!-- 	<td>ngaythanhtoan</td> -->
														<td style="text-align: center">
															<button id="btn_detail" data-toggle="modal"
																data-target="#${order.id }" class="label label-success"
																style="border: none">Xem chi tiết</button>
														</td>
														<jstl:choose>
															<jstl:when test="${order.status==1 }">
																<td style="text-align: center"><span
																	style="background-color: #3c8d86"
																	class="label label-success">Đã xác nhận</span></td>
															</jstl:when>
															<jstl:otherwise>
																<td style="text-align: center"><input
																	value="${ order.id}" hidden="true" />
																	<button class="btn_cf_order label label-warning"
																		style="border: none">Chờ xác nhận</button></td>
															</jstl:otherwise>
														</jstl:choose>

														<td style="text-align: center"><a data-toggle="modal"
															data-target="#${order.id }cf"
															class="btn default btn-xs black btn-delete"><i
																class="fa fa-trash-o"></i></a>
															<div id="${order.id }cf" class="modal fade modal-confirm"
																role="dialog">
																<div class="modal-dialog modal-sm">
																	<!-- Modal content-->
																	<div class="modal-content">
																		<div class="modal-body">
																			<p class="text-content">
																				Xác nhận xóa đơn hàng <em>${order.id }</em>
																			</p>
																		</div>
																		<div class="modal-footer">
																			<form action="delete_order/${order.id}" method="post">
																				<button type="button" class="tbn-cancle"
																					data-dismiss="modal" style="margin-right: 1%">Hủy</button>
																				<button type="submit" class="btn-cf">Xác

																					nhận</button>
																			</form>

																		</div>
																	</div>
																</div>
															</div></td>
													</tr>

													<div id="${order.id }" class="modal fade" tabindex="-1"
														role="dialog">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																	<h4 class="modal-title">CHI TIẾT ĐƠN HÀNG</h4>
																</div>
																<div class="modal-body modal-ctdh">

																	<div class="form-ctdh">
																		<div class="title-top">
																			<ul class="row">
																				<li class="col-sm-1">#</li>
																				<li class="col-sm-4">Tên sản phẩm</li>
																				<li class="col-sm-2">Số lượng</li>
																				<li class="col-sm-2">Số tiền</li>
																				<li class="col-sm-3">Hình ảnh</li>
																			</ul>
																		</div>
																		<ul class="">
																			<jstl:set var="count" value="${1 }" />
																			<jstl:forEach items="${order.cartItems }"
																				var="cart_item">
																				<li class="row">
																					<div class="col-sm-1">${count}</div>
																					<div class="col-sm-4">${cart_item.product.name }</div>
																					<div class="col-sm-2">${cart_item.quantity }</div>
																					<div class="col-sm-2">
																						<fmt:formatNumber maxFractionDigits="3"
																							type="number" value="${cart_item.price }" />
																						VND

																					</div>
																					<div class="col-sm-3">
																						<img src="../${cart_item.product.image }" alt=""
																							width="80">
																					</div>
																				</li>
																				<jstl:set var="count" value="${count+1 }" />
																			</jstl:forEach>

																		</ul>
																	</div>
																</div>
																<div class="total">
																	<h4>Tổng cộng:</h4>
																	<span> <fmt:formatNumber maxFractionDigits="3"
																			type="number" value="${order.total_price}" /> VND
																	</span>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">Đóng</button>
																</div>
															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div>
													<!-- /.modal -->
												</jstl:forEach>
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
	<script type="text/javascript">
$(document).ready(function(){

	$(".btn_cf_order").on('click',function(){
	let orderid=$(this).parent().find('input').val();
		$(this).css("background-color","#3c8d86");
		$(this).text("Đã xác nhận");
		$.ajax({
				url:"http://localhost:8080/admin/cf_order",
				method:'post',
				data:{
				id_order: orderid,
				},
				success:function(result){
					console.log(result);
				}
		
			})
	});
});
	</script>
</body>
</html>
