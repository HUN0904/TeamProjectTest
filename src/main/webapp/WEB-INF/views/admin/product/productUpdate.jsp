<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="admin/product/product.js"></script>
<script type="text/javascript">
function deleteProduct(product_no){
	var form = document.getElementById("update_form");
	result = window.confirm("이 상품을 삭제 하시겠습니까?");
	if(result==true){		
		form.action = "product_delete?product_no="+product_no;
		form.submit();
	}
}
</script>
<article>
  <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
<h1>상품수정</h1>  
<form name="frm" id="update_form" method="post" enctype="multipart/form-data">
<input type="hidden" name="product_no" value="${productVO.product_no}">
<input type="hidden" name="code" >
<input type="hidden" name="origin_img" value="${productVO.product_image}"> <!-- 기존 이미지 저장  -->
<table id="list">
  <tr>
    <th>상품분류</th>
    <td colspan="5">
    <select name="category_no" id="category_no">
      <c:forEach items="${kindList}" var="category_no" varStatus="status">
        <c:choose>
          <c:when test="${productVO.category_no==status.count}">
            <option value="${status.count}" selected="selected">${category_no}</option>
          </c:when>
          <c:otherwise>
            <option value="${status.count}">${category_no}</option>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </select> 
    </td>
  </tr>
  <tr>
    <th>상품명</th>
    <td width="343" colspan="5">
      <input type="text" name="product_name" id="product_name" size="47" maxlength="100" value="${productVO.product_name}">
    </td>
  </tr>
  <tr>
    <th>판매가</th>
    <td width="70">
      <input type="text" name="price" id="price" size="11"  value="${productVO.price}">
    </td>
  </tr>
  <tr>
    <th>베스트상품</th>
    <td>
      <c:choose>
        <c:when test='${productVO.bestyn=="y"}'>
          <input type="checkbox" name="bestyn" value="y" id="bestyn" checked="checked">
        </c:when>
        <c:otherwise>
          <input type="checkbox" name="bestyn" value="n" id="bestyn" >
        </c:otherwise>
      </c:choose>
    </td>        
  </tr>
  <tr>
    <th>상세설명</th>
    <td colspan="5">
      <textarea name="content" id="content" rows="8" cols="70" >${productVO.content}</textarea>
    </td>
  </tr>
  <tr>
    <th>상품이미지</th>
    <td colspan="5">
      <img src="product_images/${productVO.product_image}" width="200pt">     
      <br>
      <input type="file" name="image" id="image">
      <input type="hidden" name="product_image" value="${productVO.product_image}">
    </td> 
  </tr>    
</table>
<input class="btn" type="button" value="수정하기" onClick="go_mod_save('${productVO.product_no}')">    
<input class="btn" type="button" value="삭제하기" onClick="deleteProduct('${productVO.product_no}')">       
<input class="btn" type="button" value="취소" onClick="go_mov()">
</form> 
</div>
</section>
</article>
<%@ include file="../../footer.jsp"%>
</body>
</html>