<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>

<script type="text/javascript">
function delete_cart(cart_no){
	var form = document.getElementById("getView");
	result = window.confirm("장바구니에서 삭제 하시겠습니까?");
	if(result==true){		
		form.action = "cart_delete?cart_no="+${cart.cart_no};
		form.submit();
	}
}
</script>

<form id="getView" method="post" enctype="multipart/form-data">
		<div class="wrap">
		<div>
			<div class="item-image"></div>
				<div class="item-desc">
					<h1>${cart.product_name}</h1>
				</div>
		</div>
		<img  src="product_images/${cart.product_image}" style="width: 500px; height: 300px;">
				<div class="item-order">
					 <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">금액</span>
							<input type="text" readonly id="total_price" name="total_price" value="${cart.total_price}">
						</div>
					</div>
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">픽업 날짜</span>
							<fmt:formatDate pattern="yyyy/MM/dd/HH:mm" value="${cart.pickup_date }" type="date"/>
						</div>						
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">추가 문구</span>
							<input type="text" readonly id="message" name="message" value="${cart.message}">
						</div>							
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">커스텀 이미지</span>
							<img  src="custom_images/${cart.custom_image}" style="width: 500px; height: 300px;">
						</div>							
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">기타 요청사항</span>
					</div>
					<input type="text" id="content" name="content" class="form-control"  aria-label="" aria-describedby="basic-addon1" value="${cart.content }">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="quantity">주문 수량</label>
						<input type="text" readonly id="quantity" name="quantity" value="${cart.quantity}">						
					</div>						
				</div>
			</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">				
					<button type="button" onclick="order()" class="btn btn-primary btn-order">주문하기</button>&emsp;&emsp;
					<button type="button" onclick="location.href='cart_list'" class="btn btn-primary btn-order">장바구니 목록</button>&emsp;&emsp;
					<button type="button" onclick="delete_cart('${cart.cart_no}')" class="btn btn-primary btn-order">삭제하기</button>
					</div>
				</div>
		</div>
	</form>	

<%@ include file="../footer.jsp"%>
