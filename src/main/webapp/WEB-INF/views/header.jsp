<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문제작</title>
<!-- css 관련-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
<!-- js파일 다 몰아버림 -->

<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="js/product.js"></script>
<!-- 다음 우편번호 api -->
<script type="text/javascript" src="member/postcode.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Dropdowns
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
 -->
</head>
<body style="background-color:#FDE3CC">
<nav class="border-bottom navbar navbar-expand-md bg-#FDE3CC navbar-light sticky-top" style="background-color:#FDE3CC">
	<a class="navbar-brand" href="index">
		<img src="images/default.jpg" style="white:30px; height:30px;">
	</a>
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="index">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="notices_list">공지사항</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="product_list">케이크</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">추가할메뉴</a>
			</li>	
			<c:if test="${sessionScope.loginUser.admin eq 'admin'}">		
			<li class="nav-item">
				<a class="nav-link" href="admin_product_list">관리자 페이지</a>
			</li>
			</c:if>	
		</ul>
	</div>

	<ul class="navbar-nav">
		<c:choose>
	       <c:when test="${empty sessionScope.loginUser}">
				<li class="nav-item">
					<a class="nav-link" href="login_form">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="join">회원가입</a>
				</li>
			</c:when>
	        <c:otherwise>
		      <li style="color:orange">
		        ${sessionScope.loginUser.name}(${sessionScope.loginUser.nickname})
		      </li>
	       	  <li><a href="logout">LOGOUT</a></li>
	       	  <br>
	       	   <li><a href="modify_member_form">정보수정</a></li>
	        </c:otherwise> 
	      </c:choose>
	  </ul>
	<ul class="navbar-nav">
		<!-- 채팅 알림 -->
		<li class="nav-item">
			<a class="nav-link" href="">
				<h5 class="bi bi-chat-dots my-0"></h5>
			</a>
		</li>

		<!-- 내 프로필 -->
		<li class="nav-item">
			<a class="nav-link" href="mypage">
				<h5 class="bi bi-person-circle my-0"></h5>
			</a>
		</li>
	</ul>
	
	<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    Click!
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" href="https://www.instagram.com/ileen_keki/"> 인스타!
		      <i class="bi bi-instagram"></i>
		    </a>
		    <a class="dropdown-item" href="http://pf.kakao.com/_ixcmVxj">카카오!
		       <i class="bi bi-chat-fill"></i>
		    </a>
		  </div>
	</div>
	
</nav>