<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>   
<!-- 다음 우편번호 api -->
<script type="text/javascript" src="member/postcode.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="member/member.js"></script>
  <article>
  <section class="container"> 
		<div class="d-flex justify-content-center">
	    	<div class="col-lg-4 col-md-6 col-sm-8">
    <h2>Join Us</h2>
     <form id="join" action="join" method="post" name="formm">
      <fieldset>
        <legend>Basic Info</legend>
        <label>User ID</label>
        <input type="text"      name="id"  id="id" value="${id}"  size="12"  >
        <input type="hidden"    name="reid" id="reid" value="${reid}">
        <input type="button"    value="중복 체크"  class="dup" onclick="idcheck()"><br>
        <label>Password</label> 
        <input type="password"  name="pwd" id="pwd"><br> 
        <label>Retype Password</label> 
        <input type="password"  name="pwdCheck" id="pwdCheck"><br> 
        <label>Name</label>
        <input type="text" name="name" id="name"><br>
        <label>NickName</label>
        <input type="text" name="nickname" id="nickname">
        <input type="hidden"    name="renickname" id="renickname" value="${renickname}" size= "10">
        <input type="button"    value="중복 체크"  class="dup" onclick="joinnicknamecheck()"><br>
        <label>E-Mail</label>
        <input type="text" name="email" id="email"><br>
        <label>Phone Number</label> 
        <input  type="text" name="phone1" id = "phone1" size="3">-
        <input  type="text" name="phone2" id = "phone2" size="4">-
        <input  type="text" name="phone3" id = "phone3" size="4"><br>
      </fieldset>
	  
	  <fieldset>
	  <label>주소</label>
		<input type="text" id="sample6_postcode"  name=addr1  placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"  size=80 name=addr2><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" size=40 name=userAddr3>
		<input type="text" id="sample6_extraAddress" placeholder="참고항목"  size=30 name=userAddr4>
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
 