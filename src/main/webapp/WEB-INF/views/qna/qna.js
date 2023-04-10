
// Q&A 목록 불러오기
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
		html += "<h5>등록된 상품평이 없습니다.</h5>";
		html += "</div>";
	}
	
	// 상품평 목록 출력
	$("#qnaList").html(html);
	
}
function qnaWrite(product_no) {
	console.log(product_no);
	var url = "qna_write_form?product_no=" + product_no;
	window.open(url, "_blank_", 
			"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=500");
}


function qna_save(product_no) {
	console.log(product_no);
	if(document.getElementById("title").value==""){
		alert("제목을 입력해주세요");
	} else if(document.getElementById("content").value==""){
		alert("내용을 입력해주세요");
	}else {
		alert("Q&A저장 완료.");
		var form = document.getElementById("qna_write");
		form.product_no.value = product_no;
		console.log(product_no);
		form.action = "qna_write";
		form.submit();
	}
}

