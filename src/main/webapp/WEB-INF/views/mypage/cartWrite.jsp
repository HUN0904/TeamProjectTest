<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<style>
.item-image {
	width: 500px;
	height: 300px;
	background-image: url("product_images/${product.product_image}");
	background-position: center;
	background-size: cover;
}
</style>  
<script type="text/javascript" src="mypage/mypage.js"></script>

<script type="text/javascript">
let gradeDiscount = '';
window.onload=function(){
	if(${member.grade==0}){
		gradeDiscount = 1;
	} else 	if(${member.grade==1}){
		gradeDiscount = 0.99;
	} else 	if(${member.grade==2}){
		gradeDiscount = 0.98;
	} else 	if(${member.grade==3}){
		gradeDiscount = 0.97;
	} else 	if(${member.grade==4}){
		gradeDiscount = 0.96;
	} else 	if(${member.grade==5}){
		gradeDiscount = 0.95;
	} else 	if(${member.grade==6}){
		gradeDiscount = 0.94;
	} else 	if(${member.grade==7}){
		gradeDiscount = 0.93;
	} else 	if(${member.grade==8}){
		gradeDiscount = 0.92;
	} else 	if(${member.grade==9}){
		gradeDiscount = 0.91;
	} else 	if(${member.grade==10}){
		gradeDiscount = 0.9;
	}
}

let pickup_date = '';
jQuery.datetimepicker.setLocale("kr");
$(function() {
	$("#datetimepicker").datetimepicker({ 
		format:"Y/m/d/H:i",
		inline:true,
		lang:'kr',
		step:30,
		minDate:'+1970-01-02',
		maxDate:'+1970-02-01',
		minTime:'13:00',
		maxTime:'18:00',
		defaultDate:'+1970/01/02',
		disabledDates:${strDisAbleDates},
		onChangeDateTime:function(dp,$input){

		    var d = $input.datetimepicker('getValue');
			console.log(d)
		    var month = (d.getMonth()+1);
		    if(month<10){
		    	month = '0'+month;
		    }
		    var date = d.getDate();
		    if(date<10){
		    	date = '0'+date;
		    }
		   	var time = d.getHours()+':'+d.getMinutes();
		   	if(time=='13:30'||time=='14:30'||time=='15:30'||time=='16:30'||time=='17:30'){
		   		pickup_date = d.getFullYear() +'/' + month + '/' + date + '/' +time;
		   		document.getElementById("pickup_date").value = pickup_date;
		   		console.log(pickup_date);
		   	} else if(time=='13:0'||time=='14:0'||time=='15:0'||time=='16:0'||time=='17:0'){
		   		pickup_date = d.getFullYear() +'/' + month + '/' + date + '/'+time+'0';
		   		document.getElementById("pickup_date").value = pickup_date;
		   		console.log(pickup_date);
		   	} else {
		   		pickup_date = '';
		   		document.getElementById("pickup_date").value = pickup_date;
		   	}
		    
		}
	});
});

</script>
</head>
<body>
	<form id="cart_insert" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_price" id="product_price" value="${product.price}">
		<input type="hidden" name="strDisAbleDates" id="strDisAbleDates" value="${strDisAbleDates}">

		<div class="wrap">
			<div class="item-image"></div>
				<div class="item-desc">
					<h1>${product.product_name}
					<span class="item-price">가격: ${product.price}원</span>
				</h1>
				</div>
				<div>
				픽업하실 날짜 (당일 예약불가)<br>
				<input type='text' id='datetimepicker' name='start_dt'  style='width:140px;'>
				</div>	
				<div class="item-order">
					<input type="text" readonly id=pickup_date name="pickup_date" value="">
					<label>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<input type="checkbox" id="message_check" onchange="messageCheck(this)">문구 추가(+2000)
							<label>
								<span class="input-group-text" id="basic-addon1">문구	입력</span>
							</label>
						</div>
					<input type="text" class="form-control" aria-describedby="basic-addon1" id="message" name='message' disabled value="">
					</div>
					</label>
					<label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<input type="checkbox" id="image_check" onchange="imageCheck(this)">커스텀 추가(+5000)		
								<label for="image">
	 								<div class="input-group-text" >파일 업로드하기</div>
								</label>
								<input type="file" name="image" id="image" disabled style="display:none;" onchange="readURL(this)">
								<img id="preview" name="preview" style="width:152px; height:100px; display:none;" />
							</div>
						</div>
					</label>
						
				<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">옵션 금액</span>
						<input type="text" readonly id="option_price" name="option_price" value="${product.price}">			
				</div>	
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">기타 요청사항</span>
					</div>
					<input type="text" id="content" name="content" class="form-control" placeholder="ex) 초 2개 주세요!" aria-label="" aria-describedby="basic-addon1">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="quantity">수량</label>
					</div>
					<select class="custom-select" id="quantity" name="quantity" onchange="selectQuantity()">
						<option name="quantity" value="0" selected>수량을 선택해주세요</option>
						<option name="quantity" value="1">1</option>
						<option name="quantity" value="2">2</option>
						<option name="quantity" value="3">3</option>
					</select>
				</div>	
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						
						<span class="input-group-text" id="basic-addon2">최종 금액</span>
						<input type="text" readonly id="total_price" name="total_price" value="">
						<span class="input-group-text" id="basic-addon1">회원님 등급으로 ${member.grade}% 할인</span>
					</div>
				</div>
			</div>
		<input type="hidden" id="product_no" name="product_no" value="${product.product_no}">
		
			<button type="button" onclick="cart_save()" class="btn btn-primary btn-order">주문담기</button>
		</div>

		
	</form>	
</body>
<%@ include file="../footer.jsp"%>