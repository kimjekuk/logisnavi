<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/assets/css/fontawesome.min.css">
    
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>
    <!-- Start Contents -->
    <div class="container py-5">    
		<p style="text-align:left; color:#59ab6e; font-size:18px">■ 창고 정보</p>
		<p style="text-align:right;"><a href="javascript:history.back();">↩ 뒤로</a></p>
	    <div style="text-align:center;border:1px  black; display:flex;">
			<div style="border:1px  red;width:700px;margin-right:20px">
				<table class="table_type03" width=100% style="font-size:15px">
					<tbody  align="center">
						<tr>
							<td colspan="2" style="background: #59ab6e;color:white;">건축물 개요</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">건물명</td>
							<td>${warehouseVO.whname}</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">위치</td>
							<td>${warehouseVO.mpadrs}</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">대지면적</td>
							<td><fmt:formatNumber value="${warehouseVO.szposi}" pattern="#,###" />&nbsp;m<sup>2</sup></td> 
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">건축면적</td>
							<td><fmt:formatNumber value="${warehouseVO.szstrt}" pattern="#,###" />&nbsp;m<sup>2</sup></td> 
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">연면적</td>
							<td><fmt:formatNumber value="${warehouseVO.szarea}" pattern="#,###" />&nbsp;m<sup>2</sup></td> 
						<tr>						
						<tr>
							<td style="background: #FAFAFA;">준공일</td>
							<td>${warehouseVO.prstdy}</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">건축규모</td>
							<td>${warehouseVO.ifsize}</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">인근IC</td>
							<td>*데이터없음</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">특이사항</td>
							<td>*데이터없음</td>
						<tr>				
					</tbody>
				</table>
				<br>
				<table class="table_type03" width=100% style="font-size:15px">
					<tbody align="center">
						<tr>
							<td colspan="4" style="background: #59ab6e;color:white;">임대 조건</td>
						<tr>				
						<tr>
							<td colspan="2" style="background: #FAFAFA;">임대료</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td colspan="2" style="background: #FAFAFA;">임대료포함면적</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td colspan="2" style="background: #FAFAFA;">보증금</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td rowspan="8" style="background: #FAFAFA;">관리비</td>
							<td style="background: #FAFAFA;">창고</td>
							<td colspan="2">*데이터없음</td>
						<tr>						
						<tr>
							<td style="background: #FAFAFA;">하역장</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">사무실</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td style="background: #FAFAFA;">공용</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td colspan="2" style="background: #FAFAFA;">수도광열비</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td colspan="2" style="background: #FAFAFA;">Rent Free</td>
							<td colspan="2">*데이터없음</td>
						<tr>	
						<tr>
							<td colspan="2" style="background: #FAFAFA;">추가 조건</td>
							<td>*데이터없음</td>
							<td>*데이터없음</td>
						<tr>
						<tr>
							<td colspan="2" style="background: #FAFAFA;">인근임대료시세</td>
							<td colspan="2">*데이터없음</td>
						<tr>				
						<tr>
							<td colspan="2" style="background: #FAFAFA;">임대료인상율</td>
							<td colspan="2">*데이터없음</td>
						<tr>	
						
					</tbody>
				</table>	
			</div>
			<div style="border:1px  blue;width:500px;margin-left:20px;">
				<div> 
					<p style="margin-bottom:20px">전경도
						<div>
	  						<img src="${warehouseVO.img001}" width="450px" height="300px" border="1px solid grey">
						</div>
					</p>
				</div>
				<div> 
					<p>위치 
					<div id="map" style="width:450px;height:300px;border:1px solid grey;"></div>
					</p>
				</div>
				<div> 
					<p>배치도 
						<div>
							<img src="images/sample_bachi.png" width="450px" height="300px" border="1px solid grey">
						</div>
					</p>
				</div>
			</div>
		</div>	
	    <div style="text-align:center">
			<p style="text-align:left; color:#59ab6e; font-size:18px">■ 층별 정보</p>
			<table class="table_type03" width=100% style="font-size:15px">
				<tbody>
				<thead align="center">
					<tr>
						<td rowspan="2" style="background: #59ab6e;color:white;">층</td>
						<td rowspan="2" style="background: #59ab6e;color:white;">층별면적<br>(sum)</td>
						<td colspan="4" style="background: #59ab6e;color:white;">층별면적</td>
						<td colspan="3" style="background: #59ab6e;color:white;">임대조건(평,원)</td>
						<td colspan="4" style="background: #59ab6e;color:white;">층별SPEC</td>
					</tr>
					<tr>
						<td style="background: #59ab6e;color:white;">창고</td>
						<td style="background: #59ab6e;color:white;">하역도크</td>
						<td style="background: #59ab6e;color:white;">사무실</td>
						<td style="background: #59ab6e;color:white;">메자닌</td>			
						
						<td style="background: #59ab6e;color:white;">입주시기</td>
						<td style="background: #59ab6e;color:white;">계약면적</td>
						<td style="background: #59ab6e;color:white;">임대료/평</td>

						<td style="background: #59ab6e;color:white;">유효고</td>
						<td style="background: #59ab6e;color:white;">접안방식</td>
						<td style="background: #59ab6e;color:white;">도크수</td>
						<td style="background: #59ab6e;color:white;">온도범위</td>			
					<tr>
				</thead>				
				<tbody  align="center">
				<c:forEach var="warelist" items="${listview}" varStatus="status">
					<tr>
						<td>${warelist.whflnm}</td>
						<td style="text-align:right;">
							<fmt:formatNumber value="${warelist.flarea}" pattern="#,###" />&nbsp;m<sup>2</sup>
						</td>
						<td>*데이터없음</td>
						<td>*데이터없음</td>
						<td>*데이터없음</td>
						<td>*데이터없음</td>
						
						<td>문의</td>
						<td>문의</td>
						<td>문의</td>
						
						<td>*데이터없음</td>
						<td>*데이터없음</td>
						<td>*데이터없음</td>
						<td>*데이터없음</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>	
		</div>		
	</div>
    <!-- End Contents -->
    
    <!-- Start Footer -->
  <jsp:include page="inc_footer.jsp" flush="true"/>
    <!-- End Footer -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng("${warehouseVO.kkompx}", "${warehouseVO.kkompy}"), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(<c:out value="${warehouseVO.kkompx}"/>, <c:out value="${warehouseVO.kkompy}"/>); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
    
</body>

</html>