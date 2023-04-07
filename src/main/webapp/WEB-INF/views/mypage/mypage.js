function messageCheck(item){
	var message_check = document.getElementById("message_check");
	var option_price = parseInt(document.getElementById("option_price").value);
	if (message_check.checked == true) {
		document.getElementById("message").disabled = false;
		document.getElementById("message").focus();
		document.getElementById("option_price").value = option_price + 2000;
		document.getElementById("quantity").value = 0;
	} else {
		document.getElementById("total_price").value = '';
		document.getElementById("message").value = "";
		document.getElementById("message").disabled = true;
		document.getElementById("quantity").value = 0;
		
		if (document.getElementById("image_check").checked == true) {
			document.getElementById("option_price").value 
				= document.getElementById("product_price").value+5000;
		} else {
			document.getElementById("option_price").value 
				= document.getElementById("product_price");
		}
	}
}
 
 function imageCheck(item){
	var image_check = document.getElementById("image_check");
	var option_price = parseInt(document.getElementById("option_price").value);
	
	if (image_check.checked == true) {
		document.getElementById("image").disabled = false;
		document.getElementById("option_price").value = option_price + 5000;
		document.getElementById("quantity").value = 0;
	} else {
		document.getElementById("total_price").value = '';
		document.getElementById("image").disabled = true;
		document.getElementById("image").src = "";
		document.getElementById("preview").src = "";
		document.getElementById("preview").style.display = "none";
		document.getElementById("quantity").value = 0;
		if(document.getElementById("message_check").checked == true){
			document.getElementById("option_price").value
			 = document.getElementById("product_price").value + 2000;
		} else {
			document.getElementById("option_price").value 
			= document.getElementById("product_price").value;
		}   
	}
}

function selectQuantity(){
	var quantitys = parseInt(document.getElementById("quantity").value);

	var total_price = parseInt(document.getElementById("option_price").value) * quantitys;
	document.getElementById("total_price").value = total_price * gradeDiscount;	

}
function readURL(input) {
	var preview_image = document.getElementById('preview'); 
	
	if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	      preview_image.style.display = "block";
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
}
function cart_save() {
	if(document.getElementById("message_check").checked == true && document.getElementById("message").value == ""){
		alert("문구 추가를 하시고 입력을 하지 않으셨습니다. 문구 추가를 원하시면 입력해주세요.");
		document.getElementById("message").focus();
		return false;
	} else if(document.getElementById("image_check").checked == true && document.getElementById("image").value == ""){
		alert("커스텀 추가를 하시고 이미지를 첨부하지 않으셨습니다. 커스텀 추가를 원하시면 이미지를 첨부해주세요.");
		return false;
	} else if(document.getElementById("quantity").value=="0"){
		alert("수량을 입력해주세요");
	} else if(document.getElementById("pickup_date").value==""){
		alert("픽업하실 날짜와 시간을 입력해주세요");
	}else {
		var form = document.getElementById("cart_insert");
		form.enctype = "multipart/form-data";
		form.action = "cart_write";
		form.submit();
	}
}

function cart_delete() {
	const query = 'input[name="cart_no"]:checked';
	/* 체크한 항목의 갯수를 얻어옴 */
	var len = document.querySelectorAll(query).length;
	console.log(len);
	
	if (len == 0) {
		alert("삭제할 항목을 선택해 주세요.")
	} else {
		var form = document.getElementById("theform");
		form.action = "cart_delete";
		form.submit();
	}
}

function order(){
	var form = document.getElementById("getView");
	form.action = "order_insert";
	form.submit();
}



