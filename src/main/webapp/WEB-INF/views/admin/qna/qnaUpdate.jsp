<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../adminheader.jsp"%> 

<script type="text/javascript">
function deleteqna(qna_no){
	var form = document.getElementById("formm");
	result = window.confirm("이 공지사항을 삭제 하시겠습니까?");
	if(result==true){		
		form.action = "qna_delete?qna_no="+${qnaVO.qna_no};
		form.submit();
	}
}

</script>
 
	<article>
	    <h2 align="center"> Q&A답변, 수정, 삭제 </h2>
		<form id="formm" name="formm" method="post" action="qna_update" text-align="center">
			<input type="hidden" name="qna_no"  value="${qnaVO.qna_no}">
			<fieldset>	
				<legend>공지사항 수정</legend>		
			    <label>제 목</label>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title"  size="63" style="padding-right:29px;" value="${qnaVO.title}">
                   <br>
                   <label for="message">내 용</label>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="8" cols="65" name="content" >${qnaVO.content}</textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="수정완료"  class="submit"> 
			<input type="button"  value="삭제하기"  class="submit" onclick="deleteqna('${qnaVO.qna_no}')">
			<input type="reset"   value="취소"    class="cancel">
		  </div>
		  <br>
		</form>
	</article>
<%@ include file="../../footer.jsp" %>