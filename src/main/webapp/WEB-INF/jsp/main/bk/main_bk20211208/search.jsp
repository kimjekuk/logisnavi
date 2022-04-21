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

    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script>
	
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
		
		function fn_getModalinfo(mgbdrgpk){
			$.ajax({
				url: "detailTitle",
				type:"post", 
				data : {mgbdrgpk: mgbdrgpk},
				success : function(result){         
					var titlepartVO = result;
					$('#modal_mgbdrgpk').text(titlepartVO.mgbdrgpk);
					$('#modal_ldxy').text(titlepartVO.ldxy);
					$('#modal_nadbob').text(titlepartVO.nadbob);
					$('#modal_ldar').text(titlepartVO.ldar);
					$('#modal_grossar').text(titlepartVO.grossar);
					$('#modal_dongnm').text(titlepartVO.dongnm);
					$('#modal_star').text(titlepartVO.star);
					$('#modal_cprtesgrossar').text(titlepartVO.cprtesgrossar);
					$('#modal_bdcnt').text(titlepartVO.bdcnt);
					$('#modal_bdrt').text(titlepartVO.bdrt);
					$('#modal_cprt').text(titlepartVO.cprt);
					$('#modal_hosu').text(titlepartVO.hosu);
					$('#modal_mauscdnm').text(titlepartVO.mauscdnm);
					$('#modal_etstruct').text(titlepartVO.etstruct);
					$('#modal_maextdvcd').text(titlepartVO.maextdvcd);
					$('#modal_apday').text(titlepartVO.apday);
					$('#modal_strstday').text(titlepartVO.strstday);
					$('#modal_permday').text(titlepartVO.permday);

					$('#modal_inmsnu').text(titlepartVO.inmsnu);
					$('#modal_otmsnu').text(titlepartVO.otmsnu);
					$('#modal_insfnu').text(titlepartVO.insfnu);
					$('#modal_otsfnu').text(titlepartVO.otsfnu);
					$('#modal_elevcnt').text(titlepartVO.elevcnt);
					$('#modal_liftcnt').text(titlepartVO.liftcnt);
					
					$('#modal_idx').val(titlepartVO)
				},
		        error: function() {
		            alert('Error occured' + mgbdrgpk);
		        }
		   	})
			$('#myModal').modal("show");
		}	
		
		function fn_viewmap(){
			$('#map').css("display","block");
			map.relayout();
			setBounds(bounds);
		}		
		function fn_hidemap(){
			$('#map').css("display","none");				
		}	</script>
	
	<style>
	
	</style>	

</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>
    <!-- Start Contact -->
    <div class="container py-5"  style="border:1px red;">
            <form class="col-md-9 m-auto" role="form" id="form1" name="form1"  method="post">
                <div class="row">
                <div class="form-group col-md-5 mb-3">
<!--                <label for="inputSearch3">명칭 및 위치</label> -->
                    <input type="text" class="form-control mt-2" id="searchKeyword" name="searchKeyword" placeholder="명칭 또는 주소 일부분"  
                    	value='<c:out value="${searchVO.searchKeyword}"/>' >
                </div>
                    <div class="form-group col-md-3 mb-3">
<!--                    <label for="inputSearch2">From</label> -->
	                    <select class="form-control mt-2" id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
		                    <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'}">selected</c:if>> 하한선 없음 </option>
		                    <option value="330.58"  <c:if test="${searchVO.searchExt1 eq '330.58'}">selected</c:if>>  100평 </option>
		                    <option value="991.74"  <c:if test="${searchVO.searchExt1 eq '991.74'}">selected</c:if>> 300평 </option>
		                    <option value="1652.89"  <c:if test="${searchVO.searchExt1 eq '1652.89'}">selected</c:if>> 500평 </option>
		                    <option value="3305.79" <c:if test="${searchVO.searchExt1 eq '3305.79'}">selected</c:if>> 1000평 </option>
		                    <option value="9917.36" <c:if test="${searchVO.searchExt1 eq '9917.36'}">selected</c:if>> 3000평 </option>
	                    </select>

<!--                    <label for="inputSearch3">To</label> -->
	                    <select class="form-control mt-2" id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
		                    <option value="9999999"<c:if test="${searchVO.searchExt2 eq '9999999'}">selected</c:if>>  상한선 없음 </option>
		                    <option value="330.58"  <c:if test="${searchVO.searchExt2 eq '330.58'}">selected</c:if>>  100평 </option>
		                    <option value="991.74"  <c:if test="${searchVO.searchExt2 eq '991.74'}">selected</c:if>> 300평 </option>
		                    <option value="1652.89"  <c:if test="${searchVO.searchExt2 eq '1652.89'}">selected</c:if>> 500평 </option>
		                    <option value="3305.79" <c:if test="${searchVO.searchExt2 eq '3305.79'}">selected</c:if>> 1000평 </option>
		                    <option value="9917.36" <c:if test="${searchVO.searchExt2 eq '9917.36'}">selected</c:if>> 3000평 </option>
	                    </select>
                    </div>
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onclick="fn_formSubmit()">창고 찾기</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;${fn:length(listview)} : 개층
                    </div>
                </div>
            </form>
    </div>
    <!-- End Contact -->

    <!-- Start items -->
    <div class="container py-5">
	<!-- start warehouse items -->  
	
	<button type="button"  onclick="fn_viewmap()">지도보기</button>
	<button type="button"  onclick="fn_hidemap()">지도닫기</button>
	<br><br>

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

</script>	
	
	   
<c:set var="whcode_temp" value="" />
<c:forEach var="warelist" items="${listview}" varStatus="status">
<c:if test="${whcode_temp ne warelist.whcode}">
		<div>
			<table class="table_type03" width=100% style="font-size:15px">
				<tbody>
					<tr>
					<td colspan="4" style="color: #59ab6e; font-weight:bold; font-size:18px">관리 번호 : <c:out value="${warelist.whcode}"/>
						&nbsp;&nbsp;&nbsp;
						<a href="detail?whcode=<c:out value="${warelist.whcode}"/>">상세보기</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 건축물관리 대장번호 : 
						<a href="javascript:fn_getModalinfo('${warelist.mgbdrgpk}');"><c:out value="${warelist.mgbdrgpk}"/></a>
					</td>
					</tr>
					<tr>
						<td style="width: 138px; align: center" rowspan="5">
						<center><img src="${warelist.img001}" height="220" width="300"></center>
						</td>
						<td style="width: 70px; text-align: center;">창고명</td>
						<td style="width: 280px; text-align: center;"><c:out value="${warelist.whname}"/></td>
						<td style="width: 400px; text-align: left;" rowspan="5">
						상세 정보
						<br><br>
						교통 : OOO 고속도로 ~~IC 00km
						</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center;">위치</td>
						<td style="width: 280px; text-align: center;"><c:out value="${warelist.mpadrs}"/></td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center;">연면적</td>
						<td id="szarea" style="width: 280px; text-align: center;"><fmt:formatNumber value="${warelist.szarea}" pattern="#,###" />&nbsp;m<sup>2</sup></td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center;">규모</td>
						<td style="width: 280px; text-align: center;"><c:out value="${warelist.ifsize}"/></td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center;">준공일</td>
						<td style="width: 280px; text-align: center;"><c:out value="${warelist.prusdy}"/></td>
					</tr>
				</tbody>
			</table>
	<!-- end warehouse items -->       
	<!-- start floor items -->       
			<table class="table_type11" align="center" width=100% style="font-size:15px">
			<thead align="center">
				<tr>
					<th>선택</th>
					<th>층</th>
					<th>면적</th>
					<th>용도</th>
					<th>임대료(월/평)</th>
					<th>평단가</th>
					<th>입주시기</th>
					<th>도면</th>
<!--  				<th>즐겨찾기</th> -->
				</tr>
			</thead>
			<tbody  align="center">
</c:if>			
			<tr>
				<td>
					<input id='floor-45341-01704395' type='checkbox'>
				</td>
				<td>
					<a href="#"><c:out value="${warelist.whflnm}"/></a>
				</td>
				<td style="text-align:right">
					<fmt:formatNumber value="${warelist.flarea}" pattern="#,###" />&nbsp;m<sup>2</sup> 
					<!-- <fmt:formatNumber value="${Math.round(warelist.flarea *  0.3025)}" pattern="#,###" />평 -->
				</td>
				<td>
					<c:out value="${warelist.usetyp}"/>
				</td>
				<td>
					<c:out value="${warelist.flmpay}"/>
				</td>
				<td>
					<c:out value="${warelist.pprice}"/>
				</td>
				<td>
					<c:out value="${warelist.lsfrom}"/>
				</td>
				<td>
					<img alt="도면" data-src="https://image.cbre-propertysearch.jp/img/photo/0002/113119086002_0_ZA_01_00.jpg" />
				</td>
<!--				
				<td>
					<i>grade</i>
				</td>
-->				
			</tr>			
<c:set var="whcode_temp" value="${warelist.whcode}" />	
<c:set var="whcode_next" value="${listview[status.index + 1].whcode}"/> 	
<c:if test="${whcode_temp ne whcode_next}">
			</div>        
			</tbody>	
		</table>
	</div>
		<br>
</c:if>	

</c:forEach>			
	<!-- end floor items -->              
</div>        
    <!--End items-->
   <br><br>
   

 <!-- modal 화면 start -->
    <div id="myModal" style="display: none;text-align:center;" class="modal fade bs-example-modal-xl" role="dialog" tabindex="-1" aria-labelledby="myLargeModalLabel">
    	<div class="modal-dialog modal-xl" role="document" style="background-color: white;text-align:center;border: 1px solid green"> 
    		<br>
	        	[ 건축물관리 대장 ]
	        <p id="modal_mgbdrgpk"></p>
        	<center>
			<br>기본정보<br>
			<table  width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">대지위치</td>
						<td colspan="3" style="border: 1px solid grey;width: 70px; text-align: center;font-size:5px"><h1 id="modal_ldxy" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">지번</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_nadbob" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">대지면적</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_ldar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">연면적</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_grossar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">명칭 및 번호</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_dongnm" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">건축면적</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_star" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">용적율 산정용 연면적</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_cprtesgrossar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">건축물수</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_bdcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">건폐율</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_bdrt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">용적율</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_cprt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">총호수</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_hosu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">주용도</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_mauscdnm" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">주구조</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_etstruct" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">부속건축물</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_maextdvcd" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">허가일자</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_apday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">착공일자</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_strstday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">사용승인일자</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_permday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
				</tbody>
			</table>
			<br>용도<br>
			<table width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">용도지역</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">용도지구</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">구역</td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center;">용도지역 값X</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;">용도지구 값X</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;">구역 값X</td>
					</tr>
				</tbody>
			</table>
			<br>주차장<br>
			<table width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">옥내기계식</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_inmsnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">옥내자주식</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_insfnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">옥외기계식</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_otmsnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">옥외자주식</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_otsfnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
				</tbody>
			</table>
			<br>승강기<br>
			<table width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;font-size:15px;">승용</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;font-size:15px;"><h1 id="modal_elevcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;font-size:15px; background: #FAFAFA;">비상용</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;font-size:15px;"><h1 id="modal_liftcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
				</tbody>
			</table>
			<br>
			</center>
        	<center><button type="button" class="btn btn-primary" onclick="fn_hideModal()">닫기</button></center>
			<br>
		</div>			
    </div>
<!-- modal 화면 end -->
   
<jsp:include page="inc_footer.jsp" flush="true"/>
</body>
</html>