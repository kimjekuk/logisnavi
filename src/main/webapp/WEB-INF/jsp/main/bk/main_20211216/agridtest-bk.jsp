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

    <link rel="stylesheet" href="css/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/assets/css/templatemo.css">
    <link rel="stylesheet" href="css/assets/css/custom.css">
    
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<style>
	</style>	
</head>
		<script>
		
		var grid;  //인스턴스 객체 생성
		window.onload = function(){

//		    $.ajax({
//		        url : "agridtest",
//		        type :"post",
//		        success : function(result){
//		        	alert(result);
//		        titlevo = JSON.stringify(result,'mgbdrgpk','ldxy')
//		           grid.resetData(result);
//		        } 
//		    });

			     grid = new tui.Grid({
			        el: document.getElementById('grid'),
			        scrollX: false,
			        scrollY: false,
			        columns: [
			          { header: '대지위치', name: 'platPlc', },
			          { header: '관리허가대장PK', name: 'mgmBldrgstPk', },
			          { header: '건물명', name: 'bldNm', },
			          { header: '대지면적(㎡)', name: 'platArea', },
			          { header: '건축면적(㎡)', name: 'archArea', },
			          { header: '건폐율(%)', name: 'bcRat', },
			          { header: '연면적(㎡)', name: 'totArea', },
			          { header: '용적률산정연면적(㎡)', name: 'vlRatEstmTotArea', },
			          { header: '용적률(%)', name: 'vlRat', },
			          { header: '주건축물수', name: 'mainBldCnt', },
			          { header: '부속건축물동수', name: 'atchBldDongCnt', },
			          { header: '주용도코드명', name: 'mainPurpsCdNm', },
			          { header: '총주차수', name: 'totPkngCnt', },
			          { header: '착공예정일', name: 'stcnsSchedDay', },
			          { header: '착공연기일', name: 'stcnsDelayDay', },
			          { header: '실제착공일', name: 'realStcnsDay', },
			          { header: '건축허가일', name: 'archPmsDay', },
			          { header: '사용승인일', name: 'useAprDay', },
			          { header: '생성일자', name: 'crtnDay', }			          
			        ]
			    });	    
		    
		      };
		      
				
function getGridInfo(){
	var datas;
	$.ajax({
		url: "jsontest",
		type:"post", 
		success : function(result){  
			alert(result);
			json = JSON.parse(result);
			grid.resetData(json);
		},
        error: function() {
            alert('Error occured' + mgbdrgpk);
        }
   	})	
}

			
			
		 </script>
<body>
<jsp:include page="inc_header.jsp" flush="true"/>
	<br>
	GrID TEST PAGE
	<br>
	<div id="grid"></div>
	<a href="javascript:getGridInfo();">그리드 정보 획득</a>
	<br>
</body>
</html>