<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %> 
<article>
    <div id="itemdetail" >


 <form  method="post" action="cart_insert" name="formm" id="theform">
 	<input type="hidden" id="favorite_no" name="favorite_no"  value="${favorite.favorite_no} "> 
   <fieldset>
       <span style="float: left;">

         <img src="product_images/${productVO.product_image}" style="float:right; width:600px; height:auto;" />

       </span>              
       <h2> ${productVO.product_name} </h2>  
     <label> 가 격 :  </label>  
     <p> <fmt:formatNumber type="currency" value="${productVO.price}"/></p>  
     <label> 수 량 : 
		<select class="custom-select" id="quantity" name="quantity">
			<option name="quantity" value="0" selected>수량을 선택해주세요</option>
			<option name="quantity" value="1">1</option>
			<option name="quantity" value="2">2</option>
			<option name="quantity" value="3">3</option>
		</select>
	</label>
     <input  type="text"   name="quantity" id="quantity" size="2"  value="1"><br>
     <input  type="hidden" name="product_no" value="${productVO.product_no}"><br>
   <div id="buttons">
   

	
<%-- End of 좋아요  --%>
          <input type="button" value="주문서 작성하기"   class="submit"    onclick="location.href='cart_write_form?product_no='+${productVO.product_no}">
          <input type="button" value="즉시 구매"       class="submit"    onclick="go_order()"> 
          </div>
        </fieldset>
        <br>
      </form>  
    </div>
<div class="container">
  <nav class="navbar navbar-expand-sm bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">상품정보</a>
    </div>
    <div class="container-fluid">
      <a class="navbar-brand" href="#">리뷰(${cnt })</a>
    </div>
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Q&A</a>
    </div>
  </nav>
</div>
  <!-- 상품평 처리 -->
<%@ include file="review.jsp" %>
  <!-- QNA 처리 -->
<%@ include file="../qna/qna.jsp" %>
  </article>
<%@ include file="../footer.jsp" %>  


  