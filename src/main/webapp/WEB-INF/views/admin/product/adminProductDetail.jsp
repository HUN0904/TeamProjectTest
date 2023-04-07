<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="admin/product/product.js"></script>
<article>
<h1>상품 상세 보기</h1> 
<form name="frm" id="detail_form" method="post">
<input type="hidden" name="pageNum" value="${criteria.pageNum}">
<input type="hidden" name="rowsPerPage" value="${criteria.rowsPerPage}">
<table id="list">
  <tr>
    <th>상품분류</th>
    <td  colspan="5">
  ${category_no}
     </td>    
    </tr>    
    <tr>
        <th align="center" >상품명</th>
        <td colspan="5">${productVO.product_name}</td>
    </tr>
    
    <tr>
        <th>판매가</th>
        <td width="60">${productVO.price}</td>
    </tr>
     
    <tr>
        <th>상세설명</th>
        <td colspan="5">${productVO.content}</td>
    </tr>
    
    <tr>
     <th>상품이미지</th>
     <td colspan="5" align="center">
  <!--[7] 상품 이미지를 출력하기 -->     
     <img src="product_images/${productVO.product_image}" width="200pt">    
     </td>
    </tr>
     
</table>
<!--[8] 수정 버튼이 눌리면 상품 수정 페이지로 이동하되 현재 페이지와 상품 일련번호 값을 전달해 준다. --> 
<input class="btn"  type="button" value="수정" onClick="go_mod('${productVO.product_no}')">
<!--[9] 목록 버튼이 눌리면 상품 리스트 페이지로 이동하되 현재 페이지를 전달해 준다. --> 
<input class="btn"  type="button" value="목록" onClick="go_list()">           
</form>
</article>
<%@ include file="../../footer.jsp"%>
</body>
</html>






