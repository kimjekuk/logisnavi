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
	<script>
	
//	$('input:radio[name=radioValue]:input[value="Y"]').attr("checked", true);


		function fn_formSubmit(){
			
			if ( ! chkInputValue("#searchKeyword", "명칭 또는 주소 일부분 ")) return false;

			if(Number($("#searchExt1").val()) >= Number($("#searchExt2").val())){
				alert("하한선 값을 더 크게 지정하세요");
				return false;
			}
			document.form1.submit();	
		}
		
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="checkRow"]').each(function() {
				this.checked = chk; 
			})	
		}    
		
		function fn_viewmap(){
			$('#map').css("display","block");
			map.relayout();
			setBounds(bounds);
		}		
		function fn_hidemap(){
			$('#map').css("display","none");				
		}	
		
		
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
			          { header : '관리건축물대장PK', name: 'mgmBldrgstPk' ,align:'left', width : 180},
			          { header : '대지위치', name: 'platPlc' ,align:'left', width : 300},
			          { header : '건물명', name: 'bldNm',align:'left' , width : 300},
			          { header : '구분', name: 'archGbCd',align:'center', width : 50},
			          { header : '대지면적(㎡)', name: 'platArea',align:'right', width : 100},
			          { header : '건축면적(㎡)', name: 'archArea',align:'right'  , width : 100},
			          { header : '건폐율(%)', name: 'bcRat',align:'right'  , width : 100},
			          { header : '연면적(㎡)', name: 'totArea',align:'right'  , width : 100},
			          { header : '용적률(%)', name: 'vlRat',align:'right'  , width : 100},
			          { header : '건축허가일', name: 'pmsDay',align:'center'  , width : 80},
			          { header : '사용승인일', name: 'useAprDay',align:'center'  , width : 80},
			          { header : '연면적용적률산정(㎡)', name: 'vlRatEstmTotArea',align:'right'  , width : 100},
			          { header : '생성일자', name: 'crtnDay',align:'center'  , width : 80},
			        ],
			        columnOptions : {
			        	resizable:true
			        }
			        , data : json		        		        
			    });
			
		}			
		
		function fn_formfloorSubmit(){
//			alert('getrowkey~~~');
			var gridrows =Grid.getCheckedRowKeys();
			var rowcnt = gridrows.length
			if(rowcnt == 0){
				alert('체크 선택없음');	
			}
			var arrpkdata = Grid.getColumnValues('mgmBldrgstPk');
			
			var arr = [];
			for(var i=0; i<rowcnt; i++){
				arr.push(arrpkdata[gridrows[i]].toString());
				//alert(arrpkdata[gridrows[i]].toString());
			}
			$('#searchTypeArr').val(arr);
			document.formFloor.target = "_blank";
			document.formFloor.submit();	

		}		
     </script>
</head>

<body>

 <a href="index.html">Home</a><br><br>
 &nbsp;&nbsp;&nbsp;<a href="searchBasis">인허가정보</a>
 &nbsp;&nbsp;&nbsp;<a href="searchBrtitle">건축물대장</a>
 <hr>
   *********** 건축물대장 정보(창고시설) *********** 
 <hr>
    <!-- Start Contact -->
            <form role="form" id="form1" name="form1"  method="post">
               검색어 :   <input type="text" id="searchKeyword" name="searchKeyword" placeholder="명칭 또는 주소 일부분" value='<c:out value="${searchVO.searchKeyword}"/>' >
               <br><br>
               면적범위 : 
               <select id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
	    <!--        <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'}">selected</c:if>> 하한선 없음 </option>   -->
	                <option value="330.58"  <c:if test="${searchVO.searchExt1 eq '330.58'}">selected</c:if>>  100평 </option>
	                <option value="991.74"  <c:if test="${searchVO.searchExt1 eq '991.74'}">selected</c:if>> 300평 </option>
	                <option value="1652.89"  <c:if test="${searchVO.searchExt1 eq '1652.89'}">selected</c:if>> 500평 </option>
	                <option value="3305.79" <c:if test="${searchVO.searchExt1 eq '3305.79'}">selected</c:if>> 1000평 </option>
	                <option value="9917.36" <c:if test="${searchVO.searchExt1 eq '9917.36'}">selected</c:if>> 3000평 </option>
               </select>
               ~
               <select id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
	                <option value="9999999"<c:if test="${searchVO.searchExt2 eq '9999999'}">selected</c:if>>  상한선 없음 </option>
	                <option value="330.58"  <c:if test="${searchVO.searchExt2 eq '330.58'}">selected</c:if>>  100평 </option>
	                <option value="991.74"  <c:if test="${searchVO.searchExt2 eq '991.74'}">selected</c:if>> 300평 </option>
	                <option value="1652.89"  <c:if test="${searchVO.searchExt2 eq '1652.89'}">selected</c:if>> 500평 </option>
	                <option value="3305.79" <c:if test="${searchVO.searchExt2 eq '3305.79'}">selected</c:if>> 1000평 </option>
	                <option value="9917.36" <c:if test="${searchVO.searchExt2 eq '9917.36'}">selected</c:if>> 3000평 </option>
               </select>
               <br><br>
    <!-- 옵션 : 수도권, 비수도권, 다 포함 -->
	    	지역구분 : 
			<input type="radio" value="all_area" name="searchExt4" <c:if test="${searchVO.searchExt4 eq 'all_area'}">checked</c:if>> 전체 
			<input type="radio" value="sudo" name="searchExt4" <c:if test="${searchVO.searchExt4 eq 'sudo'}">checked</c:if>>수도권 
			<input type="radio" value="notsudo" name="searchExt4" <c:if test="${searchVO.searchExt4 eq 'notsudo'}">checked</c:if>>비수도권 
            <br><br>
    <!-- 옵션 : 실제착공일 ~이상 -->
			사용승인일 : 
			<input type="text" id="searchExt3" name="searchExt3" placeholder="사용승인일" value='<c:out value="${searchVO.searchExt3}"/>' > 이후
	        <br><br>
		    <button type="button" onclick="fn_formSubmit()"> 창고 찾기 </button>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    검색결과 : <text type="label" id="gridTotalCount" name="gridTotalCount"></text> 건
			<hr>
			<input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
       </form>
       
       <form id="formFloor" name="formFloor"  method="post" action="searchBrtitleFloor"> 
		    <button type="button" onclick="fn_formfloorSubmit()"> 체크된것 층별정보확인 </button>
			<input type="hidden" id="searchTypeArr" name="searchTypeArr" value='<c:out value="${searchVO.searchTypeArr}"/>' />
       </form>       

    <!-- End Contact -->

    <!-- Start items -->
    <div class="container py-5">
	<!-- start warehouse items -->  
	<!--
	<button type="button"  onclick="fn_viewmap()">지도보기</button>
	<button type="button"  onclick="fn_hidemap()">지도닫기</button>
	<br><br>
	-->
<div id="map" style="width:100%;height:500px;display:none"></div>
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
	        content: '<div style="width:200px; height:100px;"><center><br>${listview.whname}<br><a href="detail?whcode=${listview.whcode}">상세보기</a><br></center></div>', 
	        latlng: new kakao.maps.LatLng(<c:out value="${listview.kkompx}"/>, <c:out value="${listview.kkompy}"/>)
	    });
</c:forEach>		

selectedInfowindow = null;

var bounds = new kakao.maps.LatLngBounds();   
for (var i = 0; i < positions.length; i ++) {
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });    
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });
    bounds.extend(positions[i].latlng);    
    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
}

function makeClickListener(map, marker, infowindow) {
    return function() {
    	if (!selectedInfowindow) {
            infowindow.open(map, marker);  
    	} else {
    		selectedInfowindow.close();
    		infowindow.open(map, marker);  
    	}
        selectedInfowindow = infowindow
    	
    };
}

function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

function setBounds() {
  map.setBounds(bounds);
}
setBounds(bounds);

//function(){
var area_r = $(":input:radio[name=searchExt4]:checked").val();
if(area_r==null){
	$('input:radio[name=searchExt4]:input[value="all_area"]').attr("checked", true);
}

</script>	

	
<br>	
    <div id="grid"></div>
<br>	
   
</body>
</html>