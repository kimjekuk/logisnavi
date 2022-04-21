<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>

<head>
    <title>IamLogis Warehouse Information Center</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
	
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>	
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    
	<script>
		//---------------------------------------------- toast grid -----------------------------------------------------//		
		var Grid;  
		var ModalGrid;  
		
		window.onload = function(){
			json = JSON.parse($("#gridData").val());
			$('#gridTotalCount').text(json.length);
			//표제부
			Grid = new tui.Grid({						
			        el: document.getElementById('grid'),
	 		        pageOptions: {
			            perPage: 5000,
			            useClient: true
			        }, 
			        scrollX: true,
			        scrollY: true,
			        useClientSort : true,
			        showDummyRows : true,
			        rowHeaders:['rowNum', 'checkbox'],		   
			        columns: [
			            { header : '접수번호', name : 'reqseq', align : 'center' , width : 80 } ,
			            { header : '접수자', name : 'requsr', align : 'center' , width : 80 } ,
			            { header : '접수유형', name : 'reqcod', align : 'center' , width : 80 } ,
			            { header : '날짜', name : 'reqday', align : 'center' , width : 80 } ,
			            { header : '시간', name : 'reqtim', align : 'center' , width : 80 } ,
			            { header : '유형', name : 'rqifcd', align : 'center' , width : 80 } ,
			            { header : '임차제공자', name : 'rqiusr', align : 'center' , width : 80 } ,
			            { header : '임차공동중개자', name : 'rqicop', align : 'center' , width : 80 } ,
			            { header : '임차사기업명', name : 'lmcopr', align : 'center' , width : 80 } ,
			            { header : '임차사담당자', name : 'lmcont', align : 'center' , width : 80 } ,
			            { header : '임차사직위', name : 'lmsitr', align : 'center' , width : 80 } ,
			            { header : '임차사연락처', name : 'lmtelp', align : 'center' , width : 80 } ,
			            { header : '임차사이메일', name : 'lmemal', align : 'center' , width : 80 } ,
			            { header : '임차사매출액', name : 'lmcapi', align : 'center' , width : 80 } ,
			            { header : '임차사명함', name : 'lmbzcr', align : 'center' , width : 80 } ,
			            { header : '임차목적', name : 'lmppse', align : 'center' , width : 80 } ,
			            { header : '임차목적기타', name : 'lmpetc', align : 'center' , width : 80 } ,
			            { header : '임차요구온도', name : 'lmtemp', align : 'center' , width : 80 } ,
			            { header : '임차요구면적', name : 'lmsize', align : 'center' , width : 80 } ,
			            { header : '임차요구지역1', name : 'larea1', align : 'center' , width : 80 } ,
			            { header : '임차요구지역2', name : 'larea2', align : 'center' , width : 80 } ,
			            { header : '임차요구지역3', name : 'larea3', align : 'center' , width : 80 } ,
			            { header : '임차입주시점년', name : 'lminyy', align : 'center' , width : 80 } ,
			            { header : '임차입주시점월', name : 'lminmm', align : 'center' , width : 80 } ,
			            { header : '임차입주시점분기', name : 'lminqq', align : 'center' , width : 80 } ,
			            { header : '기타코멘트', name : 'stretc', align : 'center' , width : 80 } ,
			        ],
			        columnOptions : {
			        	resizable:true
			        }
			        , data : json		        		        
			    });
			
		}				
	</script>
	<style>	
		table, th, td {
		  border: 1px solid grey;
		  border-collapse: collapse;
		}
		th, td {
		  text-align: center;
		}
	</style>	
	
</head>



<body>
 <input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
 
 <a href="index.html">Home</a><br><br>
 &nbsp;&nbsp;&nbsp;<a href="reqlmForm">임차의뢰 정보등록</a>
 &nbsp;&nbsp;&nbsp;<a href="reqlmlist">임차의뢰 리스트</a>
 <hr>
   *********** 임차의뢰 리스트조회 *********** 
 <hr>
  
  리스트
       
 <hr>
  검색결과 : <text type="label" id="gridTotalCount" name="gridTotalCount"></text> 건
	
<br>	
    <div id="grid"></div>
<br>	
	<div id="myChart" style="width:100%; max-width:600px; height:500px;"></div>   

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
var data = google.visualization.arrayToDataTable([
  ['Contry', 'Mhl'],
  ['Italy',54.8],
  ['France',48.6],
  ['Spain',44.4],
  ['USA',23.9],
  ['Argentina',14.5]
]);

var options = {
  title:'World Wide Wine Production',
  is3D:true
};

var chart = new google.visualization.PieChart(document.getElementById('myChart'));
  chart.draw(data, options);
}
</script>
	
</body>
</html>