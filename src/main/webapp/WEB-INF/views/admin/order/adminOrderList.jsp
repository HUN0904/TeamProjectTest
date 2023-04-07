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

</script>
<article>
<h1>주문 리스트</h1>	
<form name="frm" id="order_form" method="post">
<table>
  <tr>
  <td width="642">
      상품명 
     <input type="text" name="key" id="key">
  </td>
  </tr>
</table>
<table class="table" id="adminOrderList" border="1"   style="table-layout: fixed">
    <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>결제금액</th>
        <th>주문자</th>
        <th>주문일자</th>
        <th>주문상태</th>        
        <th><input type="button" value="주문 완료하기" onclick="order_result()"></th>
    </tr>
    <c:choose>
    <c:when test="${orderListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        등록된 상품이 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>
	<c:forEach items="${orderList}" var="order" varStatus="status">
    <tr>
      <%-- <td height="23" align="center" >${productVO.pseq}</td> --%>
      <td height="23" align="center">${order.order_dno}</td>
      <td style="text-align: left; padding-left: 50px; padding-right: 0px;">   
<%-- <a href="#" onclick="go_detail('${pageMaker.criteria.pageNum}','${pageMaker.criteria.rowsPerPage}','${productVO.pseq}')"> --%>
  		<a href="admin_order_detail?order_dno=${order.order_dno}">    
    	 ${order.product_name}
   		</a>
   	  </td>
   	  <td><fmt:formatNumber value="${order.total_price}" pattern="#,###"/>원</td>
   	  <td>${order.name }</td>
      <td><fmt:formatDate value="${order.indate}"/></td>
      <c:choose>
		<c:when test= "${order.odresult eq '2'}">					
        	<td> 처리 진행 중 </td>
        	<td><input type="checkbox" name="order_dno" id="orderd_no" value= "${order.order_dno}"></td>
        </c:when>
      	<c:otherwise>
        	<td colspan="2"> 주문 처리 완료 </td>
      	</c:otherwise>
      </c:choose>
    </tr>
    </c:forEach>
    <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
	</c:otherwise>	
</c:choose>  
</table>
</form>
<%@ include file="../page_area.jsp" %>
</article>
<%@ include file="../../footer.jsp" %>