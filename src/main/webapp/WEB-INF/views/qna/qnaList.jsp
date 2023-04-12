<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!-- Required meta tags -->
<style>

.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 50px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}


.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 17px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.container {
  width: 1100px;
  margin: 0 auto;
}

</style>

  <section class="container"> 
  <div class="page-title">
        <div class="container">
            <h3>Q&A</h3>
        </div>
    </div>
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
		<td>
		<c:choose>
			<c:when test="${qnaVO.secret_yn == 'y'}">
				<a href="qna_view?qna_no=${qnaVO.qna_no}">${qnaVO.title}</a>
			</c:when>
			<c:when test="${qnaVO.secret_yn == 'n' && qnaVO.id != sessionScope.loginUser.id}">
				비밀글 입니다. <i class="bi bi-lock"></i> 
			</c:when>
			<c:otherwise>
				<a href="qna_view?qna_no=${qnaVO.qna_no}">${qnaVO.title}</a>
			</c:otherwise>
		</c:choose>
		</td>    
		<td>${qnaVO.id}</td> 
		<td><fmt:formatDate value="${qnaVO.qna_regdate}" type="date"/></td>
	</tr>
</c:forEach>
    </table>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="qna_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="qna_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="qna_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
 
</div>    
    </form>
    </section>
<%@ include file="../footer.jsp" %>












