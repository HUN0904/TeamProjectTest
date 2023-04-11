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
    <table id="qnaList" class="table" style="text-align:center">
	    <tr>
    	  <th>답변상태</th> 
	      <th>제목</th> 
	      <th>작성자</th> 
	      <th>등록일</th> 
	    </tr>
	<c:forEach items="${qnaList}"  var="qnaVO">
		<tr>
		  <td> 
		  	<c:if test="${qnaVO.reply==0 }">미답변</c:if>
		  	<c:if test="${qnaVO.reply==1 }">답변완료</c:if>
		  </td>  
		  <td> <a href="qna_view?qna_no=${qnaVO.qna_no}"> ${qnaVO.title}</a> </td>     
		  <td> ${qnaVO.id}</td> 
		  <td> <fmt:formatDate value="${qnaVO.qna_regdate}" type="date"/></td>
		</tr>
	</c:forEach>    
    </table>
   	  <div id="buttons" style="float:right">
      	<input type="button"  value=" 작성하기"  class="submit"    
		onclick="location.href='qna_write_form'"> 
      </div>
    </form>
    </div>
    </section>
  </article>
<%@ include file="../footer.jsp" %>












