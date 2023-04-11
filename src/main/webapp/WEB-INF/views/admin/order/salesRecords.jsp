<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../adminheader.jsp"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	dataRequest();

	function dataRequest() {
		$.ajax({
			type: 'GET',
			headers: {
				Accept: "application/json; charset=utf-8",
				"Content-type": "application/json; charset=utf-8"
			},
			url: 'sales_record_chart',
			data: $("#sales_form").serialize(),
			success: function(result) {
				// 최신 버전의 구글 코어차트 패키지 로드해준다.
				google.charts.load('current', {'packages':['corechart']});
				
				// 차트API가 로드완료했을 때 실행할 콜벡함수 선언
				google.charts.setOnLoadCallback(function() {
					drawChart(result);
				});
			},
			error: function() {
				alert("Chart drawing error!");
			}
		});
	}
	
	function drawChart(result) {
		// 차트 그리는데 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "product_name");
		data.addColumn("number", "sum_quantity");
		
		var price = new google.visualization.DataTable();
		price.addColumn("string", "product_name");
		price.addColumn("number", "sum_price");
		// 콘트롤러에서 json타입으로 전달된 데이터를 
		// 자바스크립트의 배열로 저장
		var dataArray = [];
		var sum_price = [];
		$.each(result, function(i, obj){
			dataArray.push([obj.product_name, obj.sum_quantity]);
			sum_price.push([obj.product_name, obj.sum_price]);
		})
		
		
		// data객체에 dataArray의 내용을 저장
		data.addRows(dataArray);
		price.addRows(sum_price);
		// 파이차트 그리기
		var piechart_options = {
			title: '제품별 판매 수량', 
			width: 450,
			height: 450
		};
		
		var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
		
		piechart.draw(data, piechart_options);
		
		// 바차트 그리기
		var barchart_options = {
			title: '제품별 판매 실적',
			width: 450,
			height: 450
		}
		
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
		
		barchart.draw(data, barchart_options);
		
		// 바차트 그리기
			barchart_options = {
			title: '제품별 판매 금액',
			width: 450,
			height: 450
		}
		
		var price_div = new google.visualization.BarChart(document.getElementById('price_div'));
		
		barchart.draw(price, barchart_options);
	}
	
	$("#searchButton").click(function() {
		dataRequest();
	});
		
});


$(document).ready(function () {
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '',
        showOn: 'button',
        buttonImage:'admin/images/calendar_icon.png',
    	buttonImageOnly:true,
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        yearRange: 'c-99:c+99',
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#sdate').datepicker();
    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
    
    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#edate").datepicker( "option", "minDate", selectedDate );
        console.log(selectedDate);
        $('#start_date').val(selectedDate);
        
    });

    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val());
    $('#sdate').datepicker("option", "maxDate", 'today');
    $('#edate').datepicker("option", "maxDate", 'today');
    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#sdate").datepicker( "option", "maxDate", selectedDate );
        console.log(selectedDate);
        $('#end_date').val(selectedDate);
    });
});
function dateRange(){
	var form = document.getElementById("sales_form");
	form.action = "sales_record_chart";
	form.submit(); 
}

</script>

	<div align="center">
	<h1>제품 판매 실적</h1>
	<form id="sales_form" method="post">
	<table>
			<p>조회 기간
		        <input type="text" id="sdate" readonly><input type="hidden" name="start_date" id="start_date" > ~
		        <input type="text" id="edate" readonly><input type="hidden" name="end_date" id="end_date">${pickDate}
		        <input type="button" id="searchButton" value="검색" >
		        
		    </p>
		<tr>
			<td><div id="piechart_div" ></div></td>
			<td><div id="barchart_div" ></div></td>
			<td><div id="price_div" ></div></td>
		</tr>
	</table>
	</form>
	</div>
<%@ include file="../../footer.jsp"%>
