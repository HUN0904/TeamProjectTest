<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="sub_menu.jsp" %>

<hr>
 <div id="aside" class="sidebar-menu" style="font-size:20px;">
	    <ul>
	    
	        <!-- 내 프로필 -->
		  
			<a  href="modify_member_form">내 정보
				<i class="bi bi-person-circle my-0"></i>
			</a><br><br>
	     
		    <a href="favorite_list"> 찜목록
		     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-heart" viewBox="0 0 16 16">
		 		 <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5Zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0ZM14 14V5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1ZM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
			 </svg>
		     </a><br><br>
		  
		     <a href="cart_list"> 장바구니
		         <i class="bi bi-cart"></i>
		     </a> <br><br>
		  
		     <a href="order_list"> 주문목록
		        <i class="bi bi-card-list"></i> 
		     </a><br><br>
		     
	    </ul>
  </div>

<c:choose>
	<c:when test="${favoriteList == 0}">
		<h3 style="color: black; text-align: center;">찜목록이 없습니다.</h3>
	</c:when>
	<c:otherwise>
		<form id="fav_list_form" method="get" align="center">
			<div class="container">
				<div class="row ">
					<c:forEach var="favorite" items="${listFavorite}">
                       <div class="col-3 mb-5" style="background-color:#fdefec">
						<div class="card">

							<a href="product_detail?product_no=${favorite.product_no}"> <img
								src="product_images/${favorite.product_image}"
								class="card-img-top" width="auto" height="200">
							</a>
							<div class="card-body" style="background-color:#fdefec" >
								<h5 class="card-title">${favorite.product_name}</h5>
								<p class="card-text">${favorite.price}</p>
								<input type="hidden" id="favorite_no" name="favorite_no" value="${favorite.favorite_no}">
								<a href="delete_favorite?favorite_no=${favorite.favorite_no}" >찜 취소</a>
							</div>
						</div>
					</div>
				  </c:forEach>
				</div>
			</div>
		</form>
	</c:otherwise>
</c:choose>
<%@ include file="../footer.jsp"%>