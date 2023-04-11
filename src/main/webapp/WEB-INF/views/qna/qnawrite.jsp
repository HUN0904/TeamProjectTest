<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!-- Required meta tags -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/common.css"> 
  <article>
  <section class="container"> 
  <div class="card p-4 m-5">
    <h2> Q&A </h2>
    <form name="formm" method="post"> 
	<h2>Q&A 작성하기</h2>
		<input type="text" id="title" name="title" size="55" placeholder="문의 하실 제목을 입력하세요"><br><br>
		<textarea  rows="12" cols="100" id="qna_content" name="qna_content" placeholder="문의 하실 내용을 입력하세요"></textarea>
	    <div >
	    <input type="radio" name="secret_yn" value="n"> 비공개 &nbsp; &nbsp; &nbsp;
	    <input type="radio" name="secret_yn" value="y" checked> 공개
	    </div>		
	    <div class="clear"></div>
		 <div id="buttons" >
		 <button type="button"  class="btn btn-secondary" onclick="qna_save('${productVO.product_no }')">등록</button>
		<input type="hidden" id="product_no" name="product_no" value="${productVO.product_no }" />        
		</div>
	</form>
    </div>
    </section>
  </article>
<%@ include file="../footer.jsp" %>












