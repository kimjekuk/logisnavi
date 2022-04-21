
<!doctype html>
<html>
	<head>
		<script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
		<script>
			(function(){
				var map ="";
					
				var kkoMap = {				
					initKko : function(data){
						areaId = data.mapId;
						option = data.option;
						
						mapContainer = document.getElementById(areaId); // 지도를 표시할 div 
						mapOption = $.extend({
							center: new kakao.maps.LatLng(37.567509, 126.980663)
							,level : 15
						},option);

						map = new kakao.maps.Map(mapContainer, mapOption),
						customOverlay = new kakao.maps.CustomOverlay({}),
						infowindow = new kakao.maps.InfoWindow({removable: true});
						
						$.getJSON("js/all.json",function(jData){
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
		<div id="map" style="width:100%;height:700px;"></div>    
	</body>
</html> 