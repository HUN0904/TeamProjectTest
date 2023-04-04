<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>  


<div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-body-tertiary">
    <div class="col-md-5 p-lg-5 mx-auto my-5">
    <img alt="" src="product_images/1.jpg">
      <h1 class="display-4 fw-normal"><font style="vertical-align: inherit;">
      <font style="vertical-align: inherit;">케이크 주문제작 </font></font></h1>
      <p class="lead fw-normal">
      <font style="vertical-align: inherit;">
	      <font style="vertical-align: inherit;"> 
	      주문제작 케이크 만들어 드려요.
	      </font>
	      <font style="vertical-align: inherit;">
	      정성으로 만들어드림
	      </font>
      </font></p>
      <a class="btn btn-outline-secondary" href="product_images/1.jpg">
      <font style="vertical-align: inherit;">
	      <font style="vertical-align: inherit;">
	      곧 출시(깃허브 테스트중 이번엔 hun에서 올리고 test에서 받아와봄)
	      </font>
      </font></a>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
  </div>

    <div class="container">
      <div class="row">
<c:forEach var="vo" items="${ProductList}" varStatus="st">
        <div class="col-3">
          <div class="card">
          <a href="product_detail?product_no=${vo.product_no}">
            <img src="product_images/${vo.product_image }"  alt="" class="card-img-top" /><%-- *바꿔야됨* --%>
            <div class="card-body">
              <h5 class="card-title">제목임${vo.product_name }</h5>
              <p class="card-text">내용임${vo.content }</p>
              <p class="card-text">
              	<fmt:formatNumber value="${vo.price }" type="number"/>원
              </p>
              <p class="card-text">리뷰<i class="bi bi-star-fill" style="color:#FACC00;"></i>${vo.avg_score }점</p>
           </div>
           </a>
           </div>
            </div>
</c:forEach>

      </div>
    </div>
    
<%@ include file="footer.jsp" %>    