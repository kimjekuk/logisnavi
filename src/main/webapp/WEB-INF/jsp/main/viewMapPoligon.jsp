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
	  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
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
	 
	<script>
		(function(){
			var map ="";
				
			var kkoMap = {				
				initKko : function(data){
					areaId = data.mapId;
					option = data.option;
					
					mapContainer = document.getElementById(areaId); // 지도를 표시할 div 
					mapOption = $.extend({
						center: new kakao.maps.LatLng(35.967509, 126.980663)
						,level : 13
					},option);

					map = new kakao.maps.Map(mapContainer, mapOption),
					customOverlay = new kakao.maps.CustomOverlay({}),
					infowindow = new kakao.maps.InfoWindow({removable: true});
					
					$.getJSON("js/sidoAll.json",function(jData){
					$jData = $(jData.features);
						$jData.each(function(){
							kkoMap.getPolycode($(this)[0],)
							;
						});
					});
				}
				,getPolycode : function(Feature){
					var geometry = Feature.geometry
					var polygonBox = [];						
					var polygon=[];
					var MultiPolygon=[];
					
					
					if("Polygon" == geometry.type){
						var coordinate = geometry.coordinates[0];
						polygonArr = {"name":Feature.properties.loc_nm, "path":[]}
						
						for(var c in coordinate){						
							polygonArr.path.push(new kakao.maps.LatLng(coordinate[c][1], coordinate[c][0]));
						}
						
						kkoMap.setPolygon(polygonArr)
					}else if("MultiPolygon" == geometry.type){
						arrP = []
						for(var c in geometry.coordinates){
							var multiCoordinates = geometry.coordinates[c];
							polygonArr = {"name":Feature.properties.loc_nm, "path":[]}
							
							for(var z in multiCoordinates[0]){
								polygonArr.path.push(new kakao.maps.LatLng(multiCoordinates[0][z][1], multiCoordinates[0][z][0]));
								
							}
							kkoMap.setPolygon(polygonArr)
						}
						
					}
				
				}
				,setPolygon : function(data,option){
																	
					polygonOption = $.extend({
						strokeWeight: 2,
						strokeColor: '#004c80',
						strokeOpacity: 0.8,
						fillColor: '#fff',
						fillOpacity: 0.7
					},option);
					
					var polygon = new kakao.maps.Polygon({
						name: data.name
						,path : data.path,
						strokeWeight: 2,
					strokeColor: '#004c80',
					strokeOpacity: 0.8,
					fillColor: '#fff',
					fillOpacity: 0.7 
					});
					
					
					
					kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) { 
						polygon.setOptions({fillColor: '#09f'});
						customOverlay.setPosition(mouseEvent.latLng); 
						customOverlay.setMap(map);
					});
					
		
					
					kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
						customOverlay.setPosition(mouseEvent.latLng); 
					});
					
					kakao.maps.event.addListener(polygon, 'mouseout', function() {
						polygon.setOptions({fillColor: '#fff'});
						customOverlay.setMap(null);
					}); 
					
					kakao.maps.event.addListener(polygon, 'click', function() { 
						alert(data.name)
						console.log($(this))
					}); 
					
					polygon.setMap(map);
				}
			}
			
			window.kkoMap = kkoMap;
		})();
		
		
		
		$(function(){
			kkoMap.initKko({
				mapId :"map"
				,option :""
			});
		});
	</script>	 
	</head>
	<body>
	<jsp:include page="inc_header.jsp" flush="true"/>
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>대한민국 행정구역</strong></h5>
		<div class="container mb-5">		
			<div id="map" style="width:100%;height:700px;"></div>
		</div>    
	<jsp:include page="inc_footer.jsp" flush="true"/>
	</body>
</html> 