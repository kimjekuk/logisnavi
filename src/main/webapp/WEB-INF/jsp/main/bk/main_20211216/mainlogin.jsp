<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/assets/css/fontawesome.min.css">
    
    
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
    <script>
		let map;
	
		function initMap() {
		  map = new google.maps.Map(document.getElementById("map"), {
		    center: { lat: 37.187, lng: 127.069 },
		    zoom: 3,
		  });
		}
		
		function checkFileType(filePath){
			var fileFormat = filePath.split(".");
			if(fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1){
				return true;
			}else{
				return false;
			}
		}
		
		
		function check(){
			var file = $("#excelFile").val();
			if(file==""||file==null){
				alert("select file!");
				return false;
			}else if(!checkFileType(file)){
				alert("select excel file!!");
				return false;
			}
			
			var form = $('#excelUploadForm')[0];
			var data = new FormData(form);
			
			$.ajax({
				type : "POST",
				enctype: 'multipart/form-data',
			       url: 'excelUploadAjax',
				data : data,
				dataType : 'json',
				processData: false,
				contentType: false,
				success: function (data) { 
					// 전송 후 성공 시 실행 코드
					console.log(data); 
				}, error: function (e) { 
					// 전송 후 에러 발생 시 실행 코드
					console.log("ERROR : ", e); 
				}
			});
						
		}
	</script>
	<style>    
		 #map {
		  height: 500px;
		}
		
		/* Optional: Makes the sample page fill the window. */
		html,
		body {
		  height: 500px;
		  margin: 0;
		  padding: 0;
		}
	</style>    
	
</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHLWrmRb2zN6UfEbyhf8X5bTFRu9FQ75w&callback=initMap&libraries=&v=weekly" async></script>
    <div class="container py-5">
            
    엑셀업로드 테스트
<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="/excelUploadAjax">     
<div>첨부파일은 한개만 등록가능합니다.</div>
<input id="excelFile" type="file" name="excelFile" />
<button type="button" id="addExcelBtn" class="btn" onclick="check()">추가</button>
</form>     

	</div>
	구글맵 테스트
    <div id="map"></div>
    <!-- End Contents -->

    <!-- Start Footer -->
  <jsp:include page="inc_footer.jsp" flush="true"/>
    <!-- End Footer -->
</body>
</html>
