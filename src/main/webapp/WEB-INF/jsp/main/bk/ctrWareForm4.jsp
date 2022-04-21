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
    <meta name="viewport" content="width=devifce-width, initial-scale=1">

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
//			if ( ! chkInputValue("#searchKeyword", "명칭 또는 주소 일부분 ")) return false;
//			if(Number($("#searchExt1").val()) >= Number($("#searchExt2").val())){
//				alert("하한선 값을 더 크게 지정하세요");
//				return false;
//			}
			document.formWama.submit();	
		}	
	
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="whfseq"]').each(function() {
				this.checked = chk; 
			})	
		} 	
	</script>
	
	<style>	
		table, th, td {
		  border: 1px solid grey;
		  border-collapse: collapse;
		}
		th, td {
		  text-align: center;
		}
	</style>	
	
</head>



<body>

 <a href="index.html">Home</a><br><br>
 <hr>
   *********** 창고정보등록_ref표제부 *********** 
 <hr>
    <!-- Start Contact -->
     <form role="form" id="formWama" name="formWama"  method="post" action="ctrWareSave">
	 <p style="font-size:14px">■ 건축물 개요</p>
  	 <input type="hidden" id="brpk" name="brpk"  value="${brpk}" > 
     <table>
     <tr>
	     <td> 
			<table style="font-size:12px;width:600px">
			<tbody  align="center">
				<tr>
					<td colspan="2" style="background:grey;color:white;">창고 기본정보</td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건물명</td>
					<td><input type="text" id="whname" name="whname" size="20" value="${wahama.whname}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">위치</td>
					<td><input type="text" style="color:grey;" id="mpadrs" name="mpadrs" size="50"  value="${wahama.mpadrs}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">대지면적</td>                                                                 
					<td><input style="text-align:right" type="text" id="szposi" name="szposi" size="7" value="${wahama.szposi}"  required ></td> <!--  pattern="#,###" -->
				</tr>				                                                                                               
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">건축면적</td>                                                                 
					<td><input style="text-align:right" type="text" id="szstrt" name="szstrt" size="7" value="${wahama.szstrt}"  required ></td>
				</tr>				                                                                                               
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">연면적</td>                                                                   
					<td><input style="text-align:right" type="text" id="szarea" name="szarea" size="7" value="${wahama.szarea}"  required ></td>
				</tr>						                                                                                       
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">건폐율(%)</td>                                                                
					<td><input style="text-align:right" type="text" id="sbcret" name="sbcret" size="7"  value="${wahama.sbcret}" required ></td> <!-- pattern="0.0%"  -->
				</tr>                                                                                                              
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">용적율(%)</td>                                                                
					<td><input style="text-align:right" type="text" id="svlret" name="svlret" size="7"  value="${wahama.svlret}" required ></td>
				</tr>						                                                                                       
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">용적률산정 연면적(㎡)</td>                                                    
					<td><input style="text-align:right" type="text" id="sbcvlt" name="sbcvlt" size="7" value="${wahama.sbcvlt}"  required ></td>
				</tr>						                                                                                       
				<tr>
					<td style="background: #FAFAFA;">사용승인일</td>
					<td><input style="text-align:center" type="text" id="prusdy" name="prusdy" size="8" value="${wahama.prusdy}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축물구조</td>
					<td><input type="text" id="ifstrt" name="ifstrt" size="20" value="${wahama.ifstrt}"  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">건축규모(층수)</td>
					<td>
					    지하 &nbsp;&nbsp; <input type="number" id="stflnu" name="stflnu" min="0" max="10"  value='' required > 
					  ~ 지상 &nbsp;&nbsp; <input type="number" id="stblnu" name="stblnu" min="0" max="10" value='' required >
					 </td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">투자사</td>
				<td><input type="text" id="cofine" name="cofine" size="13" value="${wahama.cofine}"  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">운영사</td>
					<td><input type="text" id="cooper" name="cooper" size="13" value="${wahama.cooper}"  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">인근IC</td>
					<td><input type="text" id="mpicif" name="mpicif" size="13" value="${wahama.mpicif}"  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">특이사항</td>
					<td><input type="text" id="etcstr" name="etcstr" size="13" value="${wahama.etcstr}"  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">인허가일</td>
					<td><input type="text" style="text-align:center;color:grey;" id="prprdy" name="prprdy" size="13" value="${wahama.prprdy}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">착공일</td>
					<td><input type="text" style="text-align:center;color:grey;" id="prstdy" name="prstdy" size="13" value="${wahama.prstdy}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축물대장번호</td>
					<td><input type="text" style="text-align:center;color:grey;" id="brcode" name="brcode" size="13" value="${wahama.brcode}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">좌표정보(카카오X,Y)</td>
					<td>
						<input type="text" style="text-align:center;color:grey;" id="kkompx" name="kkompx" size="10" value="${wahama.kkompx}" readOnly >
						<input type="text" style="text-align:center;color:grey;" id="kkompy" name="kkompy" size="10" value="${wahama.kkompx}" readOnly >
					</td>
				</tr>				
				</tbody>
				</table>
			</td>			
			<td>
				전경도<br>
					<img src="images/noimg_w200h150.gif" width="200px" height="150px" border="1px solid grey"><br>
				위치<br> 
					<div id="map" style="width:200px;height:150px;border:1px solid grey;"></div>
				배치도<br> 
					<img src="images/noimg_w200h150.gif" width="200px" height="150px" border="1px solid grey"><br>
			</td>
		</tr>	
		</table>	
<!--  		
		<p style="font-size:14px">■ 층별 정보</p>
		<table  style="font-size:12px; width=650px">
			<tbody>
			<thead align="center">
				<tr>
					<td>whfudn</td>
					<td>whflcd</td>
				</tr>
			</thead>
			<tbody  align="center">
				
					<tr>			
						<td><input id="wahaflVOList[0].whfudn" name="wahaflVOList[0].whfudn" value="${wahaflVOList[0].whfudn}"></td>
						<td><input id="wahaflVOList[0].whflcd" name="wahaflVOList[0].whflcd" value="${wahaflVOList[0].whflcd}"></td>
						<br>
						<td><input id="wahaflVOList[1].whfudn" name="wahaflVOList[1].whfudn" value="${wahaflVOList[1].whfudn}"></td>
						<td><input id="wahaflVOList[1].whflcd" name="wahaflVOList[1].whflcd" value="${wahaflVOList[1].whflcd}"></td>
					</tr>
					
			</tbody>
		</table>
			
	-->
		

		<p style="font-size:14px">■ 층별 정보</p>
		<table  style="font-size:12px; width=650px">
			<tbody>
			<thead align="center">
				<tr>
					<td rowspan=2>선택<input id="chkall" name="chkall" title="모두선택" onclick="fnCheckAll()" type="checkbox"></td>
					<td rowspan=2>지상/지하</td>
					<td rowspan=2>층</td>
					<td rowspan=2>주용도</td>
					<td rowspan=2>온도</td>	
					<td rowspan=2>층면적(바닥)</td>	
					<td rowspan=2>층면적(임대)</td>
					<td colspan=4>바닥면적</td>
					<td colspan=4>임대면적</td>
					<td colspan=3>임대료</td>
					<td colspan=2>임대가능시점</td>
					<td colspan=6>추가정보</td>
					<td rowspan=2>상태</td>
				</tr>
				<tr>
					<td>창고</td>	
					<td>사무실</td>	
					<td>도크</td>	
					<td>메자닌</td>	
					<td>창고</td>	
					<td>사무실</td>	
					<td>도크</td>	
					<td>메자닌</td>	
					
					<td>임대료</td>	
					<td>관리비</td>	
					<td>평단가</td>
					<td>From</td>	
					<td>To</td>
					<td>유효층고</td>	
					<td>Dock수</td>	
					<td>적재하중</td>	
					<td>입주업체1</td>	
					<td>입주업체2</td>	
					<td>입주업체3</td>	
				</tr>
			</thead>				
			<tbody  align="center">
				<c:forEach var="wahafl" items="${wahaflVOList}" varStatus="status">
				<tr>
				<td>${status.count} <input  name='whfseq' type='checkbox' value="${status.count}"></td>
					<td>
						<select id="whfudn" name="whfudn" required>
						  <option value="지상" <c:if test="${wahafl.whfudn eq '지상'}">selected</c:if>>지상</option>
						  <option value="지하" <c:if test="${wahafl.whfudn eq '지하'}">selected</c:if>>지하</option>
						  <option value="옥탑" <c:if test="${wahafl.whfudn eq '옥탑'}">selected</c:if>>옥탑</option>
						</select>
					</td>
					<td>
						<select id="whflcd" name="whflcd" required>
						  <option value="1" <c:if test="${wahafl.whflcd eq '1'}">selected</c:if>>1</option>
						  <option value="2" <c:if test="${wahafl.whflcd eq '2'}">selected</c:if>>2</option>
						  <option value="3" <c:if test="${wahafl.whflcd eq '3'}">selected</c:if>>3</option>
						  <option value="4" <c:if test="${wahafl.whflcd eq '4'}">selected</c:if>>4</option>
						  <option value="5" <c:if test="${wahafl.whflcd eq '5'}">selected</c:if>>5</option>
						  <option value="6" <c:if test="${wahafl.whflcd eq '6'}">selected</c:if>>6</option>
						  <option value="7" <c:if test="${wahafl.whflcd eq '7'}">selected</c:if>>7</option>
						  <option value="8" <c:if test="${wahafl.whflcd eq '8'}">selected</c:if>>8</option>
						  <option value="9" <c:if test="${wahafl.whflcd eq '9'}">selected</c:if>>9</option>
						</select>
					</td>	
					<td> ${wahafl.whflnm}
						<select id="whfuse" name="whfuse" required>
						  <option value=" "></option>
						  <option value="창고">창고</option>
						  <option value="사무실">사무실</option>
						  <option value="기타공용">기타공용</option>
						</select>
					<td>
						<select id="whtemp" name="whtemp" required>
						  <option value=" "></option>
						  <option value="상온">상온</option>
						  <option value="냉장">냉장</option>
						  <option value="냉동">냉동</option>
						  <option value="위험물">위험물</option>
						</select>
					</td>
  					<td><input style="text-align:right" type="text"  name="flarea" size="6"  value="${wahafl.flarea}"  required ></td> 
					<td><input style="text-align:right" type="text"  name="fllmsz" size="6"  value="${wahafl.fllmsz}"   ></td>
					<td><input style="text-align:right" type="text"  name="flszwa" size="6"  value="${wahafl.flszwa}"  ></td>
					<td><input style="text-align:right" type="text"  name="flszof" size="6"  value="${wahafl.flszof}"  ></td>
					<td><input style="text-align:right" type="text"  name="flszdo" size="6"  value="${wahafl.flszdo}"  ></td>
					<td><input style="text-align:right" type="text"  name="flszmz" size="6"  value="${wahafl.flszmz}"  ></td>
					<td><input style="text-align:right" type="text"  name="flslwa" size="6"  value="${wahafl.flslwa}"  ></td>
					<td><input style="text-align:right" type="text"  name="flslof" size="6"  value="${wahafl.flslof}"  ></td>
					<td><input style="text-align:right" type="text"  name="flsldo" size="6"  value="${wahafl.flsldo}"  ></td>
					<td><input style="text-align:right" type="text"  name="flslmz" size="6"  value="${wahafl.flslmz}"  ></td>
					<td><input style="text-align:center" type="text" name="flmpay" size="4" value="${wahafl.flmpay}"  ></td>
					<td><input style="text-align:center" type="text" name="admpay" size="4" value="${wahafl.admpay}"  ></td>
					<td><input style="text-align:center" type="text" name="pprice" size="4" value="${wahafl.pprice}"  ></td>
					<td><input style="text-align:center" type="date" name="lsfrom" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lsfrom}"  ></td>
					<td><input style="text-align:center" type="date" name="lstmto" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lstmto}"  ></td>
					<td><input style="text-align:right"  type="text" name="flhegt" size="4" value="${wahafl.flhegt}"  ></td>
					<td><input style="text-align:right"  type="text" name="docknu" size="4" value="${wahafl.docknu}"  ></td>
					<td><input style="text-align:right"  type="text" name="flweit" size="4" value="${wahafl.flweit}"  ></td>
					<td><input style="text-align:center" type="text" name="lsusr1" size="10" value="${wahafl.lsusr1}"  ></td>
					<td><input style="text-align:center" type="text" name="lsusr2" size="10" value="${wahafl.lsusr2}"  ></td>
					<td><input style="text-align:center" type="text" name="lsusr3" size="10" value="${wahafl.lsusr3}"  ></td>
					<td><input style="text-align:center" type="text" name="status" size="10" value="${wahafl.status}"  ></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>	
		<br>
		<center>
	    <button type="button" onclick="fn_formSubmit()"> 창고등록하기 </button>
		</center>
		<br>
	<button  type="button"  onclick="saveWareInfo()"> test1 </button>
   </form>
   <br><br><br><br>
	<button id="BtnFor"> 버튼FOR </button>
	<button id="BtnEach"> 버튼EACH </button>
   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${wahama.mpadrs}", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        document.getElementById("kkompx").value = result[0].y;
        document.getElementById("kkompy").value = result[0].x;
        
        
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>

<script>

function saveWareInfo(){
	
// 	var test = document.getElementsByName('whname');
	
// 	alert(test.value);
	
	
	// wahama 정보
	var wamaData = new Object();
	wamaData.whname = $("#whname").val();
	wamaData.mpadrs = $("#mpadrs").val();
	wamaData.szposi = $("#szposi").val();
	wamaData.szstrt = $("#szstrt").val();
	wamaData.szarea = $("#szarea").val();
	wamaData.sbcret = $("#sbcret").val();
	wamaData.svlret = $("#svlret").val();
	wamaData.sbcvlt = $("#sbcvlt").val();
	wamaData.prusdy = $("#prusdy").val();
	wamaData.ifstrt = $("#ifstrt").val();
	wamaData.cofine = $("#cofine").val();
	wamaData.cooper = $("#cooper").val();
	wamaData.etcstr = $("#etcstr").val();
	wamaData.prprdy = $("#prprdy").val();
	wamaData.prstdy = $("#prstdy").val();
	wamaData.brcode = $("#brcode").val();
	wamaData.kkompx = $("#kkompx").val();
	wamaData.kkompy = $("#kkompy").val();
	wamaData = JSON.stringify(wamaData);
	var jsonWama = new Object();
	jsonWama.wahamaJVO = JSON.parse(wamaData)
	

	var jsonArr = new Array();
	var jsonArrWM = new Array();		
//	for (var i=0; i<chked.length; i++) {
		var jsonData = new Object();
		jsonData.userid = "userid111";
		jsonData.username = "username111";				
		jsonData = JSON.stringify(jsonData);
		jsonArr.push(JSON.parse(jsonData));
		
		var jsonData = new Object();
		jsonData.userid = "userid222";
		jsonData.username = "username222";				
		jsonData = JSON.stringify(jsonData);
		jsonArr.push(JSON.parse(jsonData));
		
		var jsonData = new Object();
		jsonData.userid = "userid333";
		jsonData.username = "username333";				
		jsonData = JSON.stringify(jsonData);
		jsonArr.push(JSON.parse(jsonData));
		
//		var jsonWama = new Object();
//		jsonWama.wahamaVO = jsonArr



//		jsonWama = JSON.stringify(jsonWama);
//		jsonArrWM.push(JSON.parse(jsonWama));
//}

	
	$.ajax({
				url: "ctrWareSave",
				type:"post", 
				dataType: 'json',
				processData : true,
				contentType: 'application/json',					
				data: JSON.stringify(jsonWama),
				success : function(result){         
                    if(result.code == "OK") {
                        alert("OK");
                    } else {
                        alert("NG");
                    }
				},
		        error: function() {
		            alert('Error occured' + brcode);
		        }
		   	})		
	}

	function test1(){
			var size = $("input[name='flarea']").length;
		    for(i=0;i<size;i++){
		      alert( i + "번째  : " + $("input[name='flarea']").eq(i).attr("value") );
		      var name = document.getElementsByName('flarea');
		      alert(name[i].value);
		   }	
		}

</script>


</body>
</html>
