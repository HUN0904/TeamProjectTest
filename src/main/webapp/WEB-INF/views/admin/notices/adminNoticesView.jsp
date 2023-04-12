<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>  
  <article>
    <section class="container" > 
  <div class="card p-4 m-5" style="text-align:center; background-color:#fdefec">
      <h2> 공지사항 </h2>
    <form name="formm" method="post">
    <table class="table" id="notice" style="text-align:center">
	    <tr>
	    	<th>
	      		<h3> ${noticesVO.title}</h3>
	        </th>
	   </tr>
	   
	   <tr>
	        <th style="text-align:right; padding-right:100px ">
	            &nbsp;${noticesVO.id}&nbsp;
		        <fmt:formatDate value="${noticesVO.notices_date}" type="date"/>
	    		&nbsp;조회&nbsp;${noticesVO.hits}
	        </th>
	   
	   </tr>
	    <tr>
	      <td> <textarea rows="20" cols="80">${noticesVO.content}</textarea></td>
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
    </div>
    </section>
  </article>
<%@ include file="../../footer.jsp" %>
