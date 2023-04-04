<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
  <article style="margin-bottom: 20px">
    <h2> 장바구니 </h2>
    <form name="formm" id="theform" method="post">
    <c:choose>
    <c:when test= "${cartList.size() == 0}">
      <h3 style="color: red;text-align: center;"> 장바구니가 비었습니다. </h3> 
    </c:when>
    <c:otherwise>
      <table id="cartList">
        <tr>
          <th>상품명</th><th>수 량</th><th>가 격</th><th>픽업 날짜</th><th>삭 제</th>    
        </tr>
        
        <c:forEach items="${cartList}"  var="cart">
        <tr>      
          <td>
            <a href="cart_detail?cart_no=${cart.cart_no}">
            <input type="hidden" id="product_name" value="${cart.product_name}">
              <h4> ${cart.product_name} </h4>              
            </a>    
          </td>
          <td> ${cart.quantity} </td>
          <td> 
            <fmt:formatNumber value="${cart.total_price}" 
                              type="currency"/> 
          </td>      
          <td> <fmt:formatDate value="${cart.pickup_date}" type="date"/></td>      
          <td> <input type="checkbox" name="cart_no" id="cart_no" value= "${cart.cart_no }"> 
          </td>
        </tr>
        </c:forEach>
         
        <tr>        
          <th colspan="2"> 총 액 </th>
          <th colspan="2"> 
            <fmt:formatNumber value="${cart.totalPrice}" type="currency"/><br>
          </th> 
          <th><a href="#" onclick="cart_delete()"><h3>삭제하기</h3></a></th>                       
        </tr> 
      </table> 
    </c:otherwise>  
    </c:choose>  
     
    <div class="clear"></div>
     
    <div id="buttons" style="float: right">
      <input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='index'">    
      <c:if test= "${cartList.size() != 0}">
      <input type="button" value="주문하기"  class="submit" onclick="go_order_insert()">
      </c:if>
     </div>
    </form>
  </article>

<%@ include file="../footer.jsp" %>












