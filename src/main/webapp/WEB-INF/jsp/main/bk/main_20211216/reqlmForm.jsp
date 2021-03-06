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
 &nbsp;&nbsp;&nbsp;<a href="reqlmForm">???????????? ????????????</a>
 &nbsp;&nbsp;&nbsp;<a href="reqlmlist">???????????? ?????????</a>
 <hr>
   *********** ???????????? ???????????? *********** 
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
                   <th>??????</th>
                   <th>??????</th>
                   <th>?????????</th>
                 </tr>
               </thead>
               <tbody>
                 <tr>
                   <th rowspan=3>??????????????????</th>
                   <td>????????? </td>
                   <td>
                    <input type="text" id="requsr" name="requsr" size="13" value='<c:out value="${reqlmInfo.requsr}"/>' required >
                   </td>
                 </tr>
                 <tr>
                   <td>????????? </td>
                   <td><input type="date" id=reqday name="reqday" min="2021-12-01" max="2030-12-31" value='<c:out value="${reqlmInfo.reqday}"/>' required></td>
                 </tr>
                 <tr>
                   <td>???????????? </td>
                   <td><input type="time" id=reqtim name="reqtim"  min="09:00" max="18:00"  value='<c:out value="${reqlmInfo.reqtim}"/>' required></td>
                 </tr>
                 <tr>
                   <th rowspan=2>???????????? ?????????</th>
                   <td>???????????? </td>
                   <td>
						<input type="radio" value="direct" name="rqifcd" checked>Direct
						<input type="radio" value="cowork" name="rqifcd" >???????????? 
                   </td>
                 </tr>
                 <tr>
                   <td>????????????</td>
                   <td>
                   	   <div id = "div_direct">
	                   	   Direct?????????
		                   <input type="text" id="rqiusr" name="rqiusr"  size="13"  value='<c:out value="${reqlmInfo.rqiusr}"/>'  >
	                   </div>
                   	   <div id = "div_cowork" style="display:none"> 
		                   ??????????????? : <input type="text" id="rqicop" name="rqicop"  size="13"  value='<c:out value="${reqlmInfo.rqicop}"/>'><br>
		                   ????????? : <input type="text" id="rqiman" name="rqiman"  size="13"  value='<c:out value="${reqlmInfo.rqiman}"/>'><br>
		                   ???????????? : <input type="tel" id="rqitel" name="rqitel"  size="13"  value='<c:out value="${reqlmInfo.rqitel}"/>'>
	                   </div>
                   </td>
                 </tr>
                 
                 <tr>
                   <th rowspan=7>???????????? ??????</th>
                   <td>????????? </td>
                   <td><input type="text" id="lmcopr" name="lmcopr"  size="13"  value='<c:out value="${reqlmInfo.lmcopr}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>????????? </td>
                   <td><input type="text" id="lmcont" name="lmcont"  size="13"  value='<c:out value="${reqlmInfo.lmcont}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>?????? </td>
                   <td><input type="text" id="lmsitr" name="lmsitr"  size="13"  value='<c:out value="${reqlmInfo.lmsitr}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>????????? </td>
                   <td><input type="text" id="lmtelp" name="lmtelp"  size="13"  value='<c:out value="${reqlmInfo.lmtelp}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>????????? </td>
                   <td><input type="email" id="lmemal" name="lmemal"  size="13"  value='<c:out value="${reqlmInfo.lmemal}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>????????? </td>
                   <td><input type="text" id="lmcapi" name="lmcapi"  size="13"  value='<c:out value="${reqlmInfo.lmcapi}"/>'  required></td>
                 </tr>
                 <tr>
                   <td>?????? </td>
                   <td><input type="text" id="lmbzcr" name="lmbzcr"  size="13"  value='<c:out value="${reqlmInfo.lmbzcr}"/>'  required></td>
                 </tr>
                 
                 <tr>
                   <th rowspan=6>??????????????????</th>
                   <td>???????????? </td>
                   <td>
						<select id="lmppse" name="lmppse" required>
						  <option value="">???????????????</option>
						  <option value="????????????">????????????</option>
						  <option value="????????????">????????????</option>
						  <option value="????????????">????????????</option>
						  <option value="????????????">????????????</option>
						  <option value="etc">??????</option>
						</select>
						<div id="lmppse_etc" style="display:none"> 
							<input type="text" id="lmpetc" name="lmpetc" value='<c:out value="${reqlmInfo.lmpetc}"/>'>                      
						</div>
                   </td>
                 </tr>
                 <tr>
                   <td>???????????? </td>
                   <td>
						<input type="checkbox" value="??????" name="lmtemp" >??????
						<input type="checkbox" value="??????" name="lmtemp" >?????? 
						<input type="checkbox" value="??????" name="lmtemp" >?????? 
						<input type="checkbox" value="?????????" name="lmtemp" >????????? 
						<input type="checkbox" value="etc" name="lmtemp" >?????? 
                   </td>
                 </tr>
                 <tr>
                   <td>???????????? </td>
                  <td>						
					<input type="number" id="lmsize" name="lmsize" size="13" value='<c:out value="${reqlmInfo.lmsize}"/>'  required>???                      
				  </td>
                 </tr>
                 <tr>
                   <td>????????????</td>
                   <td>
						<input type="radio" value="all" name="larea0" checked>??????
						<input type="radio" value="sudo" name="larea0">?????????
						<input type="radio" value="notsudo" name="larea0">????????????
						<br>
						????????????
						<input type="text" name="larea1" size="8" value='<c:out value="${reqlmInfo.larea1}"/>' >
						<input type="text" name="larea2" size="8" value='<c:out value="${reqlmInfo.larea2}"/>' >
						<input type="text" name="larea3" size="8" value='<c:out value="${reqlmInfo.larea3}"/>' >
                   </td>
                 </tr>                    
                 <tr>
                   <td>?????????????????? </td>
                   <td>
					<input type="number" name="lminyy" min="2021" max="2030" value='<c:out value="${reqlmInfo.lminyy}"/>' >???
					<input type="number" name="lminmm" min="1" max="12" value='<c:out value="${reqlmInfo.lminmm}"/>' >???
					<input type="number" name="lminqq" min="1" max="4" value='<c:out value="${reqlmInfo.lminqq}"/>' >??????
                   <td>
                 </tr>                    
                 <tr>
                   <td>???????????? </td>
                   <td>
         	         <input type="number" id="stretc" name="stretc" min="1" max="10" value='<c:out value="${reqlmInfo.stretc}"/>' required>???
                   </td>
                 </tr> 
                 <tr>
                   <td colspan=3>
                   	<br>
                    	<button type="submit">????????????</button>
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
