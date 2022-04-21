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
	 <p color:black; font-size:14px">■ 건축물 개요</p>
     <table>
     <tr>
	     <td> 
			<table  width="600px" style="font-size:12px">
			<tbody  align="center">
				<tr>
					<td colspan="2" style="background:grey;color:white;">창고 기본정보</td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건물명</td>
					<td><input type="text" id="whname" name="whname" size="20" value='<c:out value="${wahama.whname}"/>' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">위치</td>
					<td><input type="text" id="mpadrs" name="mpadrs" size="50"  value='<c:out value="${wahama.mpadrs}"/>' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">대지면적</td>
					<td><input type="number" id="szposi" name="szposi" size="13" value='<c:out value="${wahama.szposi}"/>' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축면적</td>
					<td><input type="number" id="szstrt" name="szstrt" size="13" value='<c:out value="${wahama.szstrt}"/>'  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">연면적</td>
					<td><input type="number" id="szarea" name="szarea" size="13" value='<c:out value="${wahama.szarea}"/>'  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">건폐율(%)</td>
					<td><input type="number" id="sbcret" name="sbcret" size="13" value='<c:out value="${wahama.sbcret}"/>'  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">용적율(%)</td>
					<td><input type="number" id="svlret" name="svlret" size="13" value='<c:out value="${wahama.svlret}"/>'  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">용적률산정 연면적(㎡)</td>
					<td><input type="number" id="sbcvlt" name="sbcvlt" size="13" value='<c:out value="${wahama.sbcvlt}"/>'  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">사용승인일</td>
					<td><input type="text" id="prusdy" name="prusdy" size="13" value='<c:out value="${wahama.prusdy}"/>'  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축규모(층수)</td>
					
					<td>지하<input type="number" id="requsr" name="requsr" size="2" value='' required >~지상<input type="number" id="requsr" name="requsr" size="2" value='' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">투자사</td>
				<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">운영사</td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">인근IC</td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">특이사항</td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>				
				</tbody>
				</table>			
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
		
			
		<p color:black; font-size:14px">■ 층별 정보</p>
		<table width=650px style="font-size:12px">
			<tbody>
			<thead align="center">
				<tr>
					<td rowspan="2" style="background: #59ab6e;color:white;">층</td>
					<td rowspan="2" style="background: #59ab6e;color:white;">층별면적<br>(sum)</td>
					<td colspan="4" style="background: #59ab6e;color:white;">층별면적</td>
					<td colspan="3" style="background: #59ab6e;color:white;">임대조건(평,원)</td>
					<td colspan="4" style="background: #59ab6e;color:white;">층별SPEC</td>
				</tr>
				<tr>
					<td style="background: #59ab6e;color:white;">창고</td>
					<td style="background: #59ab6e;color:white;">하역도크</td>
					<td style="background: #59ab6e;color:white;">사무실</td>
					<td style="background: #59ab6e;color:white;">메자닌</td>			
					
					<td style="background: #59ab6e;color:white;">입주시기</td>
					<td style="background: #59ab6e;color:white;">계약면적</td>
					<td style="background: #59ab6e;color:white;">임대료/평</td>

					<td style="background: #59ab6e;color:white;">유효고</td>
					<td style="background: #59ab6e;color:white;">접안방식</td>
					<td style="background: #59ab6e;color:white;">도크수</td>
					<td style="background: #59ab6e;color:white;">온도범위</td>			
				<tr>
			</thead>				
			<tbody  align="center">
				<tr>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>
				<tr>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>
				<tr>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
					<td><input type="text" id="requsr" name="requsr" size="13" value='' required ></td>
				</tr>
			
			</tbody>
		</table>	
   </form>
   
</body>
</html>
