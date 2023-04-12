<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="member/postcode.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <article>
  <section class="container"> 
		<div class="d-flex justify-content-center">
	    <div class="col-lg-4 col-md-6 col-sm-8">
    <h2>회원 정보수정</h2>
     <form id="modify_member_form" action="modify_member" method="post" name="formm">
      <fieldset>
        <legend>정보 수정</legend>
        <label style="width:50px">ID</label>
        <input style="width:200px" type="text" name="id" id="id" value ="${sessionScope.loginUser.id}" readonly/><br>
        <label>Password</label> 
        <input type="password"  name="pwd" id="pwd" style="width:180px"><br> 
        <label>RePassword</label> 
        <input type="password"  name="pwdCheck" id="pwdCheck" style="width:160px"><br> 
        <label>Name : ${sessionScope.loginUser.name}</label><br>
        <label>NickName</label>
        <input type="text" name="nickname" id="nickname" value ="${sessionScope.loginUser.nickname}">
        <input type="hidden"    name="renickname" id="renickname" value="${renickname}">
        <input type="button"    value="중복 체크"  class="dup" onclick="modifynicknamecheck()"><br>
        	*닉네임 변경시 닉네임 중복체크를 해주세요<br>

        <label>E-Mail</label>
        <input type="text" name="email" id="email" value="${sessionScope.loginUser.email }" readonly><br>
        <label>Phone Number</label> 
        <input  type="text" name="phone1" id = "phone1" size="3">-
        <input  type="text" name="phone2" id = "phone2" size="4">-
        <input  type="text" name="phone3" id = "phone3" size="4"><br>
      </fieldset>
	  
	  <fieldset>
  <label>주소</label>
		<input type="text" id="sample6_postcode"  name=addr1  placeholder="우편번호">
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"  size=40 name=addr2><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소" size=40 name=userAddr3>
		<input type="text" id="sample6_extraAddress" placeholder="참고항목"  size=40 name=userAddr4>
	  </fieldset>
      
      <div class="clear"></div>
      <div id="buttons">
        <input type="button"    value="수정"   class="submit" onclick="modify_save()"> 
        <input type="reset" value="취소" />
      </div>
      <br>
    </form>
     </div>
	</div>
</section>
  </article>
<%@ include file="../footer.jsp" %>
