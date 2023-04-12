<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../adminheader.jsp"%> 

<script type="text/javascript">
function deleteQna(qna_no){
	var form = document.getElementById("formm");
	result = window.confirm("이 Q&A 삭제 하시겠습니까?");
	if(result==true){		
		form.action = "qna_delete?qna_no="+${qnaVO.qna_no};
		form.submit();
	}
}
function validateForm() {
	  var rcontent = document.getElementById("rcontent").value;
	  if (rcontent.trim() === "") {
	    alert("답변 내용을 입력해주세요.");
	    return false;
	  }
	  return true;
	}
</script>
 
	<article>
	  <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
	    <h2 align="center"> Q&A답변, 수정, 삭제 </h2>
		<form id="formm" name="formm" method="post" action="qna_update" style="text-align:center;" onsubmit="return validateForm()" >
			<input type="hidden" name="qna_no"  value="${qnaVO.qna_no}">
			<div>
			   <label>제 목</label>&nbsp;&nbsp;&nbsp;
			   <input type="text" readonly id="title" name="title"  size="60" style="margin-rignt:20px;" value="${qnaVO.title}">
            </div>
            <div>  
               <label>문의 내용</label>
			   <textarea readonly rows="4" cols="60" id="content" name="content" >${qnaVO.content}</textarea><br>
			</div>
			   <hr>
			   <label>답변 내용</label>
			   <textarea  rows="6" cols="60" id="rcontent" name="rcontent" placeholder="답변작성해주세요">${qnaVO.rcontent}</textarea>
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="답변|수정완료"  class="submit" > 
			<input type="button"  value="삭제하기"  class="submit" onclick="deleteQna('${qnaVO.qna_no}')">
			<input type="reset"   value="취소"    class="cancel">
		  </div>
		  <br>
		</form>
		</div>
		</section>
	</article>
<%@ include file="../../footer.jsp" %>