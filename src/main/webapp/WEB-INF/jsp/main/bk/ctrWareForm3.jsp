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



			document.formWama.submit();	
		}	
		
		
	</script>
	
	
</head>



<body>

 <a href="index.html">Home</a><br><br>
 <hr>
   *********** 창고정보등록_ref표제부 *********** 
 <hr>
    <!-- Start Contact -->
     <form role="form" id="formWama" name="formWama"  method="post" action="testSave">
	 <p style="font-size:14px">■ 건축물 개요</p>
  	 <input type="hidden" id="brpk" name="brpk"  value="${brpk}" > 
     <table>
     <tr>
	     <td> 
			<table style="font-size:12px;width:600px">
			<tbody  align="center">
				<tr>
					<td style="background:grey;color:white;">창고 기본정보</td>
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
		</tr>	
		</table>	

		<p style="font-size:14px">■ 층별 정보</p>
		<table  style="font-size:12px; width=650px">
			<tbody>
			<thead align="center">
				<tr>
					<td>선택<input id="chkall" name="chkall" title="모두선택" onclick="fnCheckAll()" type="checkbox"></td>
					<td>지상/지하</td>
					<td>층</td>
					<td>주용도</td>
					<td>온도</td>	
					<td>층면적(바닥)</td>	
				</tr>
			</thead>				
			<tbody  align="center">
				<c:forEach var="wahafl" items="${wahafl}" varStatus="status">
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
  					<td><input style="text-align:right" type="text" name="flarea" size="6"  value="${wahafl.flarea}"  required ></td> 
				</tr>
				</c:forEach>
			</tbody>
		</table>	
		<br>
		<center>
	    <button type="button" onclick="fn_formSubmit()"> 창고등록하기 </button>
		</center>
		<br>
	<button  type="button"  onclick="test1()"> test1 </button>
   </form>
   <br><br><br><br>


<script>

	function test1(){
		
		
		
		var jsonArr = new Array();
//		for (var i=0; i<chked.length; i++) {
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
			
			
//		}		
		
		
		var wahaflArray = []; 
		wahaflArray.push(document.getElementsByName('flarea')[0].value);
		wahaflArray.push(document.getElementsByName('flarea')[1].value);
		wahaflArray.push(document.getElementsByName('flarea')[2].value);
		wahaflArray.push(document.getElementsByName('flarea')[3].value);
		var wahaflstr = wahaflArray.toString();
/* 		var size = $("input[name='flarea']").length;
	    for(i=0;i<size;i++){
			var document.getElementsByName('flarea');
	    }
        $('input[name="fruit"]:checked').each(function(i){//체크된 리스트 저장
            fruitArray.push($(this).val());
        });
 */        
 
//		var names = document.getElementsByName('flarea');
//		var name = names[0].val(); 
 
        var objParams = {
                "whname" : $("#whname").val(),
                "mpadrs" : $("#mpadrs").val(),
                "szposi" : $("#szposi").val()
//                ,   "flarea" : wahaflstr
//                "fruitList" : wahaflArray        //과일배열 저장
            };		
		
		$.ajax({
					url: "testSave",
					type:"post", 
					dataType: 'json',
					processData : true,
					contentType: 'application/json',					
//					data : objParams,
					data: JSON.stringify(jsonArr),
					success : function(result){         
                        if(result.code == "OK") {
                            alert("OK");
                        } else {
                            alert("NG");
//                            alert(result.message);
                        }
						
//						$('#modal_liftcnt').text(titlepartVO.liftcnt);						
//						$('#modal_idx').val(titlepartVO)
					},
			        error: function() {
			            alert('Error occured' + brcode);
			        }
			   	})		
		
		
//			var size = $("input[name='flarea']").length;
//		    for(i=0;i<size;i++){
////		      alert( i + "번째  : " + $("input[name='flarea']").eq(i).attr("value") );
//		      var name = document.getElementsByName('flarea');
//		      alert(name[i].value);
//		   }	
		}

</script>

</body>
</html>
