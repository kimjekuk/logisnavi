<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><s:message code="common.pageTitle"/></title>
    <link href="css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>
<script>
var selectedNode = null;

$(function(){
    $("#photofile").change(function(){
    	readImage(this);
    });
});
function readImage(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $("#previewImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function fn_formSubmit(){
	if ( ! chkInputValue("#whname", "창고명")) return false;
	if ( ! chkInputValue("#mpadrs", "주소")) return false;	
	if ( ! chkInputValue("#szarea", "연면적")) return false;	

/* 	var file = $("input[type=file]")[0].files[0];
	alert(file);
	if (file) {
		var formData = new FormData();
		formData.append("whname", $("#whname").val());
		formData.append("mpadrs", $("#mpadrs").val());
		formData.append("kkompx", $("#kkompx").val());
		formData.append("kkompy", $("#kkompy").val());
		formData.append("szarea", $("#szarea").val());
		formData.append("photofile", file); 
		$.ajax({
			url: "newWareAdd",
		    contentType: false,
		    processData: false,		
			type:"post", 
			data : formData,
		}).done(saveResult);
	} else {
		$("#deptno").val(selectedNode.data.key);	
		var formData = $("#form1").serialize();
		$.ajax({
			url: "newWareAdd",
			type:"post", 
			data : formData,
		}).done(saveResult);
	} */
//	document.form1.submit();	
	
}
</script>
</head>
<body>
    <div id="wrapper">

		<jsp:include page="../common/navigation.jsp" />
		
      	  <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">물류센터 등록</h3>
                </div>
            	<form id="form1" name="form1" role="form" action="saveNewWare" method="post" onsubmit="return fn_formSubmit();" >
              	   	<div class="row form-group">
                       <label class="col-lg-2">센터명칭</label>
                       	<input type="text" id="whname" name="whname" maxlength="10" value="<c:out value="${wareInfo.whname}"/>">
                    </div>
                 	<div class="row form-group">
                       <label class="col-lg-2">센터위치</label>
	                   <!--  <input type="text" id="mpadrs" name="mpadrs" maxlength="20" value="<c:out value="${wareInfo.mpadrs}"/>"> -->                    
					   <input type="text" id="mpadrs" maxlength="30" readonly name="mpadrs" placeholder="주소 검색 클릭" value="<c:out value="${wareInfo.mpadrs}"/>">
					   <input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
                    </div>					
					<div id="map" style="width:500px;height:400px;margin-top:10px;display:none"></div>
      				<br>
                 	<div class="row form-group">
                       <label class="col-lg-2">좌표X</label>
                       	<input type="text" readonly id="kkompx" name="kkompx" maxlength="10" value="<c:out value="${wareInfo.kkompx}"/>">
                    </div>
                 	<div class="row form-group">
                       <label class="col-lg-2">좌표Y</label>
                       	<input type="text" readonly id="kkompy" name="kkompy" maxlength="10" value="<c:out value="${wareInfo.kkompy}"/>">
                    </div>                    
                 	<div class="row form-group">
                       <label class="col-lg-2">연면적</label>
                       	<input type="text" id="szarea" name="szarea" maxlength="20" value="<c:out value="${wareInfo.szarea}"/>"
                       	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">  * 숫자만입력됨
                    </div>                    
   			        <button class="btn btn-outline btn-primary"><s:message code="common.btnSave"/></button>
              	</form>        			
            </div>			
	    </div> 
	</div>        

	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 8 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("mpadrs").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용
                        
                        document.getElementById("kkompx").value = result.y;
                        document.getElementById("kkompy").value = result.x;
                        
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>      
    <!-- /#wrapper -->
</body>
</html>
    