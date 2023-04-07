<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
    
	#myform fieldset{
	    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
	    direction: rtl; /* 이모지 순서 반전 */
	    border: 0; /* 필드셋 테두리 제거 */
	}
	#myform fieldset legend{
   		text-align: left;
	}	
	#myform input[type=radio]{
	    display: none; /* 라디오박스 감춤 */
	}
	#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #FACC00; /* 마우스 클릭 체크 */
	}
	#myform label{
	    font-size: 3em; /* 이모지 크기 */
	    color: transparent; /* 기존 이모지 컬러 제거 */
	    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
	}
	#myform label:hover{
	    text-shadow: 0 0 0 #FACC00; /* 마우스 호버 */
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 #FACC00; /* 마우스 호버 뒤에오는 이모지들 */
	}

</style>
</head>
<body>
<div class="container">
	<div class="card p-4 m-5">
    <form id="reviewForm" name="reviewForm" method="post" enctype="multipart/form-data">
<h2>리뷰작성</h2>
		<table id="rep_input" style="table-layout: fixed">                    
	        <div id="myform">
				<fieldset id="score">
				    <legend>별점</legend>
				    <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
				    <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
				    <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
				    <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
				    <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
				</fieldset>
			</div>
	        <tr>
		 	<!-- 
					<div class="col-sm-10">
					<input type="file" name="image" id="image">(이미지 파일만 가능)
					<small class="text-muted"></small>
					<small id="file" class="text-info"></small>
				</div>
		-->	
        	<th>	
				<div class="input-group">
				  <input type="file" class="form-control" id="image" name="image" >
				</div>
			</th>
			<th>
           		<textarea  rows="2" cols="60" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
            </th>
            <th >
            	<button type="button"  class="btn btn-secondary" onclick="save_review('${productVO.product_no }')">등록</button>
		    </th>
		   </tr>
		</table>
        <input type="hidden" id="product_no" name="product_no" value="${productVO.product_no }" />        
    </form>

     </div>
</div>
<div class="container">
	<div class="card p-4 m-5">
         <div>
            <h3>구매후기 <span id="cCnt"> </span></h3> ${avg_score }
        </div>
        <hr>
	    <form id="reviewListForm" name="reviewListForm" method="post">
	        <div id="reviewList">
	        </div>
	    </form>
		<!-- 페이지 처리 영역 -->
	    <div>
			<ul id="pagination">
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">

	$(document).ready(function() {
		// 상품상세정보 로딩 시에 상품평 목록을 조회하여 출력
		getReviewList();
	});
	
	// 상품평 목록 불러오기
	function getReviewList() {
		
		$.ajax({
			type: 'GET',
			url: 'reviews/list',
			dataType: 'json',
			data:$("#reviewForm").serialize(),
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				var pageMaker = data.pageInfo;
				var totalCount = data.total;
				var reviewList = data.reviewList;
				
				showHTML(pageMaker, reviewList, totalCount);
			},
			error: function() {
				alert("상품평 목록을 조회하지 못했습니다.")
			}
		});
	}
	
	/*
	** 상품평 페이지별 목록 요청
	*/
	function getReviewPaging(pagenum, rowsperpage, product_no) {
		$.ajax({
			type: 'GET',
			url: 'reviews/list',
			dataType: 'json',
			data:{"pageNum": pagenum,
				  "rowsPerPage": rowsperpage,
				  "product_no": product_no},
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				var pageMaker = data.pageInfo;
				var totalCount = data.total;
				var reviewList = data.reviewList;
				console.log("pageMaker=", pageMaker);
				console.log("count=", totalCount);
				console.log("reviews=", reviewList);
				
				showHTML(pageMaker, reviewList, totalCount);
			},
			error: function() {
				alert("상품평 목록을 조회하지 못했습니다.")
			}
		});
	}
	
	function showHTML(pageMaker, reviewList, totalCount) {
		var html = "";
		var p_html = "";
		if (reviewList.length > 0) {
			// 상품평의 각 항목별로 HTML 생성
			$.each(reviewList, function(index, item){
				html += "<div>";
				html += "<div id=\"review_item\">"; 
			    if(item.review_image != null && item.review_image != "") {
			        html += "<img src=\"review_images/" + item.review_image + "\" style=\"float: right; width:100px; height:100px;\"/><br>";
			    }
				html += "별점<i class=\"bi bi-star-fill\" style=\"color:#FACC00\"></i> "+ item.score+"<br>";
				html += "<strong>" + item.id + "</strong>&nbsp;&nbsp;&nbsp;";
				html += "<span id=\"write_date\">" + displayTime(item.review_regdate) + "</span><br>";
				html += item.content+"<br></div>";
				html += "<button type=\"button\"  class=\"btn btn-secondary\" onclick=\"delete_review('${productVO.product_no }')\">수정</button>";
				html += "<button type=\"button\"  class=\"btn btn-secondary\" onclick=\"delect_review('${productVO.product_no }')\">삭제</button>";
				html += "<hr></div>";
			});
			
			// 페이징 버튼 출력
			p_html+="<div class=\"d-flex justify-content-center\">";
			if (pageMaker.prev == true) {
				p_html += "<li class=\"paginate_button previous\">";
				p_html += "<a href='javascript:getReviewPaging("
					  +pageMaker.startPage-1+","+pageMaker.criteria.rowsPerPage+","+${productVO.product_no}+")'>[이전]</a></li>";
			}
			
			for(var i=pageMaker.startPage; i<=pageMaker.endPage; i++){
				p_html += "<a href='javascript:getReviewPaging("
					  + i +","+pageMaker.criteria.rowsPerPage+","+${productVO.product_no}+")'>["+i+"]</a></li>";
				console.log(p_html);
			}
			
			if (pageMaker.next == true) {
				p_html += "<li class=\"paginate_button next\">";
				p_html += "<a href='javascript:getReviewPaging("
					  +(pageMaker.endPage+1)+","+pageMaker.criteria.rowsPerPage+","+${productVO.product_no}+")'>[다음]</a></li>";
			}
			p_html+="</div>";
			
		} else { // 조회된 상품평이 없을 경우
			html += "<div>";
			html += "<h5>등록된 상품평이 없습니다.</h5>";
			html += "</div>";
		}
		
		// 상품평 갯수 출력
		$("#cCnt").html("("+ totalCount+")</span>");
		// 상품평 목록 출력
		$("#reviewList").html(html);
		// 페이징 버튼 출력
		$("#pagination").html(p_html);
		
	}
	
	/*
	** 입력 파라미터:
	**     timeValue - 상품평 등록 시간
	*/
	function displayTime(timeValue) {
		var today = new Date();
		
		// 현재시간에서 댓글등록시간을 빼줌
		var timeGap = today.getTime() - timeValue;
		
		// timeValue를 Date객체로 변환
		var dateObj = new Date(timeValue);
		
		// timeGap이 24시간 이내인지 판단
		if (timeGap < (1000 * 60 * 60 * 24)) {  // 시, 분, 초를 구함
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			//return hh + ':' + mi + ':' + ss;
			return [(hh>9 ? '':'0')+hh, ':', (mi>9 ? '':'0')+mi, ':', 
				    (ss>9 ? '':'0')+ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			//return yy + "-" + mm + "-" + dd;
			return [yy, '/', (mm>9 ? '':'0')+mm, '/', (dd>9 ? '':'0')+dd].join('');
		}
	}
	
	/*
	** 상품 댓글 등록
	*/
	function save_review(product_no) {
	    var score = $("input[name='rating']:checked").val();
	    var form_data = new FormData($('#reviewForm')[0]);
	    if (score != null) {
	        form_data.append('score', score);
	    }else{
	    	 alert("별점을 선택해주세요.");
	    }
	    $.ajax({
	        type: 'POST',
	        url: 'reviews/save',
	        data: form_data,
	        contentType: false,
	        processData: false,
	        success: function(data) {
	            if (data == 'success') {    // 상품평 등록 성공
	                getReviewList();        // 상품평 목록 요청함수 호출
	                $("#content").val("");
	                $("#score").val("");
	                $("#file").val("");
	            } else if (data == 'fail') {
	                alert("상품평 등록이 실패하였습니다. 다시 시도해 주세요.");
	            } else if (data == 'not_logedin') {
	                alert("상품평 등록은 로그인이 필요합니다.");
	            }
	        },
	        error: function(request, status, error) {
	            alert("error:" + error);
	        }
	    });
	}
	
	function delete_review(review_no) {
	    var score = $("input[name='rating']:checked").val();
	    var form_data = new FormData($('#reviewForm')[0]);
	
	    $.ajax({
	        type: 'POST',
	        url: 'reviews/delete',
	        data: form_data,
	        contentType: false,
	        processData: false,
	        success: function(data) {
	            if (data == 'success') {    // 상품평 등록 성공
	                getReviewList();        // 상품평 목록 요청함수 호출
	                $("#content").val("");
	                $("#score").val("");
	                $("#file").val("");
	            } else if (data == 'fail') {
	                alert("상품평 삭제 실패하였습니다. 다시 시도해 주세요.");
	            } else if (data == 'not_logedin') {
	                alert("상품평 등록은 로그인이 필요합니다.");
	            }
	        },
	        error: function(request, status, error) {
	            alert("error:" + error);
	        }
	    });
	}
</script>
</body>
</html>



