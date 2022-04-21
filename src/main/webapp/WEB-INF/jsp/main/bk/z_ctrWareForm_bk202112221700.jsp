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
//			if ( ! chkInputValue("#searchKeyword", "명칭 또는 주소 일부분 ")) return false;
//			if(Number($("#searchExt1").val()) >= Number($("#searchExt2").val())){
//				alert("하한선 값을 더 크게 지정하세요");
//				return false;
//			}
			document.form1.submit();	
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
     <form role="form" id="form1" name="form1"  method="post" action="ctrWareSave">
	 <p style="font-size:14px">■ 건축물 개요</p>
<!--  	 <input type="hidden" id="brpk" name="brpk"  value="${brpk}" > -->
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
					<td><input type="text" id="mpadrs" name="mpadrs" size="50"  value="${wahama.mpadrs}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">대지면적sss</td>
					<td><input style="text-align:right" type="text" id="szposi" name="szposi" size="7" value="<fmt:formatNumber value="${wahama.szposi}" />" required ></td> <!--  pattern="#,###" -->
				</tr>				
				<tr>                                                                                                                           
					<td style="background: #FAFAFA;">건축면적</td>                                                                             
					<td><input style="text-align:right" type="text" id="szstrt" name="szstrt" size="7" value="<fmt:formatNumber value="${wahama.szstrt}"  />"  required ></td>
				</tr>				                                                                                                           
				<tr>                                                                                                                           
					<td style="background: #FAFAFA;">연면적</td>
					<td><input style="text-align:right" type="text" id="szarea" name="szarea" size="7" value="<fmt:formatNumber value="${wahama.szarea}"  />"  required ></td>
				</tr>						                                                                                                   
				<tr>
					<td style="background: #FAFAFA;">건폐율(%)</td>
					<td><input style="text-align:right" type="text" id="sbcret" name="sbcret" size="7" value="<fmt:formatNumber type="percent" value="${wahama.sbcret}"  />"  required ></td> <!-- pattern="0.0%"  -->
				</tr>
				<tr>
					<td style="background: #FAFAFA;">용적율(%)</td>                                                                            
					<td><input style="text-align:right" type="text" id="svlret" name="svlret" size="7" value="<fmt:formatNumber type="percent" value="${wahama.svlret}"  />"  required ></td>
				</tr>						                                                                                                   
				<tr>                                                                                                                           
					<td style="background: #FAFAFA;">용적률산정 연면적(㎡)</td>                                                                
					<td><input style="text-align:right" type="text" id="sbcvlt" name="sbcvlt" size="7" value="<fmt:formatNumber value="${wahama.sbcvlt}"  />"  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">사용승인일</td>
					<td><input style="text-align:center" type="text" id="prusdy" name="prusdy" size="8" value="${wahama.prusdy}"  required ></td>
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
					<td><input type="text" id="prprdy" name="prprdy" size="13" value="${wahama.prprdy}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">착공일</td>
					<td><input type="text" id="prstdy" name="prstdy" size="13" value="${wahama.prstdy}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축물대장번호</td>
					<td><input type="text" id="brcode" name="brcode" size="13" value="${wahama.brcode}" readOnly ></td>
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
<!--  -->		
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
				<c:forEach var="wahafl" items="${listview}" varStatus="status">
				<tr>
					<td>${status.count} <input id='whfseq' name='whfseq' type='checkbox' value="${status.count}"></td>
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
						  <option value=""></option>
						  <option value="창고">창고</option>
						  <option value="사무실">사무실</option>
						  <option value="기타공용">기타공용</option>
						</select>
					<td>
						<select id="whtemp" name="whtemp" required>
						  <option value=""></option>
							  <option value="상온">상온</option>
						  <option value="냉장">냉장</option>
						  <option value="냉동">냉동</option>
						  <option value="위험물">위험물</option>
						</select>
					</td>
					<td><input style="text-align:right" type="text" id="flarea" name="flarea" size="6" value="<fmt:formatNumber value="${wahafl.flarea}" pattern="#,###" />" required ></td>
					<td><input style="text-align:right" type="text" id="fllmsz" name="fllmsz" size="6" value="<fmt:formatNumber value="${wahafl.fllmsz}" pattern="#,###" />"  ></td>
					                                                                                
					<td><input style="text-align:right" type="text" id="flszwa" name="flszwa" size="6" value="<fmt:formatNumber value="${wahafl.flszwa}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flszof" name="flszof" size="6" value="<fmt:formatNumber value="${wahafl.flszof}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flszdo" name="flszdo" size="6" value="<fmt:formatNumber value="${wahafl.flszdo}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flszmz" name="flszmz" size="6" value="<fmt:formatNumber value="${wahafl.flszmz}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flslwa" name="flslwa" size="6" value="<fmt:formatNumber value="${wahafl.flslwa}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flslof" name="flslof" size="6" value="<fmt:formatNumber value="${wahafl.flslof}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flsldo" name="flsldo" size="6" value="<fmt:formatNumber value="${wahafl.flsldo}" pattern="#,###" />" ></td>
					<td><input style="text-align:right" type="text" id="flslmz" name="flslmz" size="6" value="<fmt:formatNumber value="${wahafl.flslmz}" pattern="#,###" />" ></td>
					
					<td><input style="text-align:center" type="text" id="flmpay" name="flmpay" size="4" value="${wahafl.flmpay}"  ></td>
					<td><input style="text-align:center" type="text" id="admpay" name="admpay" size="4" value="${wahafl.admpay}"  ></td>
					<td><input style="text-align:center" type="text" id="pprice" name="pprice" size="4" value="${wahafl.pprice}"  ></td>
					<td><input style="text-align:center" type="date" id="lsfrom" name="lsfrom" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lsfrom}"  ></td>
					<td><input style="text-align:center" type="date" id="lstmto" name="lstmto" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lstmto}"  ></td>
					<td><input style="text-align:center" type="text" id="flhegt" name="flhegt" size="4" value="${wahafl.flhegt}"  ></td>
					<td><input style="text-align:center" type="text" id="docknu" name="docknu" size="4" value="${wahafl.docknu}"  ></td>
					<td><input style="text-align:center" type="text" id="flweit" name="flweit" size="4" value="${wahafl.flweit}"  ></td>
					<td><input style="text-align:center" type="text" id="lsusr1" name="lsusr1" size="10" value="${wahafl.lsusr1}"  ></td>
					<td><input style="text-align:center" type="text" id="lsusr2" name="lsusr2" size="10" value="${wahafl.lsusr2}"  ></td>
					<td><input style="text-align:center" type="text" id="lsusr3" name="lsusr3" size="10" value="${wahafl.lsusr3}"  ></td>
					<td><input style="text-align:center" type="text" id="lsusr3" name="status" size="10" value="${wahafl.status}"  ></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>	
		<br>
		<center>
	    <button type="button" onclick="fn_formSubmit()"> 창고등록하기 </button>
		</center>
		<br>
   </form>
   <br><br><br><br>
</body>
</html>
