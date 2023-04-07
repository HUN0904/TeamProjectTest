<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<article>
	<h2>공지사항</h2>
	<form name="formm" method="post">
		<table id="noticesList" class="table" border="1"
			style="table-layout: fixed">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록자</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${noticesList}" var="noticesVO">
				<tr>
					<td>${noticesVO.notices_no}</td>
					<td><a href="notices_view?notices_no=${noticesVO.notices_no}">
							${noticesVO.title}</a></td>
					<td>${noticesVO.id}</td>
					<td><fmt:formatDate value="${noticesVO.notices_date}"
							type="date" /></td>
					<td>${noticesVO.hits}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</article>
<%@ include file="../footer.jsp"%>












