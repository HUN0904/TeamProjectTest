<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">


<meta charset="UTF-8">
<title>닉네임 중복 체크</title>
<link href="CSS/subpage.css" rel="stylesheet">
<style type="text/css">
body{   
  background-color:
  font-family: Verdana;
}
#wrap{     
  margin: 0 20px;
}
h1 {
  font-family: "Times New Roman", Times, serif;
  font-size: 45px;
  color: #CCC;
  font-weight: normal;
}
input[type=button], input[type=submit] {
  float: right;
}
</style>
<script type="text/javascript">
function joinnicknameok(){
	  opener.formm.nickname.value="${nickname}"; 
	  opener.formm.renickname.value="${nickname}";
  self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>닉네임 중복확인</h1>
  <form method="post" name="formm" id="theform" style="margin-right:0 "
  		action="joinnickname_check_form" >
   	닉네임 <input type="text" name="nickname" value="${nickname}"> 
            <input type="submit" value="검색" class="submit"><br>     
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.formm.nickname.value="";
        </script>
        ${nickname}는 이미 사용중인 닉네임입니다.
      </c:if>
      <c:if test="${message==0}">
        ${nickname}는 사용 가능한 닉네임입니다.
        <input type="button" value="사용" class="cancel" onclick="joinnicknameok()">
      </c:if>
    </div>
  </form>
</div>  
</body>
</html>