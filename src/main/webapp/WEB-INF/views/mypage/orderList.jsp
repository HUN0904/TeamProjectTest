<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu.jsp" %>
<script type="text/javascript" src="mypage/mypage.js"></script>
 <article>
      <h2> 주문 목록 </h2>
      <form name="formm" method="post" >

       <table id="cartList" class="table" border="1"   style="table-layout: fixed">
       <tr>
        <th>상품명</th> <th>수 량</th><th>가 격</th> <th>주문일</th> <th> 진행 상태 </th>    
       </tr>
       <c:forEach items="${orderList}"  var="orderVO">
       <tr>      
        <td>
            <a href="order_detail?order_dno=${orderVO.order_dno}">
              <h3> ${orderVO.product_name} </h3>              
          </a>    
        </td>
        <td> ${orderVO.quantity} </td>
          <td> 
            <fmt:formatNumber value="${orderVO.total_price}" pattern="#,###"/>원
          </td>           
        <td> <fmt:formatDate value="${orderVO.indate}" type="date"/></td>
            <c:choose>
				<c:when test= "${orderVO.odresult eq '2'}">					
        			<td> 처리 진행 중 </td>
        		</c:when>
        	<c:otherwise>
        			<td> 주문 처리 완료 </td>
        	</c:otherwise>
       
			</c:choose>
		</tr>
       </c:forEach>
       <tr>
         <th>  </th>                
       </tr> 
      </table>           
      <div class="clear"></div>
      <div id="buttons" style="float: right">
       <input type="button"    value="쇼핑 계속하기"  class="cancel"  onclick="location.href='index'">     
      </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>