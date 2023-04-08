<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>	 
	<article>
	    <h2> 1:1 고객 게시판 </h2>
	    <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>    
		<form name="formm" method="post" action="qna_save">
			<fieldset>	
				<legend>문의하기</legend>		
			    <label>제목</label>
			    <input type="text" name="title" id="title" size="63" ><br>
				<label>내용</label>
			    <textarea rows="8" cols="65" name="content" id="content"></textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel" onclick="location.href='index'">
			<input type="button"  value="쇼핑 계속하기"  class="submit"  onclick="location.href='index'">	
		  </div>
		</form>
	</article>
<%@ include file="../footer.jsp" %>