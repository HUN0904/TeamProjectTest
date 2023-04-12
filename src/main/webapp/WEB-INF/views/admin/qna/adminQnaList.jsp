<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%> 
  <article>
    <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
    <h1 align="center"> Q&A관리 </h1>
    <form name="formm" method="post">
    <table id="qnaList" class="table" >
	    <tr>
	      <th>번호</th> 
	      <th>제목</th> 
	      <th>등록자</th> 
	      <th>등록일</th> 
	      <th>답변상태</th> 
	    </tr>
	<c:forEach items="${qnaList}"  var="qnaVO">
		<tr> 
		  <td> ${qnaVO.qna_no} </td>    
		  <td> <a href="qna_update_form?qna_no=${qnaVO.qna_no}"> ${qnaVO.title}</a> </td>     
		  <td> ${qnaVO.id}</td> 
		  <td> <fmt:formatDate value="${qnaVO.qna_regdate}" type="date"/></td>
		  <td> 
			  <c:if test="${qnaVO.reply==0 }">미답변</c:if>
	 		  <c:if test="${qnaVO.reply==1 }">답변완료</c:if>
 		  </td>
		</tr>
	</c:forEach>    
    </table>
    
    </form>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="admin_qna_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="admin_qna_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="admin_qna_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div> 
</div>
</section>
  </article>
<%@ include file="../../footer.jsp" %>












