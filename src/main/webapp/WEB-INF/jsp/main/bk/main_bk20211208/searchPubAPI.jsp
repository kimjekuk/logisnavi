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
			if ( ! chkInputValue("#searchExt1", "시군구코드")) return false;
			if ( ! chkInputValue("#searchExt2", "행정동코드")) return false;
//			if ( ! chkInputValue("#searchExt3", "번")) return false;
//			if ( ! chkInputValue("#searchExt4", "지")) return false;
			
			document.form1.submit();	
		}		
		
		function show_map(){
			
//			addr = 
			
	        geocoder.addressSearch(data.address, function(results, status) {
	            // 정상적으로 검색이 완료됐으면
	            if (status === daum.maps.services.Status.OK) {

	                var result = results[0]; //첫번째 결과의 값을 활용
	                
//	                document.getElementById("kkompx").value = result.y;
//	                document.getElementById("kkompy").value = result.x;

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

		
		
	</script>
</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>
<br>
주소 검색 :
<br>
	<form id="form1" name="form1" role="form" action="searchPubAPI" method="post" onsubmit="return fn_formSubmit();" >
		<input type="text" size="100" id="searchKeyword" maxlength="100" readonly name="searchKeyword" placeholder="주소 검색 클릭" value="<c:out value="${searchVO.searchKeyword}"/>">
		<input type="button" onclick="execDaumPostcode()" value="시군구읍면동 찾기"><br><br>
	   	<input type="hidden" readonly id="searchExt1" name="searchExt1" maxlength="10" value="<c:out value="${searchVO.searchExt1}"/>">
	  	<input type="hidden" readonly id="searchExt2" name="searchExt2" maxlength="10" value="<c:out value="${searchVO.searchExt2}"/>">
	  	*번지를 정확하게 입력하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		번 : <input type="text" id="searchExt3" maxlength="10" name="searchExt3" placeholder="번" value="<c:out value="${searchVO.searchExt3}"/>">
		지 : <input type="text" id="searchExt4" maxlength="10" name="searchExt4" placeholder="지" value="<c:out value="${searchVO.searchExt4}"/>">
	  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<div id="map" style="width:1100px;height:500px;margin-top:10px;display:none"></div>
		<br><br><br>
	    <button type="button" onclick="fn_formSubmit()">공공 API 호출</button>
	</form>   
	
	<br>
	[인허가 정보]	
	<br>	
	<c:forEach var="basisInfo" items="${listBasisInfo}" varStatus="status_basis">
		<c:out value="${status_basis.index + 1}"/>
		순번 : <c:out value="${basisInfo.rnum}" />
		대지위치 : <c:out value="${basisInfo.platPlc}" />
<%-- 		시군구코드 : <c:out value="${basisInfo.sigunguCd}" />
		법정동코드 : <c:out value="${basisInfo.bjdongCd}" />
		대지구분코드 : <c:out value="${basisInfo.platGbCd}" />
		번 : <c:out value="${basisInfo.bun}" />
		지 : <c:out value="${basisInfo.ji}" /> --%>
		관리허가대장PK : <c:out value="${basisInfo.mgmPmsrgstPk}" />
		건물명 : <c:out value="${basisInfo.bldNm}" />
<%-- 		특수지명 : <c:out value="${basisInfo.splotNm}" />
		블록 : <c:out value="${basisInfo.block}" />
		로트 : <c:out value="${basisInfo.lot}" />
		지목코드명 : <c:out value="${basisInfo.jimokCdNm}" />
		지역코드명 : <c:out value="${basisInfo.jiyukCdNm}" />
		지구코드명 : <c:out value="${basisInfo.jiguCdNm}" />
		구역코드명 : <c:out value="${basisInfo.guyukCdNm}" />
		지목코드 : <c:out value="${basisInfo.jimokCd}" />
		지역코드 : <c:out value="${basisInfo.jiyukCd}" />
		지구코드 : <c:out value="${basisInfo.jiguCd}" />
		구역코드 : <c:out value="${basisInfo.guyukCd}" />
		건축구분코드 : <c:out value="${basisInfo.archGbCdNm}" />
		건축구분코드명 : <c:out value="${basisInfo.archGbCd}" /> --%>
		대지면적(㎡) : <c:out value="${basisInfo.platArea}" />
		건축면적(㎡) : <c:out value="${basisInfo.archArea}" />
		건폐율(%) : <c:out value="${basisInfo.bcRat}" />
		연면적(㎡) : <c:out value="${basisInfo.totArea}" />
		용적률산정연면적(㎡) : <c:out value="${basisInfo.vlRatEstmTotArea}" />
		용적률(%) : <c:out value="${basisInfo.vlRat}" />
		주건축물수 : <c:out value="${basisInfo.mainBldCnt}" />
		부속건축물동수 : <c:out value="${basisInfo.atchBldDongCnt}" />
<%-- 		주용도코드 : <c:out value="${basisInfo.mainPurpsCd}" /> --%>
		주용도코드명 : <c:out value="${basisInfo.mainPurpsCdNm}" />
<%-- 		세대수(세대) : <c:out value="${basisInfo.hhldCnt}" />
		호수(호) : <c:out value="${basisInfo.hoCnt}" />
		가구수(가구) : <c:out value="${basisInfo.fmlyCnt}" /> --%>
		총주차수 : <c:out value="${basisInfo.totPkngCnt}" />
		착공예정일 : <c:out value="${basisInfo.stcnsSchedDay}" />
		착공연기일 : <c:out value="${basisInfo.stcnsDelayDay}" />
		실제착공일 : <c:out value="${basisInfo.realStcnsDay}" />
		건축허가일 : <c:out value="${basisInfo.archPmsDay}" />
		사용승인일 : <c:out value="${basisInfo.useAprDay}" />
		생성일자 : <c:out value="${basisInfo.crtnDay}" />
	<br>		
	</c:forEach>
	<br>	
	<br>
	[인허가 정보(층별)]
	<br>
	<c:forEach var="basisFloorInfo" items="${listBasisFloorInfo}" varStatus="status_basis_fl">
			<c:out value="${status_basis_fl.index + 1}"/>
 			<%--건물명 : --%> <c:out value="${basisFloorInfo.bldNm}" />	
			<%--층구분코드명 : --%> <c:out value="${basisFloorInfo.flrGbCdNm}" />
			<%--층번호 : --%> <fmt:formatNumber type="number" maxFractionDigits="0" value="${basisFloorInfo.flrNo}" />층
			<%--층면적(㎡) : --%> <c:out value="${basisFloorInfo.flrArea}" />(㎡)
			<%--주용도코드명 : --%> <c:out value="${basisFloorInfo.mainPurpsCdNm}" />
			<%--관리허가대장PK : --%> <c:out value="${basisFloorInfo.mgmPmsrgstPk}" />
			<c:out value="${basisFloorInfo.crtnDay}" />
<%-- 			건축구분코드명 : <c:out value="${basisFloorInfo.archGbCd}" />
			생성일자 : <c:out value="${basisFloorInfo.crtnDay}" />
			순번 : <c:out value="${basisFloorInfo.rnum}" />
			대지위치 : <c:out value="${basisFloorInfo.platPlc}" />
			시군구코드 : <c:out value="${basisFloorInfo.sigunguCd}" />
			법정동코드 : <c:out value="${basisFloorInfo.bjdongCd}" />
			대지구분코드 : <c:out value="${basisFloorInfo.platGbCd}" />
			번 : <c:out value="${basisFloorInfo.bun}" />
			지 : <c:out value="${basisFloorInfo.ji}" />
			관리층별개요PK : <c:out value="${basisFloorInfo.mgmFlrOulnPk}" />
			관리동별개요PK : <c:out value="${basisFloorInfo.mgmDongOulnPk}" /> --%>

<%-- 			특수지명 : <c:out value="${basisFloorInfo.splotNm}" /> --%>
<%-- 			블록 : <c:out value="${basisFloorInfo.block}" />
			로트 : <c:out value="${basisFloorInfo.lot}" />
			구조코드 : <c:out value="${basisFloorInfo.strctCd}" /> --%>
<%-- 			구조코드명 : <c:out value="${basisFloorInfo.strctCdNm}" /> --%>
<%-- 			주용도코드 : <c:out value="${basisFloorInfo.mainPurpsCd}" /> --%>
<%-- 			층구분코드 : <c:out value="${basisFloorInfo.flrGbCd}" /> --%>
<%-- 			건축구분코드 : <c:out value="${basisFloorInfo.archGbCdNm}" /> --%>
		<br>
	</c:forEach>
	<br>	
	<br>	
	<br>	
	[표제부 정보]
	<br>
	<c:forEach var="titleInfo" items="${listTitleInfo}" varStatus="status_title">
			<c:out value="${status_title.index + 1}"/>
			순번 : <c:out value="${titleInfo.rnum}" />
			대지위치 : <c:out value="${titleInfo.platPlc}" />
<%-- 			시군구코드 : <c:out value="${titleInfo.sigunguCd}" />
			법정동코드 : <c:out value="${titleInfo.bjdongCd}" />
			대지구분코드 : <c:out value="${titleInfo.platGbCd}" />
			번 : <c:out value="${titleInfo.bun}" />
			지 : <c:out value="${titleInfo.ji}" /> --%>
			관리건축물대장PK : <c:out value="${titleInfo.mgmBldrgstPk}" />
<%-- 			대장구분코드 : <c:out value="${titleInfo.regstrGbCd}" />
			대장구분코드명 : <c:out value="${titleInfo.regstrGbCdNm}" />
			대장종류코드 : <c:out value="${titleInfo.regstrKindCd}" />
			대장종류코드명 : <c:out value="${titleInfo.regstrKindCdNm}" />
			도로명대지위치 : <c:out value="${titleInfo.newPlatPlc}" /> --%>
			건물명 : <c:out value="${titleInfo.bldNm}" />
<%-- 			특수지명 : <c:out value="${titleInfo.splotNm}" />
			블록 : <c:out value="${titleInfo.block}" />
			로트 : <c:out value="${titleInfo.lot}" />
			외필지수 : <c:out value="${titleInfo.bylotCnt}" />
			새주소도로코드 : <c:out value="${titleInfo.naRoadCd}" />
			새주소법정동코드 : <c:out value="${titleInfo.naBjdongCd}" />
			새주소지상지하코드 : <c:out value="${titleInfo.naUgrndCd}" />
			새주소본번 : <c:out value="${titleInfo.naMainBun}" />
			새주소부번 : <c:out value="${titleInfo.naSubBun}" /> --%>
			동명칭 : <c:out value="${titleInfo.dongNm}" />
<%-- 			주부속구분코드 : <c:out value="${titleInfo.mainAtchGbCd}" />
			주부속구분코드명 : <c:out value="${titleInfo.mainAtchGbCdNm}" /> --%>
			대지면적(㎡) : <c:out value="${titleInfo.platArea}" />
			건축면적(㎡) : <c:out value="${titleInfo.archArea}" />
			건폐율(%) : <c:out value="${titleInfo.bcRat}" />
			연면적(㎡) : <c:out value="${titleInfo.totArea}" />
			용적률산정연면적(㎡) : <c:out value="${titleInfo.vlRatEstmTotArea}" />
			용적률(%) : <c:out value="${titleInfo.vlRat}" />
<%-- 			구조코드 : <c:out value="${titleInfo.strctCd}" /> --%>
			구조코드명 : <c:out value="${titleInfo.strctCdNm}" />
<%-- 			기타구조 : <c:out value="${titleInfo.etcStrct}" />
			주용도코드 : <c:out value="${titleInfo.mainPurpsCd}" /> --%>
			주용도코드명 : <c:out value="${titleInfo.mainPurpsCdNm}" />
<%-- 			기타용도 : <c:out value="${titleInfo.etcPurps}" />
			지붕코드 : <c:out value="${titleInfo.roofCd}" /> --%>
			지붕코드명 : <c:out value="${titleInfo.roofCdNm}" />
<%-- 			기타지붕 : <c:out value="${titleInfo.etcRoof}" />
			세대수(세대) : <c:out value="${titleInfo.hhldCnt}" />
			가구수(가구) : <c:out value="${titleInfo.fmlyCnt}" /> --%>
			높이(m) : <c:out value="${titleInfo.heit}" />
			지상층수 : <c:out value="${titleInfo.grndFlrCnt}" />
			지하층수 : <c:out value="${titleInfo.ugrndFlrCnt}" />
			승용승강기수 : <c:out value="${titleInfo.rideUseElvtCnt}" />
			비상용승강기수 : <c:out value="${titleInfo.emgenUseElvtCnt}" />
			부속건축물수 : <c:out value="${titleInfo.atchBldCnt}" />
			부속건축물면적(㎡) : <c:out value="${titleInfo.atchBldArea}" />
			총동연면적(㎡) : <c:out value="${titleInfo.totDongTotArea}" />
		<%-- 	옥내기계식대수(대) : <c:out value="${titleInfo.indrMechUtcnt}" />
			옥내기계식면적(㎡) : <c:out value="${titleInfo.indrMechArea}" />
			옥외기계식대수(대) : <c:out value="${titleInfo.oudrMechUtcnt}" />
			옥외기계식면적(㎡) : <c:out value="${titleInfo.oudrMechArea}" />
			옥내자주식대수(대) : <c:out value="${titleInfo.indrAutoUtcnt}" />
			옥내자주식면적(㎡) : <c:out value="${titleInfo.indrAutoArea}" />
			옥외자주식대수(대) : <c:out value="${titleInfo.oudrAutoUtcnt}" />
			옥외자주식면적(㎡) : <c:out value="${titleInfo.oudrAutoArea}" /> --%>
			허가일 : <c:out value="${titleInfo.pmsDay}" />
			착공일 : <c:out value="${titleInfo.stcnsDay}" />
			사용승인일 : <c:out value="${titleInfo.useAprDay}" />
			허가번호년 : <c:out value="${titleInfo.pmsnoYear}" />
		<%-- 	허가번호기관코드 : <c:out value="${titleInfo.pmsnoKikCd}" /> --%>
			허가번호기관코드명 : <c:out value="${titleInfo.pmsnoKikCdNm}" />
<%-- 			허가번호구분코드 : <c:out value="${titleInfo.pmsnoGbCd}" /> --%>
			허가번호구분코드명 : <c:out value="${titleInfo.pmsnoGbCdNm}" />
	<%-- 		호수(호) : <c:out value="${titleInfo.hoCnt}" />
			에너지효율등급 : <c:out value="${titleInfo.engrGrade}" />
			에너지절감율 : <c:out value="${titleInfo.engrRat}" />
			EPI점수 : <c:out value="${titleInfo.engrEpi}" />
			친환경건축물등급 : <c:out value="${titleInfo.gnBldGrade}" />
			친환경건축물인증점수 : <c:out value="${titleInfo.gnBldCert}" />
			지능형건축물등급 : <c:out value="${titleInfo.itgBldGrade}" />
			지능형건축물인증점수 : <c:out value="${titleInfo.itgBldCert}" /> --%>
			생성일자 : <c:out value="${titleInfo.crtnDay}" />
	<%-- 		내진 설계 적용 여부 : <c:out value="${titleInfo.rserthqkDsgnApplyYn}" />
			내진 능력 : <c:out value="${titleInfo.rserthqkAblty}" /> --%>
		<br>
	</c:forEach>
	<br>
	[표제부 정보(층별)]
	<br>
	<c:forEach var="titleFloorInfo" items="${listTitleFloorInfo}" varStatus="status_title_fl">
			<c:out value="${status_title_fl.index + 1}"/>
			
			<%--건물명 :  --%><c:out value="${titleFloorInfo.bldNm}" />
			<%--동명칭 :--%> <c:out value="${titleFloorInfo.dongNm}" />
			<%--층구분코드명 :--%> <c:out value="${titleFloorInfo.flrGbCdNm}" />
			<%--층번호명 :--%> <c:out value="${titleFloorInfo.flrNoNm}" />
			<%--주용도코드명 :--%> <c:out value="${titleFloorInfo.mainPurpsCdNm}" />
			<%--면적: --%><c:out value="${titleFloorInfo.area}" />(㎡)
			<%--기타용도--%> : <c:out value="${titleFloorInfo.etcPurps}" />
			<%--생성일 :--%> <c:out value="${titleFloorInfo.crtnDay}" />
				
<%-- 			순번 : <c:out value="${titleFloorInfo.rnum}" />
			대지위치 : <c:out value="${titleFloorInfo.platPlc}" />
			시군구코드 : <c:out value="${titleFloorInfo.sigunguCd}" />
			법정동코드 : <c:out value="${titleFloorInfo.bjdongCd}" />
			대지구분코드 : <c:out value="${titleFloorInfo.platGbCd}" />
			번 : <c:out value="${titleFloorInfo.bun}" />
			지 : <c:out value="${titleFloorInfo.ji}" /> 
			관리건축물대장PK : <c:out value="${titleFloorInfo.mgmBldrgstPk}" /> --%>
<%-- 			도로명대지위치 : <c:out value="${titleFloorInfo.newPlatPlc}" />

			특수지명 : <c:out value="${titleFloorInfo.splotNm}" />
			블록 : <c:out value="${titleFloorInfo.block}" />
			로트 : <c:out value="${titleFloorInfo.lot}" />
			새주소도로코드 : <c:out value="${titleFloorInfo.naRoadCd}" />
			새주소법정동코드 : <c:out value="${titleFloorInfo.naBjdongCd}" />
			새주소지상지하코드 : <c:out value="${titleFloorInfo.naUgrndCd}" />
			새주소본번 : <c:out value="${titleFloorInfo.naMainBun}" />
			새주소부번 : <c:out value="${titleFloorInfo.naSubBun}" /> --%>
<%-- 			층구분코드 : <c:out value="${titleFloorInfo.flrGbCd}" /> --%>
<%-- 			층번호 : <c:out value="${titleFloorInfo.flrNo}" /> --%>
<%-- 			구조코드 : <c:out value="${titleFloorInfo.strctCd}" /> --%>
<%-- 			구조코드명 : <c:out value="${titleFloorInfo.strctCdNm}" />
 --%><%-- 			기타구조 : <c:out value="${titleFloorInfo.etcStrct}" />
			주용도코드 : <c:out value="${titleFloorInfo.mainPurpsCd}" /> --%>
<%-- 			
			주부속구분코드 : <c:out value="${titleFloorInfo.mainAtchGbCd}" />
			주부속구분코드명 : <c:out value="${titleFloorInfo.mainAtchGbCdNm}" /> --%>
<%-- 			면적제외여부 : <c:out value="${titleFloorInfo.areaExctYn}" /> --%>
		<br>
	</c:forEach>
	<br>

		
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 7 // 지도의 확대 레벨
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
//                var addr = data.address; // 최종 주소 변수

                var sigunguCode = data.sigunguCode;
                var bcode = data.bcode.replace(sigunguCode, "");
                document.getElementById("searchExt1").value = sigunguCode;
                document.getElementById("searchExt2").value = bcode;

				var addr1 = data.sido + " " + data.sigungu;
                if(data.bname1 != ""){
                	addr1 = addr1 + " " + data.bname1
                }
                if(data.bname2 != ""){
                	addr1 = addr1 + " " + data.bname2
                }
                // 주소 정보를 해당 필드에 넣는다.(시군구)
                document.getElementById("searchKeyword").value = addr1
                
                // 주소 정보를 해당 필드에 넣는다.(번지 입력 비움)
                document.getElementById("searchExt3").value = "";
                document.getElementById("searchExt4").value = "";

                
            }
        }).open();
    }
</script>      	
	
</body>
</html>