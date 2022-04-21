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
		$(document).ready(function(){
			
		  $("input:radio[name=rqifcd]").click(function(){
		    if($("input[name=rqifcd]:checked").val() == "direct"){
	    	   $('#div_direct').show();	
	    	   $('#div_cowork').hide();	
		    }else{
	    	   $('#div_cowork').show();	
	    	   $('#div_direct').hide();	
		    }
		  });

		  $('#lmppse').on('change',function(){
			if($(this).val() == 'etc'){
		       $('#lmppse_etc').show();	
			}else{
		       $('#lmppse_etc').hide();	
			};
		  });
		  
		  $('#lmsize').on('change',function(){
			if($(this).val() == 'etc'){
		       $('#lmsize_etc').show();	
			}else{
		       $('#lmsize_etc').hide();	
			};
		  });
		  
		  $("input:radio[name=larea1]").click(function(){
		    if($("input[name=larea1]:checked").val() == "etc"){
	    	   $('#larea1_etc').show();	
		    }else{
	    	   $('#larea1_etc').hide();	
		    }
		  });		  
		  
		});	

		
/* 		$(document).ready(function(){
			$('#lmppse').on('change',function(){
				if($(this).val() == 'etc'){
		    	   $('#lmppse_etc').show();	
				}else{
		    	   $('#lmppse_etc').hide();	
				};
		  });
		});			
 */		
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
 &nbsp;&nbsp;&nbsp;<a href="reqlmForm">임차의뢰 정보등록</a>
 &nbsp;&nbsp;&nbsp;<a href="reqlmlist">임차의뢰 리스트</a>
 <hr>
   *********** 임차의뢰 정보등록 *********** 
 <hr>
    <!-- Start Contact -->
        <form role="form" id="form1" name="form1"  method="post" action="reqlmSave">
             <table>
               <colgroup>
                 <col width="150px">
                 <col width="150px">
                 <col width="400px">
               </colgroup>
               <thead>
                 <tr>
                   <th>구분</th>
                   <th>항목</th>
                   <th>입력값</th>
                 </tr>
               </thead>
               <tbody>
                 <tr>
                   <th rowspan=3>의뢰접수정보</th>
                   <td>접수자 </td>
                   <td>
                    <input type="text" id="requsr" name="requsr" size="13" value='<c:out value="${reqlmInfo.requsr}"/>' required >
                   </td>
                 </tr>
                 <tr>
                   <td>접수일 </td>
                   <td><input type="date" id=reqday name="reqday" min="2021-12-01" max="2030-12-31" value='<c:out value="${reqlmInfo.reqday}"/>' required></td>
                 </tr>
                 <tr>
                   <td>접수시간 </td>
                   <td><input type="time" id=reqtim name="reqtim"  min="09:00" max="18:00"  value='<c:out value="${reqlmInfo.reqtim}"/>' required></td>
                 </tr>
                 <tr>
                   <th rowspan=2>의뢰정보 제공처</th>
                   <td>제공유형 </td>
                   <td>
						<input type="radio" value="direct" name="rqifcd" checked>Direct
						<input type="radio" value="cowork" name="rqifcd" >공동중계 
                   </td>
                 </tr>
                 <tr>
                   <td>제공담당</td>
                   <td>
                   	   <div id = "div_direct">
	                   	   Direct담당자
		                   <input type="text" id="rqiusr" name="rqiusr"  size="13"  value='<c:out value="${reqlmInfo.rqiusr}"/>'  >
	                   </div>
                   	   <div id = "div_cowork" style="display:none"> 
		                   공동중개사 : <input type="text" id="rqicop" name="rqicop"  size="13"  value='<c:out value="${reqlmInfo.rqicop}"/>'><br>
		                   담당자 : <input type="text" id="rqiman" name="rqiman"  size="13"  value='<c:out value="${reqlmInfo.rqiman}"/>'><br>
		                   전화번호 : <input type="tel" id="rqitel" name="rqitel"  size="13"  value='<c:out value="${reqlmInfo.rqitel}"/>'>
	                   </div>
                   </td>
                 </tr>
                 
                 <tr>
                   <th rowspan=7>실임차인 정보</th>
                   <td>기업명 </td>
                   <td><input type="text" id="lmcopr" name="lmcopr"  size="13"  value='<c:out value="${reqlmInfo.lmcopr}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>담당자 </td>
                   <td><input type="text" id="lmcont" name="lmcont"  size="13"  value='<c:out value="${reqlmInfo.lmcont}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>직위 </td>
                   <td><input type="text" id="lmsitr" name="lmsitr"  size="13"  value='<c:out value="${reqlmInfo.lmsitr}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>연락처 </td>
                   <td><input type="text" id="lmtelp" name="lmtelp"  size="13"  value='<c:out value="${reqlmInfo.lmtelp}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>이메일 </td>
                   <td><input type="email" id="lmemal" name="lmemal"  size="13"  value='<c:out value="${reqlmInfo.lmemal}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>매출액 </td>
                   <td><input type="text" id="lmcapi" name="lmcapi"  size="13"  value='<c:out value="${reqlmInfo.lmcapi}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>명함 </td>
                   <td><input type="text" id="lmbzcr" name="lmbzcr"  size="13"  value='<c:out value="${reqlmInfo.lmbzcr}"/>'  required></td>
                 </tr>
                 
                 <tr>
                   <th rowspan=6>희망임차조건</th>
                   <td>임차목적 </td>
                   <td>
						<select id="lmppse" name="lmppse" required>
						  <option value="">선택하세요</option>
						  <option value="일반창고">일반창고</option>
						  <option value="생산창고">생산창고</option>
						  <option value="물류창고">물류창고</option>
						  <option value="조립창고">조립창고</option>
						  <option value="etc">기타</option>
						</select>
						<div id="lmppse_etc" style="display:none"> 
							<input type="text" id="lmpetc" name="lmpetc" value='<c:out value="${reqlmInfo.lmpetc}"/>'>                      
						</div>
                   </td>
                 </tr>
                 <tr>
                   <td>요구온도 </td>
                   <td>
						<input type="checkbox" value="상온" name="lmtemp" >상온
						<input type="checkbox" value="냉동" name="lmtemp" >냉동 
						<input type="checkbox" value="냉장" name="lmtemp" >냉장 
						<input type="checkbox" value="위험물" name="lmtemp" >위험물 
						<input type="checkbox" value="etc" name="lmtemp" >기타 
                   </td>
                 </tr>
                 <tr>
                   <td>요구면적 </td>
                  <td>						
					<input type="number" id="lmsize" name="lmsize" size="13" value='<c:out value="${reqlmInfo.lmsize}"/>'  required>평                      
				  </td>
                 </tr>
                 <tr>
                   <td>희망지역</td>
                   <td>
						<input type="radio" value="all" name="larea0" checked>전국
						<input type="radio" value="sudo" name="larea0">수도권
						<input type="radio" value="notsudo" name="larea0">수도권외
						<br>
						선호지역
						<input type="text" name="larea1" size="8" value='<c:out value="${reqlmInfo.larea1}"/>' >
						<input type="text" name="larea2" size="8" value='<c:out value="${reqlmInfo.larea2}"/>' >
						<input type="text" name="larea3" size="8" value='<c:out value="${reqlmInfo.larea3}"/>' >
                   </td>
                 </tr>                    
                 <tr>
                   <td>입주희망시점 </td>
                   <td>
					<input type="number" name="lminyy" min="2021" max="2030" value='<c:out value="${reqlmInfo.lminyy}"/>' >년
					<input type="number" name="lminmm" min="1" max="12" value='<c:out value="${reqlmInfo.lminmm}"/>' >월
					<input type="number" name="lminqq" min="1" max="4" value='<c:out value="${reqlmInfo.lminqq}"/>' >분기
                   <td>
                 </tr>                    
                 <tr>
                   <td>계약기간 </td>
                   <td>
         	         <input type="number" id="stretc" name="stretc" min="1" max="10" value='<c:out value="${reqlmInfo.stretc}"/>' required>년
                   </td>
                 </tr> 
                 <tr>
                   <td colspan=3>
                   	<br>
                    	<button type="submit">등록하기</button>
                   	<br>
                   </td>
                 </tr>                                       
               </tbody>
             </table>
       </form>
	
<br>	
    <div id="grid"></div>
<br>	
   
</body>
</html>
