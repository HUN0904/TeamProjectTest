<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
<script type="text/javascript" src="member/member.js"></script>
<script type="text/javascript" src="member/postcode.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <article>
  <section class="container"> 
		<div class="d-flex justify-content-center">
	    	<div class="col-lg-4 col-md-6 col-sm-8">
    <h1>회원가입</h1>
     <form id="join" action="join" method="post" name="formm">
      <fieldset>
        <label>User ID</label>
        <input type="text" class="form-control" name="id" id="id" value="${id}" placeholder="User ID" size="12" >
        <input type="hidden"    name="reid" id="reid" value="${reid}">
        <input type="button"    value="중복 체크"  class="dup" onclick="idcheck()"><br>
        <br>
        <label>Password</label> 
        <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
        <label>Retype Password</label> 
        <input type="password" class="form-control" name="pwdCheck" id="pwdCheck" placeholder="Password">
        <br>
        <label>Name</label>
        <input type="text" class="form-control" name="name" id="name" placeholder="name">
        <br>
        <label>NickName</label>
        <input type="text" class="form-control" name="nickname" id="nickname" placeholder="nickname">
        <input type="hidden"    name="renickname" id="renickname" value="${renickname}" size= "10">
        <input type="button"    value="중복 체크"  class="dup" onclick="joinnicknamecheck()"><br>
        <br>
        <label>E-Mail</label>
        <input type="text" class="form-control" name="email" id="email" placeholder="email">
        <input type="hidden"    name="reemail" id="reemail" value="${reemail}">
        <input type="button"    value="중복 체크"  class="dup" onclick="emailcheck()"><br>
        <br>
        <label>Phone Number</label><br>
		<div class="d-inline-flex">
			<input type="text" size="5" name="phone1" id="phone1" class="form-control form-control-sm w-60" placeholder="010"> -
			<input type="text" size="6" name="phone2" id="phone2" class="form-control form-control-sm w-80"> -
			<input type="text" size="6" name="phone3" id="phone3" class="form-control form-control-sm w-80">
		</div>
      </fieldset>
	  <fieldset>
	  <br>
	  <label>주소</label>
		<input type="text" id="sample6_postcode"  name="addr1"  placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"  size=80 name="addr2"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" size=40 name="userAddr3">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목"  size=30 name="userAddr4">
	  </fieldset>
      
      <div class="clear"></div>
      <div id="buttons">
        <input type="button"    value="회원가입"   class="submit" onclick="join_save()"> 
        <input type="button"      value="취소"     class="cancel" onclick="location='login_form'">
      </div>
      <br>
    </form>
    </div>
	</div>
</section>
  </article>
  
<%@ include file="../footer.jsp" %>
 