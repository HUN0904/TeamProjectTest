<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
function delete_favorite_no(f_no){
	var form = document.getElementById("fav_list_form");
	console.log("favorite_no=", f_no);
	var param = "favorite_no="+f_no;
	
	form.action = "delete_favorite?" + param;
	form.submit();
}
</script>
<h2>Wish List</h2>
<hr>

<c:choose>
	<c:when test="${favoriteList == null}">
		<h3 style="color: red; text-align: center;">찜목록이없습니다.</h3>
	</c:when>
	<c:otherwise>
		<form id="fav_list_form" method="get">
			<div class="container">
				<div class="row ">
					<c:forEach var="favorite" items="${listFavorite}">
                       <div class="col-3 mb-5">
						<div class="card " style="background-color:#FDE3CC">

							<a href="product_detail?product_no=${favorite.product_no}"> <img
								src="product_images/${favorite.product_image}"
								class="card-img-top" width="auto" height="200">
							</a>
							<div class="card-body">
								<h5 class="card-title">${favorite.product_name}</h5>
								<p class="card-text">${favorite.price}원</p>

								<a href="#"
									onclick="location.href='delete_favorite?favorite_no='+${favorite.favorite_no}">찜 취소
								</a>
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