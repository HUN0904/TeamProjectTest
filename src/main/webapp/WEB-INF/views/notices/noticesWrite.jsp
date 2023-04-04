<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>	  

<!-- 어드민이동예정 -->
어드민이동예정
<!-- 어드민이동예정 -->
	<article>
	    <h2> 공지사항 </h2>
		<form name="formm" method="post" action="notices_write">
			<fieldset>	
				<legend>공지사항 작성</legend>		
			    <label>Title</label>
			    <input type="text" name="title"  size="63" ><br>
				<label>Content</label>
			    <textarea rows="8" cols="65" name="content"></textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="글쓰기"     class="submit"> 
			<input type="reset"   value="취소"     class="cancel">
		  </div>
		</form>
	</article>
<%@ include file="../footer.jsp" %>