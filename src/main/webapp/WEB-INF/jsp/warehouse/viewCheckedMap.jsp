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
	<script src="js/project9.js"></script>    

<script>

function fn_formSubmit(){
//	if ( ! chkInputValue("#crtitle", "<s:message code="crud.crtitle"/>")) return false;
//	if ( ! chkInputValue("#crmemo", "<s:message code="crud.crmemo"/>")) return false;

//	$("#form1").submit();
} 
</script>
</head>
<body>
    <div id="wrapper">

		<jsp:include page="../common/navigation.jsp" />
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">지도 정보 </h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        <!-- /#map info -->

<hr>
<p><b> ${listview.size()}</b> Selected</p>
<hr>
	

	<div id="map" style="width:100%;height:700px;"></div>
        <!-- /#map info -->
    </div> 
    </div>        

    <!-- /#wrapper -->
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
<script>

var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var positions = [];
<c:forEach var="listview" items="${listview}" varStatus="status">
	positions.push(
	    {
	        content: '<div style="width:200px; height:100px;"><center><br>${listview.whname}<br><a href="wareDetail?whcode=${listview.whcode}">상세보기</a><br></center></div>', 
	        latlng: new kakao.maps.LatLng(<c:out value="${listview.kkompx}"/>, <c:out value="${listview.kkompy}"/>)
	    });
</c:forEach>		

selectedInfowindow = null;

//지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds();   

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
//        image: normalImage

    });

    
    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(positions[i].latlng);    
    
  // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
  // 이벤트 리스너로는 클로저를 만들어 등록합니다 
  // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
//    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
//    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
  
//  //마커에 클릭이벤트를 등록합니다
//    kakao.maps.event.addListener(marker, 'click', function() {
//          // 마커 위에 인포윈도우를 표시합니다
//          infowindow.close();
//          infowindow.open(map, marker);  
//    });    
}

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeClickListener(map, marker, infowindow) {
    return function() {
    	// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
    	// 마커의 이미지를 클릭 이미지로 변경합니다
    	if (!selectedInfowindow) {
            infowindow.open(map, marker);  
    	} else {
    		selectedInfowindow.close();
    		infowindow.open(map, marker);  
    	}
        selectedInfowindow = infowindow
    	
    };
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}


//LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
//이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
function setBounds() {
  map.setBounds(bounds);
}
setBounds(bounds);

</script>

  
</body>

</html>
    