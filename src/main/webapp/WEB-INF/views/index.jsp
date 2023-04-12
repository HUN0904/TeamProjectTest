<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  
 <script>
   $(document).ready(function () {
	// 로그인 한 상태에서 하트를 클릭했을 때 (로그인한 상태인 하트의 <a></a> class명: heart-click)
	$(".heart-click").click(function() {
	    // 게시물 번호(no)를 idx로 전달받아 저장합니다.
	    let no = $(this).attr('idx');
	    console.log("heart-click");

	    // 빈하트를 눌렀을때
	    if($(this).children('svg').attr('class') == "bi bi-suit-heart"){
	        console.log("빈하트 클릭" + no);

	        $.ajax({
	            url : 'favorite_insert',
	            type : 'get',
	            data : {
	                product_no : no,
	            },
	            success : function(favorite) {
	                let heart = favorite.heart;
	                console.log("favorite_no",favorite.favorite_no );
	            	$("#favorite_no").val(favorite.favorite_no);
	            	
	                // 페이지, 모달창에 하트수 갱신
	                $('#m_heart'+no).text(heart);
	                $('#heart'+no).text(heart);

	                console.log("하트추가 성공");
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });
	        console.log("꽉찬하트로 바껴라!");

	        // 꽉찬하트로 바꾸기
	        $(this).html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");
	        $('.heart_icon'+no).html("<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-suit-heart-fill' viewBox='0 0 16 16'><path d='M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z'/></svg>");

       
	    }else if($(this).children('svg').attr('class') == "bi bi-suit-heart-fill"){
 	    	// 꽉찬 하트를 눌렀을 때
	        console.log("꽉찬하트 클릭" + no);
 	    	let favorite_no = $("#favorite_no").val();
	        $.ajax({
	            url : 'delete_favorite',
	            type : 'get',
	            data : {
	            	favorite_no : favorite_no,
	            },
	            success : function(favorite) {
					
	                let heart = favorite.heart;
	                // 페이지, 모달창에 하트수 갱신
	                $('#m_heart'+no).text(heart);
	                $('#heart'+no).text(heart);
	                console.log("하트삭제 성공");
	            },
	            error : function() {
	                alert('서버 에러');
	            }
	        });
	        console.log("빈하트로 바꾸기");
	        // 빈하트로 바꾸기
	        $(this).html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');

	        $('.heart_icon'+no).html('<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16"><path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" /></svg>');
	    }
	});
	
});
</script>

<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
    <div class="image-box">
    <img alt="" src="product_images/lily.jpg" style="width:800px; height:550px;">
      <h1 class="display-4 fw-normal"><font style="vertical-align: inherit;">
      <font style="vertical-align: inherit;">Custom CakeShop! </font></font></h1>
      <p class="lead fw-normal">
      <font style="vertical-align: inherit;">
	      <font style="vertical-align: inherit;"> 
	      케이크 주문제작 사이트입니다!
	      </font>
	      <font style="vertical-align: inherit;">
	      
	      </font>
      </font></p>
      <a class="btn btn-outline-secondary" href="#">
      <font style="vertical-align: inherit;">
	      <font style="vertical-align: inherit;">
	      출시예정!
	      </font>
      </font></a>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
  </div>

   <div class="container">
      <div class="row">
	<c:forEach var="vo" items="${ProductList}" varStatus="st">
      		<div class="card col-3 mb-3" style="background-color:#fbe4e3">
      		  <a href="product_detail?product_no=${vo.product_no}">
		          <img src="product_images/${vo.product_image}"  alt="" class="card-img-top" style="width:250px; height:250px;"/>
  
		            <div class="card-body" style="background-color:#fbe4e3">
		              <h5 class="card-title">${vo.product_name }</h5>
		              <p class="card-text">${vo.content }</p>
		              <p class="card-text">
		              	<fmt:formatNumber value="${vo.price}" type="number"/>원
		              </p>
		              <p class="card-text">리뷰<i class="bi bi-star-fill" style="color:#FACC00;"></i>${vo.avg_score}점 </p>
		           
		           
		                <div class="card-icon">
      		    <form  method="post" action="cart_insert" name="formm" id="theform">
				 	<input type="hidden" id="favorite_no" name="favorite_no"  value="${favorite.favorite_no}">
				   <fieldset>
      		  <!-- 좋아요 버튼 -->	
      		  <br>			
				<c:choose>
				    <%-- 로그인 상태일때 - 하트 클릭 되게 --%>
				    <c:when test="${not empty sessionScope.loginUser}">
				        <c:choose>
				            <c:when test="${empty favorite.favorite_no}">
				                <%-- 빈 하트일때 --%>
				                <a idx="${vo.product_no}" href="javascript:"
				                    class="heart-click heart_icon${favorite.favorite_no}" style="color:red;">
				                    <svg
				                        xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				                        fill="currentColor" class="bi bi-suit-heart"
				                        viewBox="0 0 16 16">
				                          <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
				                    </svg>
				                </a>
				            </c:when>
				            <c:otherwise>
				                <%-- 꽉찬 하트일때 --%>
				                <a idx="${vo.product_no}" href="javascript:"
				                    class="heart-click heart_icon${favorite.favorite_no}" style="color:red;"><svg
				                        xmlns="http://www.w3.org/2000/svg" width="16" height="16"
				                        fill="currentColor" class="bi bi-suit-heart-fill"
				                        viewBox="0 0 16 16">
				                   <path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z" />
				                        </svg>
				                 </a>                
				            </c:otherwise>
				        </c:choose>
				    </c:when>
				    
				    <%-- 로그인 상태가 아닐때  - 하트클릭 안되게 --%>
				    <c:otherwise>
				        <a href="javascript:" class="heart-notlogin" style="color:red;"> 
				          <svg class="heart3" xmlns="http://www.w3.org/2000/svg" width="16"
				                height="16" fill="currentColor" class="bi bi-suit-heart"
				                viewBox="0 0 16 16">
				                <path d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
				          </svg>
				        </a>
				    </c:otherwise>
				</c:choose>

	          찜하기</fieldset>
	         </form>
	       </div> 
	  
       <!-- END 좋아요 -->
		           </div>
		          </a> 
		       </div>
		</c:forEach>

      </div>
    </div>

<%@ include file="footer.jsp" %>    