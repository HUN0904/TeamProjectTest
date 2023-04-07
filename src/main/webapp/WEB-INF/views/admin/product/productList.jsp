<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
  <section class="container"> 
  <div class="card p-4 m-5">
<article>
<h1>상품리스트</h1>	
<form name="frm" id="prod_form" method="post">
<table>
  <tr>
  <td width="642">
      상품명 
     <input type="text" name="key" id="key">
     <input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
     <input class="btn" type="button" name="btn_total" value="전체보기" onClick="go_total()">
     <input class="btn" type="button" name="btn_write" value="상품등록" onClick="go_wrt()">
     <input class="btn" type="button" name="btn_chart" value="상품별 실적" onClick="location.href='admin_sales_record_form'">
  </td>
  </tr>
</table>
<table class="table" id="productList" style="table-layout: fixed">
    <tr>
        <th>번호</th>
        <th>상품명</th>
        <th>원가</th>
        <th>판매가</th>
        <th>등록일</th>
        <th>관리자페이지에서 더볼것들 여기서부터 추가</th>
    </tr>
    <c:choose>
    <c:when test="${productListSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        등록된 상품이 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>
	<c:forEach items="${productList}" var="productVO" varStatus="status">
    <tr>
      <%-- <td height="23" align="center" >${productVO.pseq}</td> --%>
      <td height="23" align="center">${status.count}</td>
      <td style="text-align: left; padding-left: 50px; padding-right: 0px;">   
<%--          <a href="#" onclick="go_detail('${pageMaker.criteria.pageNum}','${pageMaker.criteria.rowsPerPage}','${productVO.pseq}')"> --%>
  		<a href="#" onclick="go_detail('${productVO.product_no}')">    
    	 ${productVO.product_name}     
   		</a>
   	  </td>
   	  <td><fmt:formatNumber value="${productVO.price}"/>여기도변경</td>
      <td><fmt:formatNumber value="${productVO.price}"/></td>
      <td><fmt:formatDate value="${productVO.product_regdate}"/></td>
      <td>
		여기다 볼것들 더추가 	
   	  </td> 
    </tr>
    </c:forEach>
    <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
	</c:otherwise>	
</c:choose>  
</table>
</form> 

<%@ include file="../page_area.jsp" %>
</article>
</div>
</section>
<%@ include file="../../footer.jsp" %>
