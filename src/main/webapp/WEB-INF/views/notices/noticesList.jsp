<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<style>
#board-search .search-window {
  padding: 15px 0;
  background-color: #f9f7f9;
}
#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 564px;
}
#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
}
#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}
#board-search .search-window .search-wrap .btn {
  position: absolute;
  right: 0;
  top: 0;
  bottom: 0;
  width: 108px;
  padding: 0;
  font-size: 16px;
}
.page-title {
  margin-bottom: 60px;
}
.page-title h3 {
  font-size: 50px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}


.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 17px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.container {
  width: 1100px;
  margin: 0 auto;
}

</style>

<section class="container">
  <div class="page-title">
        <div class="container">
            <h3>공지사항</h3>
        </div>
    </div>

    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form name="formm" method="post">
                    <div class="search-wrap">
                    	<input type="text" name="key" id="key">
                        <input class="btn" type="button" name="btn_search" value="검색" placeholder="검색어를 입력해주세요." onClick="go_search()">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   
  <!-- board list area -->
        <div class="container">
            <table class="table" style="text-align:center">
                <thead>
                <tr>
                    <th >번호</th>
                    <th >제목</th>
                    <th >등록일</th>
                    <th >조회수</th>
                </tr>
                </thead>
                <tbody>
                	<c:forEach items="${noticesList}"  var="noticesVO">
	                	<tr>
	                    	<td>${noticesVO.notices_no}</td>
	                    	<th ><a href="notices_view?notices_no=${noticesVO.notices_no}"> ${noticesVO.title}</a></th>
	                    	<td><fmt:formatDate value="${noticesVO.notices_date}" type="date"/></td>
	                    	<td>${noticesVO.hits}</td>
	                	</tr>
                	</c:forEach>
                </tbody>
            </table>
            
        </div>
<div class="d-flex justify-content-center">
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="notices_list${pageMaker.makeQuery(pageMaker.startPage-1)}">[이전]</a>
			</li>
		</c:if>				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a href="notices_list${pageMaker.makeQuery(index)}">[${index}]</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="notices_list${pageMaker.makeQuery(pageMaker.endPage+1)}">[다음]</a>
			</li>
		</c:if>				
	</ul>
</div>
</section>
<%@ include file="../footer.jsp" %>

