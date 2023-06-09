<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" >
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
function search_date(){
	var form = document.getElementById("dateSearch");
	form.action = "reservation_status";
	form.submit();
}
</script>
<article>
  <section class="container"> 
   <div class="card p-4 m-5" style="background-color:#fdefec">
<h1>예약 현황</h1>	
<form name="dateSearch" id="dateSearch" method="post">
<div align="center" style="font-size:40px;">${pickDate}</div>
<table>
	<tr>
		<td><input readonly type="text" name="date" id="date" value="" style="width:195px; text-align: center;"></td>
		<td><input type="button" value="검색" onclick="search_date()" style="width:80px; text-align: center;"></td>
	</tr>
</table>
</form>

<form name="frm" id="order_form" method="post">

<table class="table" id="dateOrderList" style="text-align:center;">
	
    <tr>
    	<th rowspan="11" ><div id="datepicker" style="position: relative; left: -10px;"></div></th>
        <th>주문번호</th>
        <th>상품명</th>
        <th>주문자</th>
        <th>픽업날짜</th>
        
    </tr>
    <c:choose>
    <c:when test="${orderListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        예약이 내역이 없습니다.
      </td>      
    </tr>

    </c:when>
	<c:otherwise>
	<c:forEach items="${orderList}" var="order" varStatus="status">
    <tr>
       <td>${order.order_dno}</td>
      <td>   
  		<a href="admin_order_detail?order_dno=${order.order_dno}">    
    	 ${order.product_name}
   		</a>
   	  </td>
   	  <td>${order.name }</td>
      <td><fmt:formatDate value="${order.pickup_date}" pattern="yy/MM/dd/HH:mm"/></td>
    </tr>
    </c:forEach>
	</c:otherwise>	
</c:choose>  
<tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
</table>
       <%-- 페이징 --%>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="reservation_status${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="reservation_status${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="reservation_status${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div>
</form>
  
 </div>
 </section>
</article>
<%@ include file="../../footer.jsp" %>