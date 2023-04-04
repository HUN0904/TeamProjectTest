<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  
  <article>
    <h2> Item</h2>     
    <c:forEach items="${productKindList}"  var="productVO">
      <div id="item">
        <a href="product_detail?pseq=${productVO.pseq}"> 
          <img src="product_images/${productVO.product_image}" />
          <h3>${productVO.name} </h3>        
          <p>${productVO.price2} </p>
        </a>  
      </div>
    </c:forEach>  
    <div id="near_card_form" class="near-card-form-content">
		<c:forEach var="productVO" items="${productKindList}">
			<div class="near-card-form-card">
				<div class="card" style="width: 18rem;">
						<img src="product_images/${productVO.product_image}">
					<div class="card-body">
						<a href="product_detail?pseq=${productVO.pseq}">
							<h5 class="card-title">${productVO.name}</h5>
							<p class="card-text">${productVO.price2}</p>
						</a>
					</div>
					<div class="near-card-form-bottom">
						<label>좋아요 13</label> <label>·</label> <label>댓글 44</label>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>  
    <div class="clear"></div>
  </article>
<%@ include file="../footer.jsp" %>    