<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="ko">
  <head>
    <title>IamLogis</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>	  
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://use.fontawesome.com/926fe18a63.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js" integrity="sha512-Y2IiVZeaBwXG1wSV7f13plqlmFOx8MdjuHyYFVoYzhyRr3nH/NMDjTBSswijzADdNzMyWNetbLMfOpIPl6Cv9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>      
	  <script>
		
			function fn_formSubmit(){
				if ( $("#searchKeyword").val() == ''){	alert("주소 일부분을 입력하세요");	return false; }
				document.form1.submit();	
			}
	  </script>	
	  
	  <style>
	    	div {  border: solid red 0px; } 
	    	span { font-size:15px;text-decoration:none;}
	    	label {font-size:12px;font-weight:none;margin-top:10px; margin-bottom: 0;color:#696969}
			table td {
			  vertical-align: middle !important;white-space: nowrap;font-size:14px; border:none;
			}    	
	 </style>	
</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>
<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>지도검색</strong></h5>
    <form role="form" id="form1" name="form1"  method="post">
	  <div class="row">
	        <div class="col-md-12">
				<div class="card ml-3 mr-3">
		 		 	<div class="card-body">
						<div class="row">
							<div class="col-md-4">
								<label>주소</label> 
			                    <input type="text" 
			                    	class="form-control form-control-sm" id="searchKeyword" name="searchKeyword" placeholder="주소 일부분" 
			                    	value='<c:out value="${searchVO.searchKeyword}"/>' >
							</div>
							<div class="col-md-4 d-flex justify-content-center mt-5">
				                <button class="btn btn-sm btn-primary" type="button"  onclick="fn_formSubmit()"><span id="str_button"><strong>검색하기</strong></span></button>
							</div>
							<div class="col-md-4" style="text-align:right">
								
							</div>							
			            </div>	
					</div>
				</div>
			</div>
		</div>
     </form>
     <br>
	<div class="row">
		<div class="col-sm-10"></div>
		<div class="col-sm-2">
			 <span id="countWlist"  style="text-align:right;color:blue;font-size:14px;">검색결과 : ${fn:length(listview)} 건</span>
	 	</div>
	</div>	 
	 <c:if test="${fn:length(listview) > 0}">
		<div class="row" >
	 		 	<div class="col-md-7 pt-2" style="border: solid #DBD8E5 1px;">
					<div id="map" style="width:100%;height:600px;"></div>		
				</div>
	 		 	<div class="col-md-5 pt-2 pl-3" style="border: solid #DBD8E5 1px;overflow-y: scroll; height:620px;">
						<c:set var="whcode_temp" value="" />
						<c:forEach var="warelist" items="${listview}" varStatus="status">
							<c:if test="${whcode_temp ne warelist.whcode}">
							<div id="${warelist.whcode}" name="${warelist.whcode}">	
								<table id="tables" class="table table-bordered  table-sm" style="border:none;cellspacing:0;width:90%;text-align:left;" >
									<tbody style="border:none;">
										<tr style="background-color:white;font-size:14px;font-weight:bold;border:none;color:grey">
											<td style="border:none;width: 150px;">
												<a style="color:black"  href="javascript:mapViewInfoW('${status.count}','${warelist.kkompx}', '${warelist.kkompy}', '${warelist.whname}', '${warelist.img001}', '${warelist.mpadrs}', '${warelist.whcode}');">									
													<span style="color:red;font-size:18px;font-weight:bold">${status.count}.</span> 창고번호: ${warelist.whcode}
												</a>
											</td>
											<td style="border:none;width: 150px; text-align: left;font-size:14px;">
												 <a style="color:#5600E0"   href="detail?whcode=<c:out value="${warelist.whcode}"/>">
													${warelist.whname}  
												</a>
											</td>
										</tr>
										<tr style="font-size:14px;border:none;">
											<td style="border:none;width: 150px;">
									            <a href="${warelist.img001}" data-toggle="lightbox" class="col-bg-3" data-title="<label>창고번호 : ${warelist.whcode}</label>" data-footer="<label>${warelist.mpadrs}</label>"> 
									                <img class="rounded" src="${warelist.img001}" height="100px" width="150px">
									            </a>
											</td>
											<td style="border:none;width: 150px; text-align: left;font-size:12px;">
												${warelist.mpadrs} <br>
												면적 : <fmt:formatNumber value="${warelist.szarea}" pattern="#,###" />&nbsp;평 <br>
												규모 : ${warelist.ifsize}<br>
												준공일 : ${warelist.prusdy}<br>
												인근IC : <br> ${warelist.mpicif}
												
											</td>
										</tr>								
										</tbody>
				 					</table>
				 					<hr>
								</div>															
							</c:if>			
						<c:set var="whcode_temp" value="${warelist.whcode}" />								
						</c:forEach>			
				</div>
 	   </div>      
	  </c:if>		
	</div>
	<!-- end floor items -->              

    <!--End items-->
   <br><br>
   

   
<jsp:include page="inc_footer.jsp" flush="true"/>
<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox();
	});
</script>
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
		        level: 5 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//			map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);  //지도종류변경
		var positions = [];
		<c:forEach var="listview" items="${listview}" varStatus="status">
			positions.push(
			    {
			        content: '<div style="width:300px;height:250px;font-size:12px;text-align:center"><br><span style="font-size:14px;font-weight:bold"><span style="color:red;font-size:18px;font-weight:bold">${status.count}.</span> ${listview.whname}</span><hr><img src=${listview.img001} height="100px" width="150px"><hr>${listview.mpadrs}<br><a href="detail?whcode=${listview.whcode}">상세보기</a><br></div>', 
			        latlng: new kakao.maps.LatLng(<c:out value="${listview.kkompx}"/>, <c:out value="${listview.kkompy}"/>),
			        vkkompx : "${listview.kkompx}",
					vkkompy : "${listview.kkompy}",
					vwhcode : "${listview.whcode}"
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
		        content: positions[i].content,  // 인포윈도우에 표시할 내용
		        removable : true
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
		  var level = map.getLevel();
		  if(level < 7){
			  map.setLevel(7);
		  }
		}
		
		//중심점 이동 및 infowindow 표시
		function mapViewInfoW(cnt, x, y, wname, img, addrs, wcode) {
		    var moveLatLon = new kakao.maps.LatLng(x, y);
		    map.setCenter(moveLatLon);
		    
 		    var marker = new kakao.maps.Marker({
 		        map: map, 
 		        position: moveLatLon 
		    });    

 		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:300px;height:250px;font-size:12px;text-align:center"><br><span style="font-size:14px;font-weight:bold"><span style="color:red;font-size:18px;font-weight:bold">'+ cnt +'. </span>'+ wname+'</span><hr><img src=' + img +' height="100px" width="150px"><hr>'+ addrs + '<br><a href="detail?whcode=' + wcode + '">상세보기</a><br></div>',  // 인포윈도우에 표시할 내용
		        removable : true
		    });
		    
 	    	if (!selectedInfowindow) {
 	            infowindow.open(map, marker);  
 	    	} else {
 	    		selectedInfowindow.close();
 	    		infowindow.open(map, marker);  
 	    	}
 	        selectedInfowindow = infowindow
		}
		
		setBounds(bounds);
		
		//중심 좌표나 확대 수준이 변경되면 발생한다.단, 애니메이션 도중에는 발생하지 않는다.
		kakao.maps.event.addListener(map, 'idle', function() {
			var neLat = this.getBounds().getNorthEast().getLat(); 
			var neLng = this.getBounds().getNorthEast().getLng(); 
			var swLat = this.getBounds().getSouthWest().getLat(); 
			var swLng = this.getBounds().getSouthWest().getLng();
			
			var j = 0
 			for (var i = 0; i < positions.length; i ++) {
// 				swLat ~ neLat
// 				swLng ~ neLng
 				if(
 					((positions[i].vkkompx >= swLat) && (positions[i].vkkompx <= neLat))&&((positions[i].vkkompy >= swLng) && (positions[i].vkkompy <= neLng))
 				  ){
 					$('#'+ positions[i].vwhcode).show();
 					j = j+1;
  				   }else{
  					$('#'+ positions[i].vwhcode).hide();
    			  }
 				$("#countWlist").html("검색결과 : " + j + " 건");
			}
		});
		
//---------------------------------------------------폴리곤테스트----------------------------------------------------------//		
		// 다각형을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 다각형을 표시합니다
		var polygonPath = [
			new kakao.maps.LatLng(37.5804683,127.0086433  ),                                   
		    new kakao.maps.LatLng(37.5810569,127.0083272  ),                                   
		    new kakao.maps.LatLng(37.5823364,127.0067531  ),                                   
		    new kakao.maps.LatLng(37.5833331,127.0072708  ),                                   
		    new kakao.maps.LatLng(37.5847035,127.0068893  ),                                   
		    new kakao.maps.LatLng(37.5852806,127.0069016  ),                                   
		    new kakao.maps.LatLng(37.5855459,127.0065509  ),                                   
		    new kakao.maps.LatLng(37.586125 ,127.0066261  ),                                   
		    new kakao.maps.LatLng(37.586972 ,127.0058663  ),                                   
		    new kakao.maps.LatLng(37.5871766,127.0042516  ),                                   
		    new kakao.maps.LatLng(37.5877337,127.0040809  ),                                   
		    new kakao.maps.LatLng(37.5877475,127.0038916  ),                                   
		    new kakao.maps.LatLng(37.5879446,127.0039881  ),                                   
		    new kakao.maps.LatLng(37.5881453,127.0035173  ),                                   
		    new kakao.maps.LatLng(37.5885691,127.0033935  ),                                   
		    new kakao.maps.LatLng(37.5891722,127.0022167  ),                                   
		    new kakao.maps.LatLng(37.5896844,127.0020058  ),                                   
		    new kakao.maps.LatLng(37.5901492,127.0014685  ),                                   
		    new kakao.maps.LatLng(37.5905513,127.0014632  ),                                   
		    new kakao.maps.LatLng(37.5910186,127.0017831  ),                                   
		    new kakao.maps.LatLng(37.5913523,127.0017323  ),                                   
		    new kakao.maps.LatLng(37.5923009,127.0009533  ),                                   
		    new kakao.maps.LatLng(37.5922293,126.9994524  ),                                   
		    new kakao.maps.LatLng(37.5924712,126.9984687  ),                                   
		    new kakao.maps.LatLng(37.5921014,126.9964138  ),                                   
		    new kakao.maps.LatLng(37.5922799,126.9953618  ),                                   
		    new kakao.maps.LatLng(37.5914548,126.9943144  ),                                   
		    new kakao.maps.LatLng(37.5914478,126.9938245  ),                                   
		    new kakao.maps.LatLng(37.5917307,126.993564   ),                                   
		    new kakao.maps.LatLng(37.5919947,126.9921598  ),                                   
		    new kakao.maps.LatLng(37.591409 ,126.9914322  ),                                   
		    new kakao.maps.LatLng(37.5915301,126.9909701  ),                                   
		    new kakao.maps.LatLng(37.5914691,126.9898672  ),                                   
		    new kakao.maps.LatLng(37.5912573,126.989222   ),                                   
		    new kakao.maps.LatLng(37.5919414,126.9885171  ),                                   
		    new kakao.maps.LatLng(37.592255 ,126.987755   ),                                   
		    new kakao.maps.LatLng(37.5927181,126.9871727  ),                                   
		    new kakao.maps.LatLng(37.5927496,126.9866982  ),                                   
		    new kakao.maps.LatLng(37.594255 ,126.9857789  ),                                   
		    new kakao.maps.LatLng(37.5944495,126.9854295  ),                                   
		    new kakao.maps.LatLng(37.5944354,126.9838441  ),                                   
		    new kakao.maps.LatLng(37.5946846,126.983467  ),                                   
		    new kakao.maps.LatLng(37.594776 ,126.9829206  ),                                   
		    new kakao.maps.LatLng(37.5951966,126.9824808  ),                                   
		    new kakao.maps.LatLng(37.5953358,126.9814882  ),                                   
		    new kakao.maps.LatLng(37.5958388,126.9809104  ),                                   
		    new kakao.maps.LatLng(37.5959533,126.9802614  ),                                   
		    new kakao.maps.LatLng(37.5966349,126.9787402  ),                                   
		    new kakao.maps.LatLng(37.5967858,126.9785719  ),                                   
		    new kakao.maps.LatLng(37.5972521,126.978571   ),                                   
		    new kakao.maps.LatLng(37.5976839,126.9779536  ),                                   
		    new kakao.maps.LatLng(37.5977163,126.9769052  ),                                   
		    new kakao.maps.LatLng(37.597906 ,126.9767187  ),                                   
		    new kakao.maps.LatLng(37.5991008,126.9774147  ),                                   
		    new kakao.maps.LatLng(37.6002299,126.9776828  ),                                   
		    new kakao.maps.LatLng(37.6003069,126.9779354  ),                                   
		    new kakao.maps.LatLng(37.6010002,126.9785021  ),                                   
		    new kakao.maps.LatLng(37.6010408,126.9792081  ),                                   
		    new kakao.maps.LatLng(37.6022577,126.9825659  ),                                   
		    new kakao.maps.LatLng(37.602144 ,126.9828473  ),                                   
		    new kakao.maps.LatLng(37.6032077,126.9839816  ),                                   
		    new kakao.maps.LatLng(37.6031207,126.9843411  ),                                   
		    new kakao.maps.LatLng(37.6033719,126.9847382  ),                                   
		    new kakao.maps.LatLng(37.6034517,126.9857568  ),                                   
		    new kakao.maps.LatLng(37.6040169,126.9866662  ),                                   
		    new kakao.maps.LatLng(37.6045105,126.9867871  ),                                   
		    new kakao.maps.LatLng(37.6060872,126.9867553  ),                                   
		    new kakao.maps.LatLng(37.6065084,126.986309   ),                                   
		    new kakao.maps.LatLng(37.6068634,126.9863742  ),                                   
		    new kakao.maps.LatLng(37.6073911,126.986112   ),                                   
		    new kakao.maps.LatLng(37.6082775,126.9867031  ),                                   
		    new kakao.maps.LatLng(37.6088696,126.9868341  ),                                   
		    new kakao.maps.LatLng(37.6094636,126.9858725  ),                                   
		    new kakao.maps.LatLng(37.6113792,126.9856479  ),                                   
		    new kakao.maps.LatLng(37.6132235,126.9861383  ),                                   
		    new kakao.maps.LatLng(37.613979 ,126.9865844  ),                                   
		    new kakao.maps.LatLng(37.6159989,126.9845431  ),                                   
		    new kakao.maps.LatLng(37.6168731,126.9843992  ),                                   
		    new kakao.maps.LatLng(37.6177697,126.983723  ),                                   
		    new kakao.maps.LatLng(37.6192526,126.9831635  ),                                   
		    new kakao.maps.LatLng(37.6201986,126.9831748  ),                                   
		    new kakao.maps.LatLng(37.6211473,126.9836482  ),                                   
		    new kakao.maps.LatLng(37.6243232,126.9818302  ),                                   
		    new kakao.maps.LatLng(37.6253902,126.9809086  ),                                   
		    new kakao.maps.LatLng(37.6263751,126.9796035  ),                                   
		    new kakao.maps.LatLng(37.6274518,126.9798678  ),                                   
		    new kakao.maps.LatLng(37.6279283,126.980186   ),                                   
		    new kakao.maps.LatLng(37.6285612,126.97993    ),                                   
		    new kakao.maps.LatLng(37.6288877,126.9795371  ),                                   
		    new kakao.maps.LatLng(37.6292892,126.9784187  ),                                   
		    new kakao.maps.LatLng(37.6289996,126.9749567  ),                                   
		    new kakao.maps.LatLng(37.6298051,126.9746709  ),                                   
		    new kakao.maps.LatLng(37.6317331,126.9753884  ),                                   
		    new kakao.maps.LatLng(37.6320311,126.9736721  ),                                   
		    new kakao.maps.LatLng(37.6323748,126.9730298  ),                                   
		    new kakao.maps.LatLng(37.6316187,126.9713276  ),                                   
		    new kakao.maps.LatLng(37.6307301,126.9682355  ),                                   
		    new kakao.maps.LatLng(37.630768 ,126.9652285  ),                                   
		    new kakao.maps.LatLng(37.6303601,126.9643314  ),                                   
		    new kakao.maps.LatLng(37.6297931,126.9637672  ),                                   
		    new kakao.maps.LatLng(37.6299593,126.9614397  ),                                   
		    new kakao.maps.LatLng(37.6295893,126.958814  ),                                   
		    new kakao.maps.LatLng(37.6291307,126.9574667  ),                                   
		    new kakao.maps.LatLng(37.6282197,126.9563792  ),                                   
		    new kakao.maps.LatLng(37.6281514,126.9552051  ),                                   
		    new kakao.maps.LatLng(37.6273595,126.9540349  ),                                   
		    new kakao.maps.LatLng(37.627368 ,126.9534928  ),                                   
		    new kakao.maps.LatLng(37.6268676,126.9519801  ),                                   
		    new kakao.maps.LatLng(37.6265558,126.9515792  ),                                   
		    new kakao.maps.LatLng(37.6264196,126.9504127  ),                                   
		    new kakao.maps.LatLng(37.6243351,126.9490024  ),                                   
		    new kakao.maps.LatLng(37.6232624,126.9488986  ),                                   
		    new kakao.maps.LatLng(37.6209219,126.9499025  ),                                   
		    new kakao.maps.LatLng(37.6187655,126.9498362  ),                                   
		    new kakao.maps.LatLng(37.6155291,126.9507042  ),                                   
		    new kakao.maps.LatLng(37.6151213,126.950565  ),                                   
		    new kakao.maps.LatLng(37.6135171,126.9507123  ),                                   
		    new kakao.maps.LatLng(37.6116556,126.9498103  ),                                   
		    new kakao.maps.LatLng(37.6105817,126.9503816  ),                                   
		    new kakao.maps.LatLng(37.6091086,126.9503301  ),                                   
		    new kakao.maps.LatLng(37.608866 ,126.950542  ),                                   
		    new kakao.maps.LatLng(37.6083606,126.9505963  ),                                   
		    new kakao.maps.LatLng(37.6080152,126.9514479  ),                                   
		    new kakao.maps.LatLng(37.6073852,126.951744  ),                                   
		    new kakao.maps.LatLng(37.6066569,126.9525863  ),                                   
		    new kakao.maps.LatLng(37.6059136,126.9527101  ),                                   
		    new kakao.maps.LatLng(37.605503 ,126.9530963  ),                                   
		    new kakao.maps.LatLng(37.6050729,126.9540606  ),                                   
		    new kakao.maps.LatLng(37.6044795,126.9535669  ),                                   
		    new kakao.maps.LatLng(37.6036628,126.9532755  ),                                   
		    new kakao.maps.LatLng(37.6027132,126.9526699  ),                                   
		    new kakao.maps.LatLng(37.602476 ,126.9523754  ),                                   
		    new kakao.maps.LatLng(37.601229 ,126.9525971  ),                                   
		    new kakao.maps.LatLng(37.6001685,126.953362  ),                                   
		    new kakao.maps.LatLng(37.5995313,126.9533806  ),                                   
		    new kakao.maps.LatLng(37.5989357,126.9530114  ),                                   
		    new kakao.maps.LatLng(37.5985953,126.9532377  ),                                   
		    new kakao.maps.LatLng(37.5985788,126.9535088  ),                                   
		    new kakao.maps.LatLng(37.5986733,126.9538412  ),                                   
		    new kakao.maps.LatLng(37.5990983,126.9541414  ),                                   
		    new kakao.maps.LatLng(37.5993095,126.9548812  ),                                   
		    new kakao.maps.LatLng(37.5992739,126.9554115  ),                                   
		    new kakao.maps.LatLng(37.5988689,126.9565988  ),                                   
		    new kakao.maps.LatLng(37.5985753,126.9567471  ),                                   
		    new kakao.maps.LatLng(37.5985311,126.9573081  ),                                   
		    new kakao.maps.LatLng(37.598156 ,126.9580421  ),                                   
		    new kakao.maps.LatLng(37.5963793,126.958707  ),                                   
		    new kakao.maps.LatLng(37.5958629,126.9586453  ),                                   
		    new kakao.maps.LatLng(37.5950345,126.9590513  ),                                   
		    new kakao.maps.LatLng(37.5947887,126.9590339  ),                                   
		    new kakao.maps.LatLng(37.5941834,126.9585409  ),                                   
		    new kakao.maps.LatLng(37.593529 ,126.957517  ),                                   
		    new kakao.maps.LatLng(37.593061 ,126.957512  ),                                   
		    new kakao.maps.LatLng(37.5925653,126.9578104  ),                                   
		    new kakao.maps.LatLng(37.5914602,126.9578195  ),                                   
		    new kakao.maps.LatLng(37.5887222,126.9573267  ),                                   
		    new kakao.maps.LatLng(37.5879538,126.9574641  ),                                   
		    new kakao.maps.LatLng(37.5869703,126.9573742  ),                                   
		    new kakao.maps.LatLng(37.5860249,126.957464  ),                                   
		    new kakao.maps.LatLng(37.5844309,126.9579859  ),                                   
		    new kakao.maps.LatLng(37.5823027,126.9575498  ),                                   
		    new kakao.maps.LatLng(37.5809847,126.9581734  ),                                   
		    new kakao.maps.LatLng(37.5807355,126.9580315  ),                                   
		    new kakao.maps.LatLng(37.5803514,126.9572239  ),                                   
		    new kakao.maps.LatLng(37.5798192,126.9572021  ),                                   
		    new kakao.maps.LatLng(37.5796844,126.9556781  ),                                   
		    new kakao.maps.LatLng(37.5792962,126.9551068  ),                                   
		    new kakao.maps.LatLng(37.5787487,126.9535585  ),                                   
		    new kakao.maps.LatLng(37.5765449,126.9554494  ),                                   
		    new kakao.maps.LatLng(37.5765948,126.955634  ),                                   
		    new kakao.maps.LatLng(37.5756851,126.9563702  ),                                   
		    new kakao.maps.LatLng(37.5740984,126.9583378  ),                                   
		    new kakao.maps.LatLng(37.56582  ,126.9666982  ),                                   
		    new kakao.maps.LatLng(37.5682477,126.9690987  ),                                   
		    new kakao.maps.LatLng(37.568134 ,126.9692745  ),                                   
		    new kakao.maps.LatLng(37.5682765,126.9694243  ),                                   
		    new kakao.maps.LatLng(37.5681571,126.9695071  ),                                   
		    new kakao.maps.LatLng(37.5688192,126.9711755  ),                                   
		    new kakao.maps.LatLng(37.5687104,126.9715125  ),                                   
		    new kakao.maps.LatLng(37.5684097,126.9716622  ),                                   
		    new kakao.maps.LatLng(37.5684747,126.972552  ),                                   
		    new kakao.maps.LatLng(37.5688311,126.9724187  ),                                   
		    new kakao.maps.LatLng(37.56906  ,126.9725914  ),                                   
		    new kakao.maps.LatLng(37.5689985,126.9728071  ),                                   
		    new kakao.maps.LatLng(37.5691927,126.9728793  ),                                   
		    new kakao.maps.LatLng(37.5691652,126.9731916  ),                                   
		    new kakao.maps.LatLng(37.5693189,126.9732052  ),                                   
		    new kakao.maps.LatLng(37.5693403,126.9742045  ),                                   
		    new kakao.maps.LatLng(37.5692013,126.9747067  ),                                   
		    new kakao.maps.LatLng(37.5694844,126.9763753  ),                                   
		    new kakao.maps.LatLng(37.5692369,126.9764449  ),                                   
		    new kakao.maps.LatLng(37.5693126,126.9775796  ),                                   
		    new kakao.maps.LatLng(37.5689894,126.9805643  ),                                   
		    new kakao.maps.LatLng(37.5690094,126.9826838  ),                                   
		    new kakao.maps.LatLng(37.5682323,126.9866392  ),                                   
		    new kakao.maps.LatLng(37.5681361,126.990151  ),                                   
		    new kakao.maps.LatLng(37.5688408,126.9979583  ),                                   
		    new kakao.maps.LatLng(37.5696157,127.0022577  ),                                   
		    new kakao.maps.LatLng(37.5697615,127.0158796  ),                                   
		    new kakao.maps.LatLng(37.5700849,127.017365  ),                                   
		    new kakao.maps.LatLng(37.5710278,127.0190535  ),                                   
		    new kakao.maps.LatLng(37.5717157,127.0207547  ),                                   
		    new kakao.maps.LatLng(37.5720221,127.0222051  ),                                   
		    new kakao.maps.LatLng(37.5719143,127.0233653  ),                                   
		    new kakao.maps.LatLng(37.5780211,127.0231387  ),                                   
		    new kakao.maps.LatLng(37.5778254,127.0228899  ),                                   
		    new kakao.maps.LatLng(37.5780843,127.0225301  ),                                   
		    new kakao.maps.LatLng(37.5783348,127.0227573  ),                                   
		    new kakao.maps.LatLng(37.5786285,127.0223268  ),                                   
		    new kakao.maps.LatLng(37.5788713,127.0217927  ),                                   
		    new kakao.maps.LatLng(37.5788551,127.0214058  ),                                   
		    new kakao.maps.LatLng(37.5780803,127.0193713  ),                                   
		    new kakao.maps.LatLng(37.5779079,127.0195018  ),                                   
		    new kakao.maps.LatLng(37.5775181,127.0187724  ),                                   
		    new kakao.maps.LatLng(37.5776707,127.018418  ),                                   
		    new kakao.maps.LatLng(37.5775784,127.0181073  ),                                   
		    new kakao.maps.LatLng(37.5781388,127.0176948  ),                                   
		    new kakao.maps.LatLng(37.5786151,127.0181523  ),                                   
		    new kakao.maps.LatLng(37.579029 ,127.0182796  ),                                   
		    new kakao.maps.LatLng(37.5795159,127.0179723  ),                                   
		    new kakao.maps.LatLng(37.5797192,127.0175775  ),                                   
		    new kakao.maps.LatLng(37.5805526,127.0172773  ),                                   
		    new kakao.maps.LatLng(37.5808768,127.0168684  ),                                   
		    new kakao.maps.LatLng(37.5817142,127.0166834  ),                                   
		    new kakao.maps.LatLng(37.5819358,127.0163577  ),                                   
		    new kakao.maps.LatLng(37.5818207,127.0153742  ),                                   
		    new kakao.maps.LatLng(37.5823296,127.0148107  ),                                   
		    new kakao.maps.LatLng(37.5820774,127.0142212  ),                                   
		    new kakao.maps.LatLng(37.5817961,127.0140816  ),                                   
		    new kakao.maps.LatLng(37.5814203,127.0131953  ),                                   
		    new kakao.maps.LatLng(37.5813595,127.0128534  ),                                   
		    new kakao.maps.LatLng(37.5815604,127.0117609  ),                                   
		    new kakao.maps.LatLng(37.5810441,127.0111145  ),                                   
		    new kakao.maps.LatLng(37.5802538,127.0105911  ),                                   
		    new kakao.maps.LatLng(37.5804683,127.0086433  )
		];

		// 지도에 표시할 다각형을 생성합니다
		var polygon = new kakao.maps.Polygon({
		    path:polygonPath, // 그려질 다각형의 좌표 배열입니다
		    strokeWeight: 3, // 선의 두께입니다
		    strokeColor: '#39DE2A', // 선의 색깔입니다
		    strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'longdash', // 선의 스타일입니다
		    fillColor: '#A2FF99', // 채우기 색깔입니다
		    fillOpacity: 0.7 // 채우기 불투명도 입니다
		});

		// 지도에 다각형을 표시합니다
	//	polygon.setMap(map);		
		
</script>
</body>
</html>