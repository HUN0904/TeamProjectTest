<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="qna/qna.js"></script>
<body>
<div class="container">
	<div class="card p-4 m-5">
         <div>
            <h3>Q&A </h3>
        </div>
    <form name="formm" method="post">${productVO.product_no }
    <c:if test="${!empty sessionScope.loginUser}">
	      	<input type="button"  value="qna 작성하기"  onclick="qnaWrite('${productVO.product_no }')">
	      	<input type="hidden" id="product_no" name="product_no" value="${productVO.product_no }" />    
   	</c:if>

    </form>		
    <form id="qnaListForm" name="qnaListForm" method="post">
        <div id="qnaList">
        </div>
    </form>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	// 상품상세정보 로딩 시에 Q&A 목록을 조회하여 출력
	getQnaList();
});
</script>


</html>



