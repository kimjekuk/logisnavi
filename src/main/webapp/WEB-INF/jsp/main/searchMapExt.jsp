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
												 <a style="color:#5600E0"   href="#">
													${fn:substring(warelist.whname,0,3)} ***    
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
												${fn:substring(warelist.mpadrs,0,7)} *** *** <br> 
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=clusterer"></script>
<script>

		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		    center : new kakao.maps.LatLng(35.2683, 127.6358), // 지도의 중심좌표
		    level : 13 // 지도의 확대 레벨
		});
		
	    // 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 3, // 클러스터 할 최소 지도 레벨 
	        minClusterSize: 1,
	        calculator: [1, 3, 5], // 클러스터의 크기 구분 값, 각 사이값마다 설정된 text나 style이 적용된다	        
	        texts: getTexts, // texts는 ['', '', '', ''] 이렇게 배열로도 설정할 수 있다 
	        styles: [{ // calculator 각 사이 값 마다 적용될 스타일을 지정한다
	                width : '30px', height : '30px',
	                background: '#F0A513',
	                borderRadius: '15px',
	                color: 'white',
	                textAlign: 'center',
	                fontWeight: 'bold',
	                lineHeight: '31px'
	            },
	            {
	                width : '40px', height : '40px',
	                background: '#5600E0',
	                borderRadius: '20px',
	                color: 'white',
	                textAlign: 'center',
	                fontWeight: 'bold',
	                lineHeight: '41px'
	            },
	            {
	                width : '50px', height : '50px',
	                background: '#27ED0C',
	                borderRadius: '25px',
	                color: 'white',
	                textAlign: 'center',
	                fontWeight: 'bold',
	                lineHeight: '51px'
	            },
	            {
	                width : '60px', height : '60px',
	                background: '#F7160C',
	                borderRadius: '30px',
	                color: 'white',
	                textAlign: 'center',
	                fontWeight: 'bold',
	                lineHeight: '61px'
	            }
	        ],	        
	        //클릭줌 활성 비활성
	        disableClickZoom:false
	    });	
	    
	    
	    // 클러스터 내부에 삽입할 문자열 생성 함수입니다 
	    function getTexts( count ) {
	    	
	      return count;
	      
	      // 한 클러스터 객체가 포함하는 마커의 개수에 따라 다른 텍스트 값을 표시합니다 
	      if(count = 1) {
	        return '1';        
	      } else if(count <= 10) {
	        return '2 ~ 10';
	      } else if(count <= 50) {
	        return '11 ~ 50';
	      } else {
	        return 'over 50';
	      }
	    }	    
	    
////////////////////////////////////////////////////////////////////////////////////////////////////////

   		var bounds = new kakao.maps.LatLngBounds();   
	    var markers = [];
		var positions = [];
		<c:forEach var="listview" items="${listview}" varStatus="status">
	        var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
                position : new kakao.maps.LatLng("${listview.kkompx}", "${listview.kkompy}")
            });
	        markers.push(marker);
	        
			positions.push(
				    {
				        vkkompx : "${listview.kkompx}",
						vkkompy : "${listview.kkompy}",
						vwhcode : "${listview.whcode}"
				    });	        
//	        bounds.extend("${listview.kkompx}", "${listview.kkompy}");    
		</c:forEach>		
		//줌기능 막음
//		map.setZoomable(false);
		map.setMinLevel(10);
		
        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
		

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
        
////////////////////////////////////////////////////////////////////////////////////////////////////////

</script>
</body>
</html>