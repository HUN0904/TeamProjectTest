<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%> 
  <article>
    <h1 align="center"> Q&A관리 </h1>
    <form name="formm" method="post">
    <table id="qnaList" class="table" style="text-align:center">
	    <tr>
	      <th>번호</th> 
	      <th>제목</th> 
	      <th>등록자</th> 
	      <th>등록일</th> 
	      <th>조회수</th>    
	    </tr>
	<c:forEach items="${qnaList}"  var="qnaVO">
		<tr>  
		  <td> ${qnaVO.qna_no} </td>    
		  <td> <a href="admin/qna_update_form?qna_no=${qnaVO.qna_no}"> ${qnaVO.title}</a> </td>     
		  <td> ${qnaVO.id}</td> 
		  <td> <fmt:formatDate value="${qnaVO.qna_regdate}" type="date"/></td>
		</tr>
	</c:forEach>    
    </table>
    
      <c:if test="${sessionScope.loginUser.admin == 'admin'}">
	   	  <div id="buttons" style="float:right">
	      	<input type="button"  value="Q&A 작성하기"  class="submit" onclick="location.href='qna_update_form'">
	      </div>
 	  </c:if>
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
  </article>
<%@ include file="../../footer.jsp" %>












