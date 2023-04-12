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
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="member/postcode.js"></script>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>

<!-- Dropdowns -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

</head>
<body style="background-color:#fdefec">
<nav class="border-bottom navbar navbar-expand-md bg-#FDE3CC navbar-light position:fixed" style="background-color:#fdefec">
	<div class="collapse navbar-collapse" id="navbarText" >
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="index">홈</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="notices_list">공지사항</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="qna_list">Q&A</a>
			</li>	
			<c:if test="${sessionScope.loginUser.admin eq 'admin'}">		
			<li class="nav-item" >
				<a class="nav-link" href="admin_product_list" >관리자 페이지</a>
			</li>
			</c:if>	
		</ul>
	</div>

	<ul class="navbar-nav" style="padding-left:5px;">
		<c:choose>
	       <c:when test="${empty sessionScope.loginUser}">
				<li class="nav-item">
					<a class="nav-link" href="login_form">로그인</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="join">회원가입</a>
				</li>&nbsp;
			</c:when>
	        <c:otherwise>
		      <li style="color:orange">
		        ${sessionScope.loginUser.name}(${sessionScope.loginUser.nickname})
		      </li>
		      &nbsp;
	       	  <li><a href="logout">LOGOUT</a></li> &nbsp;
	       	  <br>
	        </c:otherwise> 
	      </c:choose>
	  </ul>
	
	
	
	<div class="dropdown" >
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    Click!
		  </button>
		<c:choose>
		   <c:when test="${empty sessionScope.loginUser}">
               <a href="login_form"></a>
		   </c:when>
	 
		      
		  <c:otherwise>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="padding-right:5px">
		    <a class="dropdown-item" href="cart_list">장바구니
		      <i class="bi bi-cart"></i>
		    </a>
		     <a class="dropdown-item " href="favorite_list" >찜목록
			      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-heart" viewBox="0 0 16 16">
	 				 <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5Zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0ZM14 14V5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1ZM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
				  </svg>
		     </a>
		     
		     <a class="dropdown-item" href="order_list">주문목록
		        <i class="bi bi-card-list"></i> 
		    </a>
		    
		    <a class="dropdown-item" href="modify_member_form">내 정보
		       <i class="bi bi-person-circle my-0"></i>
		    </a>
		    
		  </div>
		  </c:otherwise>
	   </c:choose>
		  
	</div>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
</nav>
