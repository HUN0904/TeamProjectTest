<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
    <!-- link rel="stylesheet" href="css/bootstrap.min.css"> -->
    <style>
    #cCnt {
       border-radius: 3px;
       border: 1px solid #000;
       padding: 5px;
    }
    
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
       background: #f00;
       color: #fff;
       padding: 5px;
       margin: 0 5px;
    }
    #qnaList {
       background-color: rgba(254, 206, 229, 0.3);
       border-radius: 3px;
    }
    </style>
</head>
<body>
<article>
  <section class="container"> 
  <div class="card p-4 m-5">
    <form name="formm" method="post">
    <h2>상품 Q&A</h2>
    <input type="hidden" name="product_no" id="product_no" value="${ProductVO.product_no}">
    <table id="qna_List" class="table"  style="table-layout: fixed">
	    <tr>
	    
	      <th>제목</th> 
	      <th>작성자</th> 
	      <th>등록일</th>  
	    </tr>
	<c:forEach items="${listQna}"  var="qnaVO">
		<tr>  
		  <td> <a href="qna_view?qna_no=${qnaVO.qna_no}"> ${qnaVO.title}</a> </td>     
		  <td> ${qnaVO.id}</td> 
		  <td> <fmt:formatDate value="${qnaVO.qna_regdate}" type="date"/></td> 
		</tr>
	</c:forEach>    
    </table>
      <c:if test="${sessionScope.loginUser != null}">
	   	  <div id="buttons" style="float:right">
	      	<input type="button"  value="문의하기"  class="submit"    
			onclick="location.href='qna_write_form'">  <!-- 컨트롤러로 보내기 -->
	      </div>
 	  </c:if>
    </form>
    </div>
    </section>
  </article>
   <!-- 페이지 처리 영역 -->
    <div>
      <ul id="pagination">
      </ul>
   </div>

<script type="text/javascript">

   $(document).ready(function() {
      // 상품상세정보 로딩 시에 상품평 목록을 조회하여 출력
      getQnaList();
   });
   
   // 상품평 목록 불러오기
   function getQnaList() {
      
      $.ajax({
         type: 'GET',
         url: 'qna/qnalist',
         dataType: 'json',
         data:$("#qnaForm").serialize(),
         contentType: 'application/x-www-form-urlencoded; charset=utf-8',
         success: function(data) {
            var pageMaker = data.pageInfo;
            var totalCount = data.total;
            var qnaList = data.qnaList;
            
            showHTML(pageMaker, qnaList, totalCount);
         },
         error: function() {
            alert("Q&A 목록을 조회하지 못했습니다.")
         }
      });
   }
   /*
    ** 상품평 페이지별 목록 요청
    */
    function getQnaPaging(pagenum, rowsperpage, qna_no) {
       $.ajax({
          type: 'GET',
          url: 'qna/list',
          dataType: 'json',
          data:{"pageNum": pagenum,
               "rowsPerPage": rowsperpage,
               "qna_no": qna_no},
          contentType: 'application/x-www-form-urlencoded; charset=utf-8',
          success: function(data) {
             var pageMaker = data.pageInfo;
             var totalCount = data.total;
             var qnaList = data.qnaList;
             console.log("pageMaker=", pageMaker);
             console.log("count=", totalCount);
             console.log("qna=", qnaList);
             
             showHTML(pageMaker, qnaList, totalCount);
          },
          error: function() {
             alert("Q&A 목록을 조회하지 못했습니다.")
          }
       });
    }
    
    function showHTML(pageMaker, qnaList, totalCount) {
       var html = "";
       var p_html = "";
       
       if (commentList.length > 0) {
          // 상품평의 각 항목별로 HTML 생성
          $.each(commentList, function(index, item){
             html += "<div>";
             html += "<div id=\"comment_item\"> <strong>작성자: " + item.writer + "</strong>";
             html += "<span id=\"write_date\">" + displayTime(item.regdate) + "</span><br>";
             html += item.content+"<br></div>";
             html += "</div>";
          });
          
          // 페이징 버튼 출력
          if (pageMaker.prev == true) {
             p_html += "<li class=\"paginate_button previous\">";
             p_html += "<a href='javascript:getCommentPaging("
                  +pageMaker.startPage-1+","+pageMaker.criteria.rowsPerPage+","+${productVO.product_no}+")'>[이전]</a></li>";
          }
          
          for(var i=pageMaker.startPage; i<=pageMaker.endPage; i++){
             p_html += "<a href='javascript:getCommentPaging("
                  + i +","+pageMaker.criteria.rowsPerPage+","+${productVO.product_no}+")'>["+i+"]</a></li>";
             console.log(p_html);
          }
          
          if (pageMaker.next == true) {
             p_html += "<li class=\"paginate_button next\">";
             p_html += "<a href='javascript:getCommentPaging("
                  +(pageMaker.endPage+1)+","+pageMaker.criteria.rowsPerPage+","+${productVO.product_no}+")'>[다음]</a></li>";
          }
          
       } else { // 조회된 상품평이 없을 경우
          html += "<div>";
          html += "<h5>등록된 상품평이 없습니다.</h5>";
          html += "</div>";
       }
       
       // qna 갯수 출력
       $("#qnaCnt").html("댓글 " + "<span style='color:#00f;'>" + totalCount+"</span>");
       // qna 목록 출력
       $("#qnatList").html(html);
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
    ** qna 등록
    */
    function save_qna(qna_no) {
       $.ajax({
          type:'POST',
          url:'qna/save',
          data:$("#qnaForm").serialize(),
          success: function(data) {
             if (data=='success') {   // 상품평 등록 성공
                getCommentList();    // 상품평 목록 요청함수 호출
                $("#qna").val("");
             } else if (data=='fail') {
                alert("Q&A  등록이 실패하였습니다. 다시 시도해 주세요.");
             } else if (data=='not_logedin') {
                alert("Q&A  등록은 로그인이 필요합니다.");
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