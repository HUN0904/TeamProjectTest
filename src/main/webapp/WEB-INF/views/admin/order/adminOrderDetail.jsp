<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>



<form id="getOrderView" method="post" enctype="multipart/form-data">
	<input type="hidden" id="product_no" name="product_no" value="${cart.product_no }">
		<div class="wrap">
		<div>
			<div class="item-image"></div>
				<div class="item-desc">
					<h1>${order.product_name}</h1>
				</div>
		</div>
		<img  src="product_images/${order.product_image}" style="width: 500px; height: 300px;">
				<div class="item-order">
					 <div class="input-group mt-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;금&nbsp;&nbsp;&nbsp;액&nbsp;&nbsp;&nbsp; </span>

							&nbsp;<input type="hidden" readonly id="total_price" name="total_price" value="${order.total_price}">
							<fmt:formatNumber value="${order.total_price}" type="currency"/> 
						</div>
					</div>
					<div class="input-group-prepend">
						<label class="input-group-text" for="quantity">&nbsp;&nbsp;주문&nbsp;수량&nbsp;&nbsp;</label>&nbsp;&nbsp;
						<input type="text" readonly id="quantity" name="quantity" size="2"  value="${order.quantity}">						
					</div>
						<div class="input-group-prepend">
							<span class="input-group-text " id="basic-addon1" >&nbsp;&nbsp;픽업&nbsp;날짜&nbsp;&nbsp;</span>&nbsp;
							<fmt:formatDate pattern="yyyy/MM/dd/HH:mm" value="${order.pickup_date }" type="date"/>
						</div>						
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;추가&nbsp;문구&nbsp;&nbsp;</span>
							<c:if test="${order.message ne 'X'}">
								<input type="text" readonly id="message" name="message" value="${order.message}">
							</c:if>						
						</div>							
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">커스텀 이미지</span>
							<img  src="custom_images/${order.custom_image}" style="width: 500px; height: 300px;">
						</div>							
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">기타 요청사항</span>
					</div>
					<input type="text" id="content" name="content" class="form-control"  aria-label="" aria-describedby="basic-addon1" value="${order.content }">
				</div>
			
			</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">				

					<button type="button" onclick="location.href='admin_order_list'" class="btn btn-primary btn-order">목록으로</button>&emsp;&emsp;
					</div>
				</div>
		</div>
	</form>	

<%@ include file="../../footer.jsp"%>