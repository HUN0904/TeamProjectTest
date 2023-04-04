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
    #reply {
    	margin-top: 8px;
    	border-radius: 3px;
    	border: 1px solid #ccc;
    	padding: 5px;
    }
    table#rep_input td{
    	border: 0px dotted;
    }
    .btn {
    	border: 1px solid #ccc;
    	border-radius: 3px;
    	color: #fff;
    	padding: 5px;
    	margin: 0 5px;
    }
    #reviewList {
    	background-color: rgba(254, 206, 229, 0.3);
    	border-radius: 3px;
    }
    
    #myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}

</style>
</head>
<body>
<div class="container">
    <form id="reviewForm" name="reviewForm" method="post">
    <br><br>
        <div>
            <div>
                <h3>구매후기 <span id="cCnt"> </span></h3> 
                
            </div>

            <div id="reply">
                <table id="rep_input" style="width: 650px">                    
                    <tr>
			           	<div id="myform">
							<fieldset>
								<span class="text-bold">별점을 선택해주세요</span>
								<input type="radio" name="reviewStar" value="1" id="score"><label for="score">★</label>
								<input type="radio" name="reviewStar" value="2" id="score"><label for="score">★</label>
								<input type="radio" name="reviewStar" value="3" id="score"><label for="score">★</label>
								<input type="radio" name="reviewStar" value="4" id="score"><label for="score">★</label>
								<input type="radio" name="reviewStar" value="5" id="score"><label for="score">★</label>
							</fieldset>
						</div>
               			<td>	
               			<a href="#" class="_3JijP7qf6h N=a:wrtrv.ath">사진/동영상 첨부하기</a>
							<div class="col-sm-10">
								<input type="file" name="file" id="file">
								<small class="text-muted">(이미지 파일만 가능)</small>
								<small id="file" class="text-info"></small>
							</div>
						</td>
                        <td style="width:40%;">
                            <textarea  rows="2" cols="60" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
                        </td>
                        <td style="width:10%;">
                            <a href='#' onClick="save_review('${productVO.product_no }')" class="btn">등록</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="product_no" name="product_no" value="${productVO.product_no }" />        
    </form>
</div>

<div class="container">
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
				html += "별점<i class=\"bi bi-star-fill\" style=\"color:#FACC00\"></i> "+ item.score+"<br>";
				html += "<strong>" + item.id + "</strong>&nbsp;&nbsp;&nbsp;";
				html += "<span id=\"write_date\">" + displayTime(item.review_regdate) + "</span><br>";
				html += item.content+"<br></div>";
				html += "<hr></div>";
			});
			
			// 페이징 버튼 출력
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
		$.ajax({
			type:'POST',
			url:'reviews/save',
			data:$("#reviewForm").serialize(),
			success: function(data) {
				if (data=='success') {	// 상품평 등록 성공
					getReviewList(); 	// 상품평 목록 요청함수 호출
					$("#content").val("");
				} else if (data=='fail') {
					alert("상품평 등록이 실패하였습니다. 다시 시도해 주세요.");
				} else if (data=='not_logedin') {
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



