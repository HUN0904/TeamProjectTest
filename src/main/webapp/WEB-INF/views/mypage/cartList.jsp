<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<%@ include file="sub_menu.jsp" %> 
<script type="text/javascript" src="mypage/mypage.js"></script>
  <section class="container"> 
  <div class="card p-4 m-5" style="background-color:#fdefec">
  <article style="margin-bottom: 20px">
    <h2> ${sessionScope.loginUser.nickname} 님의 장바구니 </h2>
    <form name="formm" id="theform" method="post">
    <c:choose>
    <c:when test= "${cartList.size() == 0}">
      <h3 style="color: red;text-align: center;"> 장바구니가 비었습니다. </h3> 
    </c:when>
    <c:otherwise>
      <table id="cartList" class="table" style="text-align:center">
        <tr>
          <th>상품명</th>
          <th>수 량</th>
          <th>가 격</th>
          <th>픽업 날짜</th>
          <th>삭 제</th>    
        </tr>        
		<c:set var = "cart_total_price" value = "0" />
        <c:forEach items="${cartList}"  var="cart">
        <tr>      
          <td><a href="cart_detail?cart_no=${cart.cart_no}">${cart.product_name}</a></td>
          <td>${cart.quantity}</td>
          <td> 
            <fmt:formatNumber value="${cart.total_price}" pattern="#,###"/>원
            <c:set var= "cart_total_price" value="${cart_total_price + cart.total_price}"/>
          </td>      
          
          <td> <fmt:formatDate value="${cart.pickup_date}" pattern="MM/dd HH:mm"/></td>    
          <td> <input type="checkbox" name="cart_no" id="cart_no" value= "${cart.cart_no }"> 
          </td>
        </tr>
        </c:forEach>
         
        <tr>        
          <th colspan="2"> 총 액 </th>
          <td><fmt:formatNumber value="${cart_total_price}" pattern="#,###"/>원</td>
          <th colspan="2"> 
            <fmt:formatNumber value="${cart.totalPrice}" type="currency"/>
          </th> 
        </tr> 
      </table> 
    </c:otherwise>  
    </c:choose>  
     
      <input type="hidden" id="product_name" value="${cart.product_name}">
      <input type="hidden" id="product_no" value="${cart.product_no}">
    <div id="buttons" style="float: right">
  	  <input type="button" value="삭제하기" onclick="cart_delete()">                    
      <input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='index'">    
      <c:if test= "${cartList.size() != 0}">
      <input type="button" value="전체 주문하기"  class="submit" onclick="order()">
      </c:if>
     </div>
    </form>
  </article>
</div>
</section>
<%@ include file="../footer.jsp" %>












