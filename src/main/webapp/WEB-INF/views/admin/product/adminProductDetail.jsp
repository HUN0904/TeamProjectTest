<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="admin/product/product.js"></script>
<article>
<h1>상품 상세 보기</h1> 
<form name="frm" id="detail_form" method="post">
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


<div class="input-group mb-3">
	<div class="input-group-prepend">		
		<button type="button" onclick="go_mod('${productVO.product_no}')" class="btn btn-primary btn-order">수정하기</button>&emsp;&emsp;		
		<button type="button" onclick="go_list()" class="btn btn-primary btn-order">목록으로</button>
	</div>
</div>        
</form>
</article>


</body>
</html>






