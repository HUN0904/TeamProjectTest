<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
  <article>
      <nav class="navbar navbar-expand-lg bg-light" data-ui-position="fixed" data-ui="tab-control" data-page="product">
            <a href="#prd-info" data-id="prd-info" class="active">상품정보</a>
            <a href="#prd-enquiries" data-id="prd-enquiries" class="">배송 / 교환 / 환불</a>
            <a href="#prd-review" data-id="prd-review" class="">구매후기</a>
            <a href="#prd-reviews" data-id="prd-reviews" class="">댓글</a>
    </nav>
    <div id="itemdetail" >
      <form  method="post" action="cart_insert" name="formm" id="theform">    
        <fieldset>
          <a href="product_detail?product_no=${productVO.product_no}">         
            <span style="float: left;">
              <img src="product_images/${productVO.product_image}" />
            </span>              
            <h2> ${productVO.product_name} </h2>  
          </a>    
          <label> 가 격 :  </label>  
          <p> <fmt:formatNumber type="currency" value="${productVO.price}"/></p>  
          <label> 수 량 : </label>
          <input  type="text"   name="quantity" id="quantity" size="2"      value="1"><br>
          <input  type="hidden" name="product_no" value="${productVO.product_no}"><br>
          <i class="bi bi-heart"></i>찜 빈하트 눌린경우 빨강 
          <i class="bi bi-heart-fill" ></i>
          <input type="button" id="bi bi-heart" value="♡" class="bi bi-heart"    onclick="go_order()"> 
           							<!-- 좋아요 버튼 -->
		<c:choose>
			<c:when test="${sessionScope.member != null }">
				<button id="btn_like" class="bi bi-heart" title="좋아요" type="button">
				<i class="bi bi-heart">
				</button>
			</c:when>
			<c:when test="${sessionScope.member == null }">
				<button onclick="alert('로그인 후 이용해주세요');" class="bi bi-heart" title="좋아요" type="button">
				</button>
			</c:when>
		</c:choose>
          <input type="button" value="주문서 작성하기"   class="submit"    onclick="location.href='cart_write_form?product_no='+${productVO.product_no}">
          <input type="button" value="즉시 구매"       class="submit"    onclick="go_order()"> 
        </fieldset>
        <br>
        상품내용
        ${productVO.content}
      </form>  
        
    </div>

  <!-- 상품평 처리 -->
<%@ include file="review.jsp" %>
  </article>
<%@ include file="../footer.jsp" %>  





  