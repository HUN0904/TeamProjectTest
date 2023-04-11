<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<div class="container">
	<div class="card p-4 m-5" style="background-color:#fdefec">
         <div>
            <h3 style="background-color:#fdefec">Q&A </h3>
        </div>	
    <form id="qnaListForm" name="qnaListForm" method="post">
        <div id="qnaList">
        <input type="hidden" id="product_no" name="product_no" value="${productVO.product_no }" />
        </div>
    </form>
	</div>
</div>
<div class="container">
	<div class="card p-4 m-5" style="background-color:#fdefec">
	<form id="qnaForm" name="qnaForm" method="post" >
	<h2>Q&A 작성하기</h2>
		<input type="text" id="title" name="title" size="55"   placeholder="문의 하실 제목을 입력하세요"><br><br>
		<textarea  style="background-color:#fdefec" rows="12" cols="100" id="qna_content" name="qna_content" placeholder="문의 하실 내용을 입력하세요"></textarea>
	    <div >
	    <input type="radio" name="secret_yn" value="n"> 비공개 &nbsp; &nbsp; &nbsp;
	    <input type="radio" name="secret_yn" value="y" checked> 공개
	    </div>		
	    <div class="clear"></div>
		 <div id="buttons" >
		 <button type="button"  class="btn btn-secondary" onclick="qna_save('${productVO.product_no }')">등록</button>
		<input type="hidden" id="product_no" name="product_no" value="${productVO.product_no }" />        
		</div>
	</form>
<h3>상품 Q&A 작성 유의사항</h3><hr>
상품 Q&A는 상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 판매자에게 문의하는 게시판입니다.<br>
상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등 부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.<br>
전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.<br>
상품에 대한 이용 후기는 리뷰에 남겨 주세요.<br>
	</div>
</div>
</body>

<script type="text/javascript">


//Q&A 목록 불러오기
function getQnaList() {
	$.ajax({
		type: 'GET',
		url: 'qnas/list',
		dataType: 'json',
		data:$("#qnaForm").serialize(),
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var totalCount = data.total;
			var qnaList = data.qnaList;
			showHTML1(qnaList, totalCount);
		},
		error: function() {
			alert("Q&A 목록을 조회하지 못했습니다.")
		}
	});
}
function showHTML1(qnaList, totalCount) {
	var html = "";
	
			html += "<table class=\"table\" style=\"text-align:center\">";
			html += "<tr>";
			html += "<th>답변상태</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "<th>등록일</th>";
			html += "</tr>";
	if (qnaList.length > 0) {
		// 상품평의 각 항목별로 HTML 생성
		$.each(qnaList, function(index, item){
			html += "<tr>";
			if(item.reply==0){
				html += "<td>미답변</td>";
			}else if(item.reply==1){
				html += "<td>답변완료</td>";
			}
			//if 비밀글이여도 로그인 id같으면 보이게
			
			if(item.secret_yn=="y"){
				html += "<td>"+item.title+"</td>";
			}else if(item.secret_yn=="n"){
				html += "<td>비밀글 입니다. <i class=\"bi bi-lock\"></i></td>";
			}
			html += "<td>"+item.id+"</td>";
			html += "<td><span id=\"write_date\">" + displayTime(item.qna_regdate) + "</span></td>";
		});
		html +="</tr></table>";
	} else { // 조회된 상품평이 없을 경우
		html += "<div>";
		html += "<h5>등록된 Q&A가 없습니다.</h5>";
		html += "</div>";
	}
	
	// 상품평 목록 출력
	$("#qnaList").html(html);
	
}



function qna_save(product_no) {
	console.log(product_no);
	if(document.getElementById("title").value==""){
		alert("제목을 입력해주세요");
	} else if(document.getElementById("qna_content").value==""){
		alert("내용을 입력해주세요");
	} else {
		$.ajax({
	        type: 'POST',
	        url: 'qnas/save',
	        data: {
	            'title': $("#title").val(),
	            'content': $("#qna_content").val(),
	            'secret_yn': $('input:radio[name="secret_yn"]:checked').val(),
	            'product_no': $("#product_no").val()
	        },
	        success: function(data) {
	            if (data == 'success') {    // 상품평 등록 성공
	                getQnaList();        // 상품평 목록 요청함수 호출
	                $("#title").val("");
	                $("#qna_content").val("");
	            } else if (data == 'fail') {
	                alert("Q&A 등록이 실패하였습니다. 다시 시도해 주세요.");
	            } else if (data == 'not_logedin') {
	                alert("Q&A 등록은 로그인이 필요합니다.");
	            }
	        },
	        error: function(request, status, error) {
	            alert("error:" + error);
	        }
	    });
	}
}
</script>

</html>





