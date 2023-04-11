<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">

<style type="text/css">
body{   
  background-color:;
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
function idok(){
  self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>ID 찾기 결과</h1>
  <form method=post name=formm style="margin-right:0 "
  		action="id_check_form" >
    User ID <input type=text name="id" value="${id}">   
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.formm.id.value="";
        </script>
             요청하신 ID는 ${id}입니다.
      </c:if>
      <c:if test="${message == -1}">
             가입하지 않은 ID입니다.
      </c:if>
    </div>
    <input type="button" value="확인" class="cancel" onclick="idok()">
  </form>
</div>  
</body>
</html>