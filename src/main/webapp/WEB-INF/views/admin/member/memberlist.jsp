<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
  <section class="container" > 
  <div class="card p-4 m-5"style="background-color:#fdefec">
  <script type="text/javascript">
function member_search() {
	var form = document.getElementById("member_form");
	
	form.action = "admin_member_list";
	form.submit();	
}


function member_total() {
	var form = document.getElementById("member_form");
	document.getElementById("key").value ="";
	form.action = "admin_member_list";
	form.submit();	
}
</script>		
  
  
<article>
<h1>회원리스트</h1>	
<form name="frm" id="member_form" method="post">
<table>
  <tr>
  <td width="642">
      	회원명 
     <input type="text" name="key" id="key">
     <input class="btn" type="button" name="btn_search" value="회원검색" onClick="member_search()">
     <input class="btn" type="button" name="btn_total" value="전체보기" onClick="member_total()">
  </td>
  </tr>
</table>
<table class="table" id="memberlist" style="text-align:center">
    <tr>
        <th>ID</th>
        <th>이름</th>

        <th>연락처</th>
        <th>주소</th>
        <th>이메일</th>
        <th>회원등급</th>
        <th>가입일자</th>
    </tr>
    <c:choose>
    <c:when test="${memberlistSize<=0}">
    <tr>
      <td width="100%" colspan="7" align="center" height="23">
        회원을 찾을 수 없습니다.
      </td>      
    </tr>
    </c:when>
	<c:otherwise>
	<c:forEach items="${memberlist}" var="memberVO" varStatus="status">
    <tr>
   	  <td>${memberVO.id}</td>
   	  <td> ${memberVO.name} </td>

      <td>${memberVO.phone}</td>
      <td>${memberVO.address}</td>
      <td>${memberVO.email}</td> 
      <td>${memberVO.grade }</td>
      <td> <fmt:formatDate value="${memberVO.regdate }" pattern="yyyy/MM/dd"/></td>
    </tr>
    </c:forEach>
    <tr><td colspan="6" style="text-align: center;"> ${paging} </td></tr>
	</c:otherwise>	
</c:choose>  
</table>
</form> 

<%@ include file="../memberpage_area.jsp" %>
</article>
</div>
</section>
<%@ include file="../../footer.jsp" %>
