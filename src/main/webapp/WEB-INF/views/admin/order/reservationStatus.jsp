<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">

$(function(){
    $("#datepicker").datepicker({
        onSelect:function(dateText, inst) {
        	var date = dateText.substr(2,8);
        	$('#date').val(date);
        	console.log(date);
        }
    });
});


$.datepicker.setDefaults({
    dateFormat: 'yy/MM/dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

</script>
<article>
<h1>예약 현황</h1>	
<form name="frm" id="order_form" method="post">

<table>
	<tr>
	<td><input type="text" name="date" id="date" value="" style="width:195px; text-align: center;"></td>
	<td><input type="button" value="검색" onclick="" style="width:80px; text-align: center;"></td>
	</tr>
</table>
<table class="table" id="dateOrderList" border="1"   style="table-layout: fixed">
	
    <tr>
    	<td rowspan="5" colspan="2"><div id="datepicker"></div><td>
           주문번호
        <th>상품명</th>
        <th>주문자</th>
        <th>픽업날짜</th>
        
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
   	  <td>${order.name }</td>
      <td><fmt:formatDate value="${order.pickup_date}" pattern="yy/MM/dd/HH:mm"/></td>
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