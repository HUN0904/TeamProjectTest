<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<h1 align="center">상품 상세 보기</h1>
<script type="text/javascript" src="admin/product/product.js"></script>

<article>
<form name="frm" id="detail_form" method="post">



<table id="list" class="table" style="text-align:center">
  <tr>
    <th style="text-align:right">상품분류</th>
     <th style="text-align:center">상품명</th>
     <th style="text-align:left">판매가</th>
     <th style="text-align:left">상세설명</th>
     <th style="text-align:left">상품이미지</th>
  </tr> 

     <tr>
          <td colspan="2" align="left" style="padding-left:200px;">			    
     		<img src="product_images/${productVO.product_image}" width="300px" height="auto">    
          </td>
          
          <td>
              
          </td>
     </tr>
     
  
 </table> 


<div class="input-group mb-3" align="right">
	<div class="input-group-prepend">		
		<button type="button" onclick="go_mod('${productVO.product_no}')" class="btn btn-primary btn-order">수정하기</button>&emsp;&emsp;		
		<button type="button" onclick="go_list()" class="btn btn-primary btn-order">목록으로</button>
	</div>
</div>     
</table>
 
</form>
</article>


</body>
</html>






