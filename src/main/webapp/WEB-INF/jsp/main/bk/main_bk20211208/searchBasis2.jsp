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
			            perPage: 100,
			            useClient: true
			        }, 
			        scrollX: true,
			        scrollY: true,
			        useClientSort : true,
			        showDummyRows : true,
			        rowHeaders:['rowNum', 'checkbox'],		   
			        columns: [
			          { header : '관리허가대장PK', name: 'mgmPmsrgstPk' ,
						 formatter({value}){
							return '<a href="javascript:fn_getModalBasisFloor(\''+ value.toString()+'\')" >'+ value.toString() + '</a>';
						}				          
			          },
			          { header : '대지위치', name: 'platPlc' ,align:'left', width : 300},
//                    { header : '시군구코드', name: 'sigunguCd' },
//			          { header : '법정동코드', name: 'bjdongCd' },
//			          { header : '대지구분코드', name: 'platGbCd' },
//			          { header : '번', name: 'bun' },
//			          { header : '지', name: 'ji' },
//			          { header : '관리허가대장PK', name: 'mgmPmsrgstPk' },
			          { header : '건물명', name: 'bldNm',align:'left' , width : 300},
//			          { header : '특수지명', name: 'splotNm' },
//			          { header : '블록', name: 'block' },
//			          { header : '로트', name: 'lot' },
//			          { header : '지목코드', name: 'jimokCd' },
//			          { header : '지역코드', name: 'jiyukCd' },
//			          { header : '지구코드', name: 'jiguCd' },
//			          { header : '구역코드', name: 'guyukCd' },
//			          { header : '건축구분코드', name: 'archGbCdNm' },
			          { header : '구분', name: 'archGbCd',align:'center', width : 50},
			          { header : '대지면적(㎡)', name: 'platArea',align:'right', width : 100},
			          { header : '건축면적(㎡)', name: 'archArea',align:'right'  , width : 100},
			          { header : '건폐율(%)', name: 'bcRat',align:'right'  , width : 100},
			          { header : '연면적(㎡)', name: 'totArea',align:'right'  , width : 100},
			          { header : '용적률(%)', name: 'vlRat',align:'right'  , width : 100},
//			          { header : '주용도코드', name: 'mainPurpsCd' },
//			          { header : '주용도코드명', name: 'mainPurpsCdNm' },
//			          { header : '세대수(세대)', name: 'hhldCnt' },
//			          { header : '호수(호)', name: 'hoCnt' },
//			          { header : '가구수(가구)', name: 'fmlyCnt' },
			          { header : '주건축물수', name: 'mainBldCnt',align:'right'  },
			          { header : '부속건축물동수', name: 'atchBldDongCnt',align:'right'  },
			          { header : '총주차수', name: 'totPkngCnt',align:'right'  },
			          { header : '건축허가일', name: 'archPmsDay',align:'center'  , width : 80},
			          { header : '실제착공일', name: 'realStcnsDay' ,align:'center' , width : 80},
			          { header : '사용승인일', name: 'useAprDay',align:'center'  , width : 80},
			          { header : '지목코드명', name: 'jimokCdNm' , width : 100},
			          { header : '지구코드명', name: 'jiguCdNm' , width : 100},
			          { header : '구역코드명', name: 'guyukCdNm' , width : 100},
			          { header : '지역코드명', name: 'jiyukCdNm',align:'left' , width : 100},
			          { header : '연면적용적률산정(㎡)', name: 'vlRatEstmTotArea',align:'right'  , width : 100},
			          { header : '착공예정일', name: 'stcnsSchedDay',align:'center' , width : 80},
			          { header : '착공연기일', name: 'stcnsDelayDay',align:'center'  , width : 80},
			          { header : '생성일자', name: 'crtnDay',align:'center'  , width : 80},
			          
			          //,
//			          { header: '조감도', name: 'img001' } ,
//			          {
//			        	  header: '창고이미지',
//			              name: 'block',
//			              align: 'center',
//						 formatter({value}){
//							return '<img src="' + value.toString() + '" width="100" height="100" />';
//							return value.toString();
//						}	
//			          }
			        ],
			        columnOptions : {
			        	resizable:true
			        }
			        , data : json		        		        
			    });	  
			
//		Grid.setData(json);		  		
		}			
		

		// modal 층별 정보
		function fn_getModalBasisFloor(mgmPmsrgstPk){
//			alert('modal!');
			// var test = mgmPmsrgstPk.val();
			$.ajax({
				url: "getBasisFloor",
				type:"post", 
				data : {mgmPmsrgstPk: mgmPmsrgstPk},
				success : function(result){         
					set_pop();
				},
		        error: function() {
		            alert('Error occured' + mgbdrgpk);
		        }
		   	})
			$('#myModal').modal("show");
		}			
		
		
        //팝업 Setting 
        function set_pop() {
        	
			json = JSON.parse($("#modalGridData").val());
			$('#gridTotalCount').text(json.length);
			//표제부
			ModalGrid = new tui.Grid({						
			        el: document.getElementById('grid'),
	 		        pageOptions: {
			            perPage: 100,
			            useClient: true
			        }, 
			        scrollX: true,
			        scrollY: true,
			        useClientSort : true,
			        showDummyRows : true,
			        rowHeaders:['rowNum', 'checkbox'],		   
			        columns: [
			          { header : '관리허가대장PK', name: 'mgmPmsrgstPk' },
			          { header : '대지위치', name: 'platPlc' ,align:'left', width : 300}
			          
				        ],
				        columnOptions : {
				        	resizable:true
				        }
				        , data : json		        		        
		    });	  			          
        };
        
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal').hide();
        };

        
        
        

    </script>
		
		
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>



</head>

<body>
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
					<div class="form-group">
						<div class="checkbox col-lg-3 pull-left">
						 	<label class="pull-right">
	                        	<input type="checkbox" name="searchType" value="realStcnsDay" <c:if test="${fn:indexOf(searchVO.searchType, 'realStcnsDay')!=-1}">checked="checked"</c:if>/>
	                        	실제착공
	                        </label>
						 	<label class="pull-right">
	                        	<input type="checkbox" name="searchType" value="useAprDay" <c:if test="${fn:indexOf(searchVO.searchType, 'useAprDay')!=-1}">checked="checked"</c:if>/>
	                        	사용승인
	                        </label>
	                   </div>                    
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onclick="fn_formSubmit()">창고 찾기</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <text type="label" id="gridTotalCount" name="gridTotalCount"></text> : 건
                    </div>
                </div>
                	<input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
                	<input type="hidden" id="modalGridData" name="modalGridData" value='<c:out value="${searchVO.searchExt8}"/>' />
            </form>
    </div>
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

</script>	
	
<br>	
    <br>건축 인허가 정보(창고시설)<br>
    <div id="grid"></div>
<br>	
	
	   
<c:set var="whcode_temp" value="" />
</div>        
    <!--End items-->
   <br><br>
   

 <!-- modal 화면 start -->
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">층별정보</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />여기에 내용11</p>
                
                <div id="modalGrid"></div>
                
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->

 

<!-- modal 화면 end -->
   
</body>
</html>