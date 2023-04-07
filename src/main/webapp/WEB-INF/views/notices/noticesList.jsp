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
    
      <c:if test="${sessionScope.loginUser.admin == 'admin'}">
	   	  <div id="buttons" style="float:right">
	      	<input type="button"  value="공지사항 작성하기"  class="submit"    
			onclick="location.href='notices_write_form'">  <!-- 컨트롤러로 보내기 -->
	      </div>
 	  </c:if>
    </form>
    </div>
    </section>
  </article>
<%@ include file="../footer.jsp" %>












