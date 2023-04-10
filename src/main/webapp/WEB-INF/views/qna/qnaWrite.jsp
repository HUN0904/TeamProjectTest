<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/common.css"> 
<script type="text/javascript" src="qna/qna.js"></script>
 <article>
	<form id="qna_write" method="post" action="qna_write">
		<input type="hidden" id="product_no" name="product_no" value="${product_no }" />        
	<h2>Q&A 작성하기</h2>
		<input type="text" id="title" name="title" size="55" placeholder="문의 하실 제목을 입력하세요"><br><br>
		<textarea  rows="12" cols="100" id="content" name="content" placeholder="문의 하실 내용을 입력하세요"></textarea>
	    <div >
	    <input type="radio" name="secret_yn" value="n"> 비공개 &nbsp; &nbsp; &nbsp;
	    <input type="radio" name="secret_yn" value="y" checked> 공개
	    </div>		
	    <div class="clear"></div>
		 <div id="buttons" >
		<input type="reset"   value="취소"  class="cancel">
		<input type="button"  value=" 등록"  class="submit" onclick="qna_save('${product_no}')"> 
		</div>
	</form>
 </article>
<h3>상품 Q&A 작성 유의사항</h3><hr>
상품 Q&A는 상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 판매자에게 문의하는 게시판입니다.<br>
상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.<br>
전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.<br>
상품에 대한 이용 후기는 리뷰에 남겨 주세요.<br>
<%@ include file="../footer.jsp" %>