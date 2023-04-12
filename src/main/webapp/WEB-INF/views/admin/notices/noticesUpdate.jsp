<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../adminheader.jsp"%> 

<script type="text/javascript">
function deleteNotices(notices_no){
	var form = document.getElementById("formm");
	result = window.confirm("이 공지사항을 삭제 하시겠습니까?");
	if(result==true){		
		form.action = "notices_delete?notices_no="+${noticesVO.notices_no};
		form.submit();
	}
}

</script>
 
	<article>
	    <h2 align="center"> 공지사항 </h2>
		<form id="formm" name="formm" method="post" action="notices_update" text-align="center">
			<input type="hidden" name="notices_no"  value="${noticesVO.notices_no}">
			<fieldset>	
				<legend>공지사항 수정</legend>		
			    <label>제 목</label>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title"  size="63" style="padding-right:29px;" value="${noticesVO.title}">
                   <br>
                   <label for="message">내 용</label>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="8" cols="65" name="content" >${noticesVO.content}</textarea><br>
			</fieldset>   
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="수정완료"  class="submit"> 
			<input type="button"  value="삭제하기"  class="submit" onclick="deleteNotices('${noticesVO.notices_no}')">
			<input type="reset"   value="다시작성"    class="cancel">
		  </div>
		  <br>
		</form>
	</article>
<%@ include file="../../footer.jsp" %>