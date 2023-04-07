<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>  

  <article>
    <h1>Login</h1>
    <form method="post" action="login">
        <fieldset>
        <legend></legend>
          <label>User ID</label>
          <input name="id" type="text" value="${id}"><br> 
          <label>Password</label> 
          <input name="pwd" type="password"><br> 
        </fieldset>
        <div class="clear"></div>
        <div id="buttons">
            <input type="submit" value="로그인" class="submit">
            <input type="button" value="회원가입" class="cancel"
                 onclick="location='join'">
            <input type="button" value="아이디 비밀번호 찾기" class="submit"
                 onclick="find_id_form()">     
        </div>
    </form>  
  </article>

<section class="container"> 
		<div class="d-flex justify-content-center">
	    	<div class="col-lg-4 col-md-6 col-sm-8">
			   <form method="post" action="login">
				<h2>Login</h2>
			      <div class="form-group">
			         <label>User ID</label>
			         <input type="text" class="form-control" name='id' placeholder="User ID">
			      </div>
			      <div class="form-group">
			         <label>Password</label>
			         <input type="password" class="form-control" name="pwd" placeholder="Password">
			      </div>
			      <button type="submit" class="btn btn-primary btn-block mb-2">Login</button><br><br>
			      <button type="submit" class="btn btn-secondary" onclick="find_id_form()">아이디 ┃ 비밀번호 찾기</button>
			      <button type="submit" class="btn btn-secondary" onclick="location='join'">회원가입</button>
			   </form>
		</div>
	</div>
</section>
<%@ include file="../footer.jsp" %>      
