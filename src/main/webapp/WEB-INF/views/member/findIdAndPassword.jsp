<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">  
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script type="text/javascript" src="member/member.js"></script>
  </head>
  <body>
  <div id="wrap">
  	<h1>아이디, 비밀번호 찾기</h1>
  	<br>
	<form name="findId" id="findId" action="find_id" method="post">
	<table>
	<tr>
		<td align="right"><label> 이름</label></td>
		<td><input type="text" name="name" id="name" value=""></td>
	</tr>	
	<tr>
		<td align="right"><label> 이메일</label></td>
		<td><input type="text" name="email" id="email" value=""></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="아이디 찾기" onclick="findMemberId()"></td>
	</tr>
	</table>
	</form>
	<p><p><p><p><p><p><p><p><p><p><p><p>
	
	
	<form name="findPwd" id="findPwd" action="find_pwd" method="post">
	<table>
	<tr>
		<td align="right"><label> 아이디</label></td>
		<td><input type="text" name="id" id="id2" value=""></td>
	</tr>	
	<tr>
		<td align="right"><label> 이름</label></td>
		<td><input type="text" name="receiverName" id="name2" value=""></td>
	</tr>	
	<tr>
		<td align="right"><label> 이메일</label></td>
		<td><input type="text" name="receiver" id="email2" value=""></td>
		
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="button" value="비밀번호 찾기" onclick="sendpwd()"></td>
	</tr>
	</table>
		${massege}
	</form>
	</div>
</body>
</html>