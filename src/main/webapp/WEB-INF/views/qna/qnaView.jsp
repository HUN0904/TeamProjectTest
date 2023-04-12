<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
  <article>
    <section class="container"> 
  <div class="card p-4 m-5" style="background-color:#fdefec">
    <h2 style="background-color:#fdefec"> Q&A  상세 내용 </h2><hr>
	<h3>문의한 제목  :  ${qnaVO.title}</h3>
	      		&nbsp;${qnaVO.id}&nbsp;
		        <fmt:formatDate value="${qnaVO.qna_regdate}" type="date"/><hr>
		        
    <form name="formm" method="post">
     &nbsp;내용  :   ${qnaVO.content}<br><br><hr>
     &nbsp;답변 내용  :
 	<c:if test="${qnaVO.reply==0 }">아직 답변 내용이 없습니다.</c:if><br>
 	<c:if test="${qnaVO.reply==1 }">${qnaVO.rcontent}</c:if><br>
    <div class="clear"></div>
     <div id="buttons" style="float:right">
      <input type="button"  value="목록보기"   class="submit"  onclick="location.href='qna_list'">  
      </div>
    </form>
    </div>
    </section>
  </article>
<%@ include file="../footer.jsp" %>
