<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript">
	function order_result() {
		const query = 'input[name="order_dno"]:checked';
		
		var len = document.querySelectorAll(query).length;
		console.log(len);
		
		if (len == 0) {
			alert("주문완료 처리할 항목을 선택해 주세요.")
		} else {
			result = window.confirm("주문 완료 처리하시겠습니까?");
			if(result==true){		
				var form = document.getElementById("order_form");
				form.action = "order_result_update";
				form.submit();
			}
		}
	}
	function checkAll() {
	    var checkboxes = document.getElementsByName('order_dno'); // 
	    var allCheckbox = document.getElementById('all');

	    for (var i = 0; i < checkboxes.length; i++) {
	        checkboxes[i].checked = allCheckbox.checked; // "전체
	    }
	}
</script>
<article>
  <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
<h1 align="center">주문 리스트</h1>	
<form name="frm" id="order_form" method="post">
<table>
  <tr>
  <td width="642" align="left">
      주문자 
     <input type="text" name="key" id="key">
     <input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
  </td>
  </tr>
</table>
<table class="table" id="adminOrderList" style="text-align:center">
    <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>결제금액</th>
        <th align="center">주문자</th>
        <th>주문일자</th>
        <th>주문상태</th>        
        <td><input type="button" value="주문 완료하기" onclick="order_result()"></td>
        <th><input type="checkbox" name="all" id="all" onclick="checkAll()">&nbsp;전체 선택</th>
    </tr>
    <c:choose>
    <c:when test="${orderListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        들어온 주문이 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>
	<c:forEach items="${orderList}" var="order" varStatus="status">
    <tr>
      <td height="23" align="center">${order.order_dno}</td>
      <td>   
  		<a href="admin_order_detail?order_dno=${order.order_dno}">${order.product_name}</a>
   	  </td>
   	  <td><fmt:formatNumber value="${order.total_price}" pattern="#,###"/>원</td>
   	  <td>${order.name }</td>
      <td><fmt:formatDate value="${order.indate}"/></td>
      <c:choose>
		<c:when test= "${order.odresult eq '2'}">					
        	<td> 처리 진행 중 </td><td></td>
        	<td><input type="checkbox" name="order_dno" id="order_dno" value= "${order.order_dno}"></td>
        </c:when>
      	<c:otherwise>
        	<td> 주문 처리 완료 </td>
      	</c:otherwise>
      </c:choose>
      <td></td>
    </tr>
    </c:forEach>
    <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
	</c:otherwise>	
</c:choose>  
</table>
</form>

<%-- 페이징 --%>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="admin_order_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="admin_order_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="admin_order_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div>
</div>
</section>
</article>
<%@ include file="../../footer.jsp" %>








