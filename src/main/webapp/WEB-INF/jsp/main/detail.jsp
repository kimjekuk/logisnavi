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
 	<style>
    	div {  border: solid red 0px; } 
    	span { font-size:15px;text-decoration:none;}
    	label {font-size:12px;font-weight:none;margin-top:10px; margin-bottom: 0;color:#696969}
		table td {
		  vertical-align: middle !important;white-space: nowrap;font-size:14px;
		}    	
	</style>	
 </head>	
<body>
<jsp:include page="inc_header.jsp" flush="true"/>

<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>창고상세정보</strong></h5>
	<p style="text-align:right;">
	<!-- 	 
		<a href="javascript:history.back();"><span class="fa fa-arrow-circle-left" title="back"></span> back</a>
	-->
	</p>
  	<div class="row">
        <div class="col-md-12">
		</div>
	</div>
  	<div class="row">
        <div class="col-md-8">
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr>
					<td colspan="2" style="font-weight:bolder;">건축물 개요</td>
				<tr>				
				<tr>
					<td style="background: #FAFAFA;width:40%;">건물명</td>
					<td>${warehouseVO.whname}</td>
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">위치</td>
					<td>${warehouseVO.mpadrs}</td>
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">대지면적</td>
					<td><fmt:formatNumber value="${warehouseVO.szposi}" pattern="#,###" />&nbsp;평</sup></td> 
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">건축면적</td>
					<td><fmt:formatNumber value="${warehouseVO.szstrt}" pattern="#,###" />&nbsp;평</sup></td> 
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">연면적</td>
					<td><fmt:formatNumber value="${warehouseVO.szarea}" pattern="#,###" />&nbsp;평</sup></td> 
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
					<td>${warehouseVO.mpicif}</td>
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">특이사항</td>
					<td>${warehouseVO.etcstr}</td>
				<tr>				
			</table>        
			<table  id="tables" class="table table-bordered table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr>
					<td colspan="4" style="font-weight:bolder;">임대 조건</td>
				<tr>				
				<tr>
					<td colspan="2" style="background: #FAFAFA;width:40%;">인근임대료시세</td>
					<td colspan="2"><fmt:formatNumber value="${warehouseVO.lmpsif}" pattern="#,###" /> &nbsp;&nbsp;원&nbsp;&nbsp;~&nbsp;&nbsp;
					<fmt:formatNumber value="${warehouseVO.lmpsit}" pattern="#,###" /> &nbsp;&nbsp;원&nbsp;&nbsp;</td>
				<tr>				
				<tr>
					<td colspan="2" style="background: #FAFAFA;">임대료</td>
					<td colspan="2" >${warehouseVO.lmppay}</td>
				<tr>				
				<tr>
					<td colspan="2" style="background: #FAFAFA;">임대료포함면적</td>
					<td colspan="2" >${warehouseVO.lmpinc}</td>
				<tr>				
				<tr>
					<td colspan="2" style="background: #FAFAFA;">보증금</td>
					<td colspan="2" >${warehouseVO.lmpdps}</td>
				<tr>				
				<tr>
					<td rowspan="8" style="background: #FAFAFA;">관리비</td>
					<td style="background: #FAFAFA;">창고</td>
					<td colspan="2" >${warehouseVO.lmpwhc}</td>
				<tr>						
				<tr>
					<td style="background: #FAFAFA;">하역장</td>
					<td colspan="2" >${warehouseVO.lmpdcc}</td>
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">사무실</td>
					<td colspan="2" >${warehouseVO.lmpofc}</td>
				<tr>				
				<tr>
					<td style="background: #FAFAFA;">공용</td>
					<td colspan="2" >${warehouseVO.lmppbc}</td>
				<tr>				
				<tr>
					<td colspan="2" style="background: #FAFAFA;">수도광열비</td>
					<td colspan="2" >${warehouseVO.lmpwtc}</td>
				<tr>				
				<tr>
					<td colspan="2" style="background: #FAFAFA;">임대료인상율</td>
					<td colspan="2">${warehouseVO.lmpupp}</td>
				<tr>	
				<tr>
					<td colspan="2" style="background: #FAFAFA;">Rent Free</td>
					<td colspan="2">${warehouseVO.lmprtf}</td>
				<tr>	
				<tr>
					<td colspan="2" style="background: #FAFAFA;">추가 조건</td>
					<td>${warehouseVO.lmpadd}</td>
				<tr>
			</table>				
		</div>
        <div class="col-md-4">
			<br> 
			<span class="fa fa-image" title="image" style="font-size:5px;">&nbsp;전경도</span> 
			<div>
	            <a href="${warehouseVO.img001}" data-toggle="lightbox" class="col-bg-3" data-title="<label>전경도</label>" data-footer="<label>창고번호 : ${warehouseVO.whcode}</label>">
					<img src="${warehouseVO.img001}" style="width:100%;height:200px;border:1px solid grey;">
				</a>
			</div>        
			<br> 
			<span class="fa fa-map-marker" title="map" style="font-size:5px;">&nbsp;위치</span> 
			<div> 
				<div id="map" style="width:100%;height:200px;border:1px solid grey;"></div>
			</div>       
			<br> 
			<span class="fa fa-image" title="image" style="font-size:5px;">&nbsp;배치도</span>
			<div>
	            <a href="${warehouseVO.img002}" data-toggle="lightbox" class="col-bg-3" data-title="<label>배치도</label>" data-footer="<label>창고번호 : ${warehouseVO.whcode}</label>">
					<img src="${warehouseVO.img002}"  style="width:100%;height:200px;border:1px solid grey;">
				</a>
			</div>        
			<br>
		</div>
	</div>
	
	<div class="row">
        <div class="col-md-12">
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr>
					<td colspan="6" style="font-weight:bolder;background: #FAFAFA;color:blue;">임대인정보</td>
				</tr>				
				<tr>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;color:blue;">개발정보</td>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;color:blue;">임대문의</td>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;color:blue;">담당자</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;width:15%">소유자</td>
					<td style="width:15%">${warehouseVO.cdvown}</td>
					<td style="background: #FAFAFA;color:blue;width:15%">소유자</td>
					<td style="width:15%">${warehouseVO.lmvown}</td>
					<td style="background: #FAFAFA;color:blue;width:15%">성함</td>
					<td style="width:15%">${warehouseVO.catnam}</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">시행사</td>
					<td>${warehouseVO.cdvsih}</td>
					<td style="background: #FAFAFA;color:blue;">AMC</td>
					<td>${warehouseVO.lmvamc}</td>
					<td style="background: #FAFAFA;color:blue;">임대회사</td>
					<td>${warehouseVO.catpos}</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">시공사</td>
					<td>${warehouseVO.cdvsig}</td>
					<td style="background: #FAFAFA;color:blue;">임대회사</td>
					<td>${warehouseVO.lmvcom}</td>
					<td style="background: #FAFAFA;color:blue;">TEL</td>
					<td>${warehouseVO.cattel}</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">감리사</td>
					<td>${warehouseVO.cdvgam}</td>
					<td style="background: #FAFAFA;color:blue;" rowspan=2>기타</td>
					<td  rowspan=2>
						<textarea class="form-control" id="lmvetc" name="lmvetc" rows="2" readonly  style="background-color:white;">${warehouseVO.lmvetc}</textarea>
					</td>
					<td style="background: #FAFAFA;color:blue;">HP</td>
					<td>${warehouseVO.cathpg}</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">설계사</td>
					<td>${warehouseVO.cdvsul}</td>
					<td style="background: #FAFAFA;color:blue;">이메일</td>
					<td>${warehouseVO.cateml}</td>
				</tr>				
				<tr> 
					<td colspan=4></td>
					<td colspan=2>
					담당자명함
							<div class="row">
<!--  							
								<div class="col-md-5">
								담당자명함
								<br>
								<img class="img-thumbnail" id="catcad" name="catcad"
									<c:choose>
										<c:when test="${empty warehouseVO.catcad}" >
											src="images/noimg_w200h150.gif"  
										</c:when> 
										<c:otherwise>
											src="${warehouseVO.catcad}"  
										</c:otherwise>
									</c:choose>					
									style="width:130px;height:100px;">					
								    <br>
							    </div>
								<div class="col-md-6">
								    <input type="file" style="width:30px" class="custom-file-input" id="file003" name="file003"  accept='image/*' >
								    <label class="custom-file-label" for="file003"></label>
								    <br><br>
						   			<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg03('file003')"> 이미지업로드 </button>
								</div>
-->								
							</div>
					</td>
				</tr>				
				
			</table>	
		</div>
	</div>			
	<br>	
	
  	<div class="row">
        <div class="col-md-12">
			<div class="table-responsive">
				<table  id="tables" class="table table-hover table-bordered table-sm" style="cellspacing:0;width:100%;text-align:center;" >
					<tbody>
					<thead align="center">
						<tr style="background:#FAFAFA;">
							<td rowspan="2" >층</td>
							<td rowspan="2" >주용도</td>
							<td rowspan="2" >층별면적<br>(합계)</td>
							
							<td colspan="5">임대면적(평)</td>
							<td colspan="5" style="color:blue;">공실면적(평)</td>
							<td colspan="2" >임대조건</td>
							<td colspan="4" >층별SPEC</td>
							
							<td rowspan="2" >상태</td>
						</tr>
						<tr style="background:#FAFAFA">
							<td>창고</td>
							<td>하역장</td>
							<td>사무실</td>
							<td>공용</td>
							<td>계약면적</td>
						
							<td style="color:blue;">창고</td>
							<td style="color:blue;">하역장</td>
							<td style="color:blue;">사무실</td>
							<td style="color:blue;">공용</td>
							<td style="color:blue;">공실면적</td>

							<td>입주시기</td>
							<td>임대료/평</td>
							
							<td>유효고</td>
							<td>접안방식</td>
							<td>도크수</td>
							<td>온도</td>
						<tr>
					</thead>				
					<tbody  align="center">
					
					<c:set var="sum_flarea" value="0" />
						
					<c:set var="sum_flslmz" value="0" />	
					<c:set var="sum_flslwa" value="0" />	
					<c:set var="sum_flslof" value="0" />	
					<c:set var="sum_flsldo" value="0" />	
					<c:set var="sum_fllmsz" value="0" />	

					<c:set var="sum_flsewa" value="0" />	
					<c:set var="sum_flsedo" value="0" />	
					<c:set var="sum_flseof" value="0" />	
					<c:set var="sum_flsemz" value="0" />	
					<c:set var="sum_flsesz" value="0" />	

					<c:forEach var="wflist" items="${listview}" varStatus="status">
					
						<c:set var="sum_flarea" value="${sum_flarea + wflist.flarea}" />	

						<c:set var="sum_flslwa" value="${sum_flslwa + wflist.flslwa}" />	
						<c:set var="sum_flsldo" value="${sum_flsldo + wflist.flsldo}" />	
						<c:set var="sum_flslof" value="${sum_flslof + wflist.flslof}" />	
						<c:set var="sum_flslmz" value="${sum_flslmz + wflist.flslmz}" />	
						<c:set var="sum_fllmsz" value="${sum_fllmsz + wflist.fllmsz}" />	

						<c:set var="sum_flsewa" value="${sum_flsewa + wflist.flsewa}" />	
						<c:set var="sum_flsedo" value="${sum_flsedo + wflist.flsedo}" />	
						<c:set var="sum_flseof" value="${sum_flseof + wflist.flseof}" />	
						<c:set var="sum_flsemz" value="${sum_flsemz + wflist.flsemz}" />	
						<c:set var="sum_flsesz" value="${sum_flsesz + wflist.flsesz}" />	


					
						<tr>
							<td>${wflist.whflnm}</td>
							<td>${wflist.whfuse}</td>
							<td style="text-align:right;">
								<fmt:formatNumber value="${wflist.flarea}" pattern="#,###" />
							</td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flslwa}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flsldo}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flslof}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flslmz}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.fllmsz}" pattern="#,###" /></td>
							
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flsewa}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flsedo}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flseof}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flsemz}" pattern="#,###" /></td>
							<td style="text-align:right;"><fmt:formatNumber value="${wflist.flsesz}" pattern="#,###" /></td>
							
							
							<td>${wflist.lsfnow}</td>
								<c:choose> 
									<c:when test="${wflist.pricyn  eq '협의' }">
										<td style="text-align:center;">
											${wflist.pricyn}
										</td>							
									</c:when> 
									<c:otherwise>
										<td style="text-align:right;">
											<fmt:formatNumber value="${wflist.pprice}" pattern="#,###" />
										</td>
									</c:otherwise>
								</c:choose>  							
							</td>
							<td style="text-align:right;">${wflist.flhegt} m</td>
							<td>
								 <c:if test = "${fn:contains(wflist.trdock, '40FT')}"><span class="badge badge-danger">40FT</span></c:if>							
								 <c:if test = "${fn:contains(wflist.trdock, '20FT')}"><span class="badge badge-danger">20FT</span></c:if>							
								 <c:if test = "${fn:contains(wflist.trdock, '5Ton')}"><span class="badge badge-danger">5Ton</span></c:if>							
								 <c:if test = "${fn:contains(wflist.trdock, '화물EV')}"><span class="badge badge-danger">화물EV</span></c:if>							
								 <c:if test = "${fn:contains(wflist.trdock, '수직반송기')}"><span class="badge badge-danger">수직반송기</span></c:if>							
							</td>
							<td style="text-align:right;">${wflist.docknu}</td>
							<td>${wflist.whtemp}</td>
							
							<td>${wflist.status}</td>
						</tr>
					</c:forEach>
						<tr style="background:#FAFAFA;text-align:right;font-style:italic;color:blue">
							<td colspan=2 style="text-align:center">SUM</td>
							<td><fmt:formatNumber value="${sum_flarea}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flslwa}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flsldo}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flslof}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flslmz}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_fllmsz}" pattern="#,###" /></td>

							<td><fmt:formatNumber value="${sum_flsewa}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flsedo}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flseof}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flsemz}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${sum_flsesz}" pattern="#,###" /></td>

							<td colspan=7></td>							
						</tr>
					</tbody>
				</table>	
			</div>
		</div>		
	</div>
	<div class="row mb-5 mt-5">
		<div class="col-md-4"></div>
		<div class="col-md-2">
			<a href="ctrWareForm?whcode=<c:out value="${warehouseVO.whcode}"/>">
				<button type="button" class="btn btn-primary btn-sm">수정하기</button>
			</a>
		</div>
		<c:choose> 
			<c:when test="${warehouseVO.delflg  eq 'Y' }">
				<div class="col-md-2">
					<a href="delWareForm?whcode=<c:out value="${warehouseVO.whcode}"/>&delflg=N">
						<button type="button" class="btn btn-warning btn-sm">복원하기</button>
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-md-2">
					<a href="delWareForm?whcode=<c:out value="${warehouseVO.whcode}"/>&delflg=Y">
						<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
					</a>
				</div>
			</c:otherwise>
		</c:choose>					
		<div class="col-md-4"></div>
    </div>
</div>	

<jsp:include page="inc_footer.jsp" flush="true"/>
<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox();
	});
</script>
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