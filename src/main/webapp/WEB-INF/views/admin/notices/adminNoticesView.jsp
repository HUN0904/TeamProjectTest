<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>  
  <article>
      <h2> 공지사항 </h2>
    <form name="formm" method="post">
    <table class="table" id="notice" border="1"   style="table-layout: fixed">
	    <tr>
	    	<th>
	      		<h3> ${noticesVO.title}</h3><br>
	      		&nbsp;${noticesVO.id}&nbsp;
		        <fmt:formatDate value="${noticesVO.notices_date}" type="date"/>
	    		&nbsp;조회&nbsp;${noticesVO.hits}
	        </th>
	    </tr>
	    <tr>
	      <td>${noticesVO.content}</td>
	    </tr>
    </table>
    <div class="clear"></div>
     <div id="buttons" style="float:right">
      <input type="button"  value="목록보기"   class="submit"  onclick="location.href='admin_notices_list'">  
		<c:if test="${sessionScope.loginUser.admin == 'admin'}">
			<input type="button"  value="수정하기"   class="submit"  onclick="location.href='notices_update_form?notices_no='+${noticesVO.notices_no}">  
		</c:if>
      </div>
    </form>
  </article>
<%@ include file="../../footer.jsp" %>
