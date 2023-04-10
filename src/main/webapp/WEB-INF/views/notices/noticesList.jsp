<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<!-- Required meta tags -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/common.css"> 
  <article>
  <section class="container"> 
  <div class="card p-4 m-5">
    <h2> 공지사항 </h2>
    <form name="formm" method="post">
    <table>
    <tr>
      <td width="642">
      제목
     <input type="text" name="key" id="key">
     <input class="btn" type="button" name="btn_search" value="검색" onClick="go_search()">
     <input class="btn" type="button" name="btn_total" value="전체보기" onClick="go_total()">
  </td>
  </tr>
    
    </table>
    <table id="noticesList" class="table"  style="table-layout: fixed">
	    <tr>
	      <th>번호</th> 
	      <th>제목</th> 
	      <th>등록자</th> 
	      <th>등록일</th> 
	      <th>조회수</th>    
	    </tr>
	<c:forEach items="${noticesList}"  var="noticesVO">
		<tr>  
		  <td> ${noticesVO.notices_no} </td>    
		  <td> <a href="notices_view?notices_no=${noticesVO.notices_no}"> ${noticesVO.title}</a> </td>     
		  <td> ${noticesVO.id}</td> 
		  <td> <fmt:formatDate value="${noticesVO.notices_date}" type="date"/></td>
		  <td>${noticesVO.hits}</td>    
		</tr>
	</c:forEach>    
    </table>
     <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
    </form>
    </div>
    </section>
    <div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="notices_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="notices_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="notices_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div>
  </article>
<%@ include file="../footer.jsp" %>












