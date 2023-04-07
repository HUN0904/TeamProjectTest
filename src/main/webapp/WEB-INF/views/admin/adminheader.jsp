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
				<a class="nav-link" href="#">상품관리</a>
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

<body onload="go_ab()">  <!-- 페이지 로드시에 제품의 순매출 계산 -->
	<div id="wrap">
		<header>			
			<div id="logo">
				<a href="admin_login_form"> 
					<img style="width:800px" src="admin/images/bar_01.gif">
					<img src="admin/images/text.gif">
				</a>
			</div>			
		</header>
		<div class="clear"></div>