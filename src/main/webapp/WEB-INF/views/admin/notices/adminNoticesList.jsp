<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%> 
  <article>
    <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
    <h1 > 공지사항 </h1>
    <form name="formm" method="post">
    <table id="noticesList" class="table" >
	    <tr>
	      <th>번호</th> 
	      <th style="width:400px;">제목</th> 
	      <th>등록일</th> 
	      <th>조회수</th>    
	    </tr>
	<c:forEach items="${noticesList}"  var="noticesVO">
		<tr>  
		  <td> ${noticesVO.notices_no} </td>    
		  <td> <a href="admin_notices_view?notices_no=${noticesVO.notices_no}"> ${noticesVO.title}</a> </td>     
		  <td> <fmt:formatDate value="${noticesVO.notices_date}" type="date"/></td>
		  <td>${noticesVO.hits}</td>    
		</tr>
	</c:forEach>    
    </table>
    
      <c:if test="${sessionScope.loginUser.admin == 'admin'}">
	   	  <div id="buttons" style="float:right">
	      	<input type="button"  value="공지사항 작성하기"  class="submit" onclick="location.href='notices_write_form'">
	      </div>
 	  </c:if>
    </form>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="admin_notices_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="admin_notices_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="admin_notices_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div> 
</div>
</section>
  </article>
<%@ include file="../../footer.jsp" %>












