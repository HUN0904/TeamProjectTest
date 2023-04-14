<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
  <section class="container"> 
  <div class="card p-4 m-5" style="background-color:#fdefec">
  <article>
    <section class="container"> 
  <div class="card p-4 m-5" style="background-color:#fdefec">
      <h2> 공지사항 </h2>
    <form name="formm" method="post">
    <table class="table" id="notice" >
	    <tr>
	    	<th>
	      		<h3> ${noticesVO.title}</h3><br>
	      		&nbsp;${noticesVO.id}&nbsp;
		        <fmt:formatDate value="${noticesVO.notices_date}" type="date"/>
	    		&nbsp;조회&nbsp;${noticesVO.hits}
	        </th>
	    </tr>
	    <tr>
	      <td><textarea rows="20" cols="80" readonly style="background-color:#fdefec">${noticesVO.content}</textarea></td>
	    </tr>
    </table>
    <div class="clear"></div>
     <div id="buttons" style="float:right">
      <input type="button"  value="목록보기"   class="submit"  onclick="location.href='notices_list'">  
      </div>
    </form>
    </div>
    </section>
  </article>
<%@ include file="../footer.jsp" %>
