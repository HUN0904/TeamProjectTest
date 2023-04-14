<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu.jsp" %>
<script type="text/javascript" src="mypage/mypage.js"></script>
  <section class="container"> 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
 <article>
      <h2> 주문 목록 </h2>
      <form name="formm" method="post" >

       <table id="cartList" class="table" style="text-align:center">
       <tr>
        <th>주문번호</th><th>상품명</th> <th>수 량</th><th>가 격</th> <th>주문일</th> <th> 진행 상태 </th>    
       </tr>
       <c:forEach items="${orderList}"  var="orderVO">
       <tr>
       <td>${orderVO.order_dno}</td>      
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
       <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
      </table>           
      <div class="clear"></div>
       <%-- 페이징 --%>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="order_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="order_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="order_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div>
      <div id="buttons" style="float: right">
       <input type="button"    value="쇼핑 계속하기"  class="cancel"  onclick="location.href='index'">     
      </div>
    </form>      
  </article>
  </div>
  </section>
<%@ include file="../footer.jsp" %>