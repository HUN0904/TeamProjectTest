<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="admin/product/product.js"></script>
<article>
<h1>상품리스트</h1>	
<form name="frm" id="prod_form" method="post">
<table>
  <tr>
  <td width="642" >
      상품명 
     <input type="text" name="key" id="key">
     <input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
     <input class="btn" type="button" name="btn_total" value="전체보기" onClick="go_total()">
     <input class="btn" type="button" name="btn_write" value="상품등록" onClick="location.href='insert_product'">
  </td>
  </tr>
</table>
<table class="table" id="productList" style="text-align:center">
    <tr>
        <th>번호</th>
        <th>상품명</th>
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
      <td  style="text-align: left; padding-left: 50px; padding-right: 0px;">   
<%--          <a href="#" onclick="go_detail('${pageMaker.criteria.pageNum}','${pageMaker.criteria.rowsPerPage}','${productVO.pseq}')"> --%>
  		<a href="admin_product_detail?product_no=${productVO.product_no}">    
    	 ${productVO.product_name}     
   		</a>
   	  </td>
   	  <td><fmt:formatNumber value="${productVO.price}"/>원</td>
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

<%@ include file="../../footer.jsp" %>
