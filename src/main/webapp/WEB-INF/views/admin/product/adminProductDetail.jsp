<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="admin/product/product.js"></script>
  <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
<article>
<h1 align="center">상품 상세 보기</h1> 
<hr>
<form name="frm" id="detail_form" method="post">

<table align="right" style="">
    <tr>
     <td colspan="5" align="center">
  <!--[7] 상품 이미지를 출력하기 -->     
     <img src="product_images/${productVO.product_image}" width="300pt">    
     </td>
    </tr>
    
    <tr>
      <th>상품이미지</th>
    </tr>
     
</table>

<table id="list" align="center" style="font-size:30px;">
  <tr>
    <th>상품분류</th>
     <td  colspan="5">
        &nbsp;${kindList}
     </td>    
    </tr>
     
    <tr>
        <th align="center">상품명</th>
        <td colspan="5">${productVO.product_name}</td>
    </tr>
    
    <tr>
        <th>판매가</th>
        <td colspan="5"">${productVO.price}</td>
    </tr>
     
    <tr>
        <th>상세설명</th>
        <td colspan="8">${productVO.content}</td>
    </tr>
    
</table>
<div class="input-group mb-3" >
	<div class="input-group-prepend" style="padding-left:350px;">		
		<button type="button" onclick="go_mod('${productVO.product_no}')" class="btn btn-primary btn-order">수정하기</button>&emsp;&emsp;		
		<button type="button" onclick="go_list()" class="btn btn-primary btn-order">목록으로</button>
	</div>
</div>   

<hr>     
</form>
</article>
</div>
</section>
<%@ include file="../../footer.jsp"%>
</body>
</html>






