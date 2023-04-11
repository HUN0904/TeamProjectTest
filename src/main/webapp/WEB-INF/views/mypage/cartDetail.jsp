<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/common.css">
<script type="text/javascript" src="mypage/mypage.js"></script>
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
	<input type="hidden" id="product_no" name="product_no" value="${cart.product_no }">
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
							<span class="input-group-text" id="basic-addon1" style="display:inline-block; height:35px; width:110px;">금액</span>
							<input type="hidden" readonly id="total_price" name="total_price" value="${cart.total_price}">
							<fmt:formatNumber value="${cart.total_price}" type="currency"/> 
						</div>
						<div class="input-group-prepend">
						<label class="input-group-text" for="quantity" style="display:inline-block; height:35px; width:110px;">주문 수량</label>
						<input type="text" readonly id="quantity" name="quantity" value="${cart.quantity}">						
					</div>
					</div>
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1" style="display:inline-block; height:35px; width:110px;">픽업 날짜</span>
							<fmt:formatDate pattern="yyyy/MM/dd/HH:mm" value="${cart.pickup_date }" type="date"/>
						</div>						
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1" style="display:inline-block; height:35px; width:110px;">추가 문구</span>
							<c:if test="${cart.message ne 'X'}">
								<input type="text" readonly id="message" name="message" value="${cart.message}">
							</c:if>						
						</div>							
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1" style="display:inline-block; height:35px; width:110px;">커스텀 이미지</span>
							<img  src="custom_images/${cart.custom_image}" style="width: 500px; height: 300px;">
						</div>							
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1" style="display:inline-block; height:35px; width:110px;">기타 요청사항</span>
					</div>
					<input type="text" id="content" name="content" class="form-control"  aria-label="" aria-describedby="basic-addon1" value="${cart.content }">
				</div>
				<div class="input-group mb-3">
						
				</div>
			</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">				

					<button type="button" onclick="location.href='cart_list'" class="btn btn-primary btn-order">목록으로</button>&emsp;&emsp;
					<button type="button" onclick="delete_cart('${cart.cart_no}')" class="btn btn-primary btn-order">삭제하기</button>
					</div>
				</div>
		</div>
	</form>	

<%@ include file="../footer.jsp"%>
