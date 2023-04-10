<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<nav class="border-bottom navbar navbar-expand-md bg-white navbar-light sticky-top" >
	<div class="collapse navbar-collapse" id="navbarText" >
	관리자만 보이는 네비바
		<ul class="navbar-nav" >
			<li class="nav-item">
				<a class="nav-link" href="reservation_status">예약 현황</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="admin_product_list">상품관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="admin_order_list">주문관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">리뷰관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="admin_notices_list">공지사항</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">회원관리</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">QNA관리</a>
			</li>
		</ul>
	</div>
	<div class="dropdown">
		<button type="button" class="btn btn-secondary dropdown-toggle" 
			type="button" data-bs-toggle="dropdown" aria-expanded="false">관리자버튼
		</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">상품관리</a>
			<a class="dropdown-item" href="#">주문관리</a>
			<a class="dropdown-item" href="#">리뷰관리</a>
			<a class="dropdown-item" href="#">공지사항</a>
		</div>
	</div>
	
</nav>
<div class="clear"></div>
  <section class="container"> 
  <div class="card p-4 m-5">