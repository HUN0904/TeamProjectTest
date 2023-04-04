function idcheck(){
	//아이디 정규식
	var checkid = /^[a-z0-9]{4,}$/;
	if(document.getElementById("id").value==""){
		alert("아이디를 입력 해 주세요.");
		document.getElementById("id").focus();
		return false;
		//아이디 
	}else if (checkid.test(document.getElementById("id").value) == false) {
        alert("아이디는 영어 소문자와 숫자만 사용 가능하며 6자 이상이어야 합니다.");
        document.getElementById("id").focus();
        return false;
	}
	//url - 컨트롤러 요청하는 url,
	// "_balnk_" - 새로운 윈도우를 생성하여표시
	var url="id_check_form?id="+document.getElementById("id").value;
	window.open(url, "_balnk_", "toolbar=no, menubar=no, scrollbars=no, width=450, height=350");
	
}




function go_save(){
	//비밀번호 정규식
	var checkpwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	//이메일 정규식
	var checkemail = /^[^\s@]+@[^\s@]+\.(com|net|co\.kr)$/;	
	//핸드폰 정규식
	var checkphone = /^\d{3}\d{3,4}\d{4}$/;
	//입력체크
	if(document.getElementById("id").value==""){
		alert("사용자 아이디를 입력 하세요.");
		document.getElementById("id").focus;
		return false;
	}else if(document.getElementById("reid").value==""){
		alert("아이디 중복 체크 하세요.");
		document.getElementById("id").focus;
		return false;
	}else if(document.getElementById("pwd").value==""){
		alert("비밀번호를 입력 하세요.");
		document.getElementById("pwd").focus;
		return false;
	}else if(document.getElementById("pwd").value!=document.getElementById("pwdCheck").value){
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("pwd").focus;
		return false;
	}else if(document.getElementById("pwd").value!=document.getElementById("pwdCheck").value){
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("pwd").focus;
		return false;
	}else if(document.getElementById("name").value==""){
		alert("이름을 입력하세요.");
		document.getElementById("name").focus;
		return false;
	}else if(document.getElementById("email").value==""){
		alert("이메일을 입력하세요.");
		document.getElementById("email").focus;
		return false;
    //패스워드
	}else if (checkpwd.test(document.getElementById("pwd").value) == false) {
        alert("패스워드는 영어, 기호, 숫자 포함 최소 8자 이상이어야 합니다.");
        document.getElementById("pwd").focus();
        return false;
	///휴대폰 번호 
	}else if (checkphone.test(document.getElementById("phone1").value
			+ document.getElementById("phone2").value
			+ document.getElementById("phone3").value) == false) {
	    alert("휴대폰번호 형식이 맞지 않습니다");
	    document.getElementById("phone1").focus();
	    return false;
     //이메일
	}else if (checkemail.test(document.getElementById("email").value) == false) {
        alert("이메일 주소가 옳지않습니다.");
        document.getElementById("email").focus();
        return false;
	}else{
		document.getElementById("join").action="join";
		document.getElementById("join").submit();
	}

}

function find_id_form(){
	var url="find_id_form"
	window.open(url, "_balnk_", "toolbar=no, menubar=no, scrollbars=no, width=550, height=450");
}


function findMemberId() {
	if (document.getElementById("name").value=="") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("email").value=="") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		var form = document.getElementById("findId");
		form.action = "find_id";
		form.submit();
	}	
}

function sendpwd(){
	
	if (document.getElementById("id2").value=="") {
		alert("아이디를 입력해 주세요");
		document.getElementById("id2").focus();
		return false;
	}else if (document.getElementById("name2").value=="") {
		alert("이름을 입력해 주세요");
		document.getElementById("name2").focus();
		return false;
	} else if (document.getElementById("email2").value=="") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email2").focus();
		return false;
	} else {
		var form = document.getElementById("findPwd");
		form.action = "find_pwd";
		form.submit();
	}	
}

