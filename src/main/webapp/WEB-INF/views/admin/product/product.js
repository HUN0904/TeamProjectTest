
function go_search() {
	var form = document.getElementById("prod_form");
	
	form.action = "admin_product_list";
	form.submit();
}

function go_total() {
	var form = document.getElementById("prod_form");
	document.getElementById("key").value="";
	
	form.action = "admin_product_list";
	form.submit();
}

function product_save() {
	if(document.getElementById("category_no").value==""){
		alert("상품 종류를 입력하세요");
		document.getElementById("category_no").focus();
		return false;
	} else if(document.getElementById("product_name").value==""){
		alert("상품명을 입력하세요");
		document.getElementById("product_name").focus();
		return false;
	} else if(document.getElementById("price").value==""){
		alert("판매가를 입력하세요");
		document.getElementById("price").focus();
		return false;
	} else if(document.getElementById("content").value==""){
		alert("상품설명을 입력하세요");
		document.getElementById("content").focus();
		return false;
	} else if(document.getElementById("image").value == ""){
		alert("상품 사진을 첨부해주세요.");
		return false;
	} else {
		var form = document.getElementById("write_form");
		form.enctype = "multipart/form-data";
		form.action = "admin_insert_product";
		form.submit();
	}
}

function go_mod(product_no) {
	var form = document.getElementById("detail_form");
	form.action = "admin_product_update_form?product_no="+product_no;
	form.submit();
}

function go_mod_save(product_no) {
	if(document.getElementById("category_no").value==""){
		alert("상품 종류를 입력하세요");
		document.getElementById("category_no").focus();
		return false;
	} else if(document.getElementById("product_name").value==""){
		alert("상품명을 입력하세요");
		document.getElementById("product_name").focus();
		return false;
	} else if(document.getElementById("price").value==""){
		alert("판매가를 입력하세요");
		document.getElementById("price").focus();
		return false;
	} else if(document.getElementById("content").value==""){
		alert("상품설명을 입력하세요");
		document.getElementById("content").focus();
		return false;
	} else {
		var form = document.getElementById("update_form");
		form.enctype = "multipart/form-data";
		form.action = "admin_product_update";
		form.submit();
	}
}


function go_list() {
	var form = document.getElementById("detail_form");
	
	form.action = "admin_product_list";
	form.submit();
}





