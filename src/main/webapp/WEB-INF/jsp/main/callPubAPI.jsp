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
        <link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css"/>
        <script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
        <script src="js/jquery-2.2.3.min.js"></script>
        <script src="css/sb-admin/bootstrap.min.js"></script>
        <script src="css/sb-admin/metisMenu.min.js"></script>
        <script src="css/sb-admin/sb-admin-2.js"></script>
        <script src="js/logisnavi.js"></script>
        <script>
            function fn_formSubmit() {
                if (!chkInputValue("#searchExt1", "시군구코드")) 
                    return false;
                
                if (!chkInputValue("#searchExt2", "행정동코드")) 
                    return false;
                
                // if ( ! chkInputValue("#searchExt3", "번")) return false;
                // if ( ! chkInputValue("#searchExt4", "지")) return false;
                document.form1.submit();
            }
            function show_map() { // addr =
                geocoder.addressSearch(data.address, function (results, status) { // 정상적으로 검색이 완료됐으면
                    if (status === daum
                            .maps
                            .services
                            .Status
                                .OK) {
                        var result = results[0];
                        // 첫번째 결과의 값을 활용
                        // document.getElementById("kkompx").value = result.y;
                        // document.getElementById("kkompy").value = result.x;
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
            // ---------------------------------------------- toast grid -----------------------------------------------------//
            var gridt; // 표제부
            var gridb; // 인허가
            var gridtf; // 표제부(층별)
            var gridbf; // 인허가(층별)
            window.onload = function () { // 표제부
                gridt = new tui.Grid({
                    el: document.getElementById('gridt'),
                    scrollX: false,
                    scrollY: false,
                    columns: [
                        {
                            header: '번호',
                            name: 'seq'
                        },
                        {
                            header: '대지위치',
                            name: 'platPlc'
                        },
                        {
                            header: '관리허가대장PK',
                            name: 'mgmBldrgstPk'
                        },
                        {
                            header: '건물명',
                            name: 'bldNm'
                        }, {
                            header: '대지면적(㎡)',
                            name: 'platArea'
                        }, {
                            header: '건축면적(㎡)',
                            name: 'archArea'
                        }, {
                            header: '건폐율(%)',
                            name: 'bcRat'
                        }, {
                            header: '연면적(㎡)',
                            name: 'totArea'
                        }, {
                            header: '용적률산정연면적(㎡)',
                            name: 'vlRatEstmTotArea'
                        }, {
                            header: '용적률(%)',
                            name: 'vlRat'
                        }, {
                            header: '주건축물수',
                            name: 'mainBldCnt'
                        }, {
                            header: '부속건축물동수',
                            name: 'atchBldDongCnt'
                        }, {
                            header: '주용도코드명',
                            name: 'mainPurpsCdNm'
                        }, {
                            header: '총주차수',
                            name: 'totPkngCnt'
                        }, {
                            header: '착공예정일',
                            name: 'stcnsSchedDay'
                        }, {
                            header: '착공연기일',
                            name: 'stcnsDelayDay'
                        }, {
                            header: '실제착공일',
                            name: 'realStcnsDay'
                        }, {
                            header: '건축허가일',
                            name: 'archPmsDay'
                        }, {
                            header: '사용승인일',
                            name: 'useAprDay'
                        }, {
                            header: '생성일자',
                            name: 'crtnDay'
                        }
                    ]
                });
                // 표제부층별
                gridtf = new tui.Grid({
                    el: document.getElementById('gridtf'),
                    scrollX: false,
                    scrollY: false,
                    columns: [
                        {
                            header: '번호',
                            name: 'seq'
                        },
                        {
                            header: '건물명',
                            name: 'bldNm'
                        },
                        {
                            header: '동명칭',
                            name: 'dongNm'
                        },
                        {
                            header: '층구분코드명',
                            name: 'flrGbCdNm'
                        }, {
                            header: '층번호명',
                            name: 'flrNoNm'
                        }, {
                            header: '주용도코드명',
                            name: 'mainPurpsCdNm'
                        }, {
                            header: '면적',
                            name: 'area'
                        }, {
                            header: '기타용도',
                            name: 'etcPurps'
                        }, {
                            header: '생성일',
                            name: 'crtnDay'
                        }
                    ]
                });
                // 인허가
                gridb = new tui.Grid({
                    el: document.getElementById('gridb'),
                    scrollX: false,
                    scrollY: false,
                    columns: [
                        {
                            header: '번호',
                            name: 'seq'
                        },
                        {
                            header: '대지위치',
                            name: 'platPlc'
                        },
                        {
                            header: '관리허가대장PK',
                            name: 'mgmPmsrgstPk'
                        },
                        {
                            header: '건물명',
                            name: 'bldNm'
                        }, {
                            header: '대지면적(㎡)',
                            name: 'platArea'
                        }, {
                            header: '건축면적(㎡)',
                            name: 'archArea'
                        }, {
                            header: '건폐율(%)',
                            name: 'bcRat'
                        }, {
                            header: '연면적(㎡)',
                            name: 'totArea'
                        }, {
                            header: '용적률산정연면적(㎡)',
                            name: 'vlRatEstmTotArea'
                        }, {
                            header: '용적률(%)',
                            name: 'vlRat'
                        }, {
                            header: '주건축물수',
                            name: 'mainBldCnt'
                        }, {
                            header: '부속건축물동수',
                            name: 'atchBldDongCnt'
                        }, {
                            header: '주용도코드명',
                            name: 'mainPurpsCdNm'
                        }, {
                            header: '총주차수',
                            name: 'totPkngCnt'
                        }, {
                            header: '착공예정일',
                            name: 'stcnsSchedDay'
                        }, {
                            header: '착공연기일',
                            name: 'stcnsDelayDay'
                        }, {
                            header: '실제착공일',
                            name: 'realStcnsDay'
                        }, {
                            header: '건축허가일',
                            name: 'archPmsDay'
                        }, {
                            header: '사용승인일',
                            name: 'useAprDay'
                        }, {
                            header: '생성일자',
                            name: 'crtnDay'
                        }
                    ]
                });
                // 인허가층별
                gridbf = new tui.Grid({
                    el: document.getElementById('gridbf'),
                    scrollX: false,
                    scrollY: false,
                    columns: [
                        {
                            header: '번호',
                            name: 'seq'
                        },
                        {
                            header: '건물명',
                            name: 'bldNm'
                        },
                        {
                            header: '층구분코드명',
                            name: 'flrGbCdNm'
                        },
                        {
                            header: '층번호',
                            name: 'flrNo'
                        }, {
                            header: '층면적(㎡)',
                            name: 'flrArea'
                        }, {
                            header: '주용도코드명',
                            name: 'mainPurpsCdNm'
                        }, {
                            header: '관리허가대장PK',
                            name: 'mgmPmsrgstPk'
                        }, {
                            header: '생성일',
                            name: 'crtnDay'
                        }
                    ]
                });
            };
            // 그리드정보 가져오기
            function getGridInfo() {
                if (!chkInputValue("#searchExt1", "시군구코드")) 
                    return false;
                
                if (!chkInputValue("#searchExt2", "행정동코드")) 
                    return false;
                
                if (!chkInputValue("#searchExt3", "번")) 
                    return false;
                
                // 표제부
                $.ajax({
                    url: "jsontest",
                    type: "post",
                    data: {
                        "sigunguCd": $("#searchExt1").val(),
                        "bjdongCd": $("#searchExt2").val(),
                        "bun": $("#searchExt3").val(),
                        "ji": $("#searchExt4").val(),
                        "gubun": "gridt"
                    },
                    success: function (result) {
                        json = JSON.parse(result);
                        gridt.resetData(json);
                    },
                    error: function () {
                        alert('Error occured' + mgbdrgpk);
                    }
                });
                // 표제부 (층별)
                $.ajax({
                    url: "jsontest",
                    type: "post",
                    data: {
                        "sigunguCd": $("#searchExt1").val(),
                        "bjdongCd": $("#searchExt2").val(),
                        "bun": $("#searchExt3").val(),
                        "ji": $("#searchExt4").val(),
                        "gubun": "gridtf"
                    },
                    success: function (result) {
                        json = JSON.parse(result);
                        gridtf.resetData(json);
                    },
                    error: function () {
                        alert('Error occured' + mgbdrgpk);
                    }
                });
                // 인허가
                $.ajax({
                    url: "jsontest",
                    type: "post",
                    data: {
                        "sigunguCd": $("#searchExt1").val(),
                        "bjdongCd": $("#searchExt2").val(),
                        "bun": $("#searchExt3").val(),
                        "ji": $("#searchExt4").val(),
                        "gubun": "gridb"
                    },
                    success: function (result) {
                        json = JSON.parse(result);
                        gridb.resetData(json);
                    },
                    error: function () {
                        alert('Error occured' + mgbdrgpk);
                    }
                });
                // 인허가 (층별)
                $.ajax({
                    url: "jsontest",
                    type: "post",
                    data: {
                        "sigunguCd": $("#searchExt1").val(),
                        "bjdongCd": $("#searchExt2").val(),
                        "bun": $("#searchExt3").val(),
                        "ji": $("#searchExt4").val(),
                        "gubun": "gridbf"
                    },
                    success: function (result) {
                        json = JSON.parse(result);
                        gridbf.resetData(json);
                    },
                    error: function () {
                        alert('Error occured' + mgbdrgpk);
                    }
                });
            }
            // ---------------------------------------------- toast grid -----------------------------------------------------//
        </script>
    </head>
    <body>
        <jsp:include page="inc_header.jsp" flush="true"/>
        <br>
        주소 검색 :
        <br>
        <form id="form1" name="form1" role="form" action="searchPubAPI" method="post" onsubmit="return fn_formSubmit();">
            <input type="text" size="100" id="searchKeyword" maxlength="100" readonly name="searchKeyword" placeholder="주소 검색 클릭" value="<c:out value="${searchVO.searchKeyword}"/>">
            <input type="button" onclick="execDaumPostcode()" value="시군구읍면동 찾기"><br><br>
            <input type="hidden" readonly id="searchExt1" name="searchExt1" maxlength="10" value="<c:out value="${searchVO.searchExt1}"/>">
            <input type="hidden" readonly id="searchExt2" name="searchExt2" maxlength="10" value="<c:out value="${searchVO.searchExt2}"/>">
            *번지를 정확하게 입력하세요&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		번 :
            <input type="text" id="searchExt3" maxlength="10" name="searchExt3" placeholder="번" value="<c:out value="${searchVO.searchExt3}"/>">
            지 :
            <input type="text" id="searchExt4" maxlength="10" name="searchExt4" placeholder="지" value="<c:out value="${searchVO.searchExt4}"/>">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div id="map" style="width:1100px;height:500px;margin-top:10px;display:none"></div>
            <br><br><br>
            <button type="button" onclick="javascript:getGridInfo()">건축데이터 실시간 API호출</button>
        </form>
        <br>
        [표제부 정보]
        <br>
        <div id="gridt"></div>
        <br>
        [표제부 정보(층별)]
        <br>
        <div id="gridtf"></div>
        <br>
        [인허가 정보]
        <br>
        <div id="gridb"></div>
        <br>
        [인허가 정보(층별)]
        <br>
        <div id="gridbf"></div>
        <br>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
        <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                    level: 7 // 지도의 확대 레벨
                };
            // 지도를 미리 생성
            var map = new daum.maps.Map(mapContainer, mapOption);
            // 주소-좌표 변환 객체를 생성
            var geocoder = new daum
                .maps
                .services
                .Geocoder();
            // 마커를 미리 생성
            var marker = new daum.maps.Marker({
                position: new daum.maps.LatLng(37.537187, 127.005476),
                map: map
            });
            function execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function (data) { //                var addr = data.address; // 최종 주소 변수
                        var sigunguCode = data.sigunguCode;
                        var bcode = data.bcode.replace(sigunguCode, "");
                        document.getElementById("searchExt1").value = sigunguCode;
                        document.getElementById("searchExt2").value = bcode;
                        var addr1 = data.sido + " " + data.sigungu;
                        if (data.bname1 != "") {
                            addr1 = addr1 + " " + data.bname1
                        }
                        if (data.bname2 != "") {
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