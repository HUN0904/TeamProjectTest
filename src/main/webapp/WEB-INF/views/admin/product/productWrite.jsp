<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="admin/product/product.js"></script>
<article>
  <section class="container" > 
  <div class="card p-4 m-5" style="text-align:left; background-color:#fdefec">
<h1>상품등록</h1>  
<form name="frm" id="write_form" method="post" enctype="multipart/form-data">
<table id="list">
<tr>
  <th>상품분류</th>
  <td colspan="5">
  <select name="category_no" id="category_no">
    <c:forEach items="${kindList}" var="category_no" varStatus="status">
      <option value="${status.count}">${category_no}</option>
   </c:forEach>
  </select>      
<tr>
  <th>상품명</th>
  <td width="343" colspan="5">
       <input type="text" name="product_name" id="product_name" size="47" maxlength="100" placeholder="상품명">
  </td>
</tr>
<tr>

  <th>판매가</th>
  <td width="70">
     <input type="text" name="price" id="price" size="11" placeholder="20000">
  </td>
  </tr>
    
  <tr>
    <th>상세설명</th>
    <td colspan="5">
      <textarea name="content" id="content" rows="8" cols="70" ></textarea>
    </td>
  </tr>
  <tr>
    <th>상품이미지</th>
    <td width="343" colspan="5">
<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
      <input type="file" name="image" id="image">
    </td>
  </tr>    
</table>
<input class="btn" type="button" value="등록" onClick="product_save()">           
<input class="btn" type="button" value="취소" onClick="go_mov()">
</form> 
</div>
</section>
</article>
<%@ include file="../../footer.jsp"%>