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
	
//	$('input:radio[name=radioValue]:input[value="Y"]').attr("checked", true);


		function fn_formSubmit(){
			
			$('#loading').show();
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
		
		function test(arg){
			alert(arg);
		}	
		
		
		
		//---------------------------------------------- toast grid -----------------------------------------------------//		
		var Grid;  
		var ModalGrid;  
		
		$(document).ready(function(){
			if($("#gridData").val() == ''){ 
				$('#loading').hide();
				return false; 
			}
			json = JSON.parse($("#gridData").val());
			$('#gridTotalCount').text(json.length);
			//표제부
			Grid = new tui.Grid({						
			        el: document.getElementById('grid'),
	 		        pageOptions: {
			            perPage: 5000,
			            useClient: true
			        }, 
			        scrollX: true,
			        scrollY: true,
			        useClientSort : true,
			        rowHeaders:['rowNum', 'checkbox'],		   
			        columns: [
			          { header : '등록하기', name: 'mgmBldrgstPk' ,
			            formatter: function({value}) {
//			                var url = 'javascript:test(' + '\''+ value.toString() + '\'' + ')';
			                var url = 'ctrWareForm?brpk=' + value.toString() ;
			                return '<a href="' + url + '" >창고등록</a>';
			            }			          
				        	  ,align:'center', width : 80},
			          { header : '대지위치', name: 'platPlc' ,align:'left', width : 300},
			          { header : '건물명', name: 'bldNm',align:'left' , width : 300},
			          { header : '구분', name: 'archGbCd',align:'center', width : 50},
			          { header : '대지면적(㎡)', name: 'platArea',align:'right', width : 100},
			          { header : '건축면적(㎡)', name: 'archArea',align:'right'  , width : 100},
			          { header : '건폐율(%)', name: 'bcRat',align:'right'  , width : 100},
			          { header : '연면적(㎡)', name: 'totArea',align:'right'  , width : 100},
			          { header : '용적률(%)', name: 'vlRat',align:'right'  , width : 100},
			          { header : '건축허가일', name: 'pmsDay',align:'center'  , width : 80},
			          { header : '사용승인일', name: 'useAprDay',align:'center'  , width : 80},
			          { header : '연면적용적률산정(㎡)', name: 'vlRatEstmTotArea',align:'right'  , width : 100},
			          { header : '생성일자', name: 'crtnDay',align:'center'  , width : 80},
			        ],
			        columnOptions : {
			        	resizable:true
			        }
			        , data : json		        		        
			    });
		    $('#loading').hide();
		});			
		
		function fn_formfloorSubmit(){
//			alert('getrowkey~~~');

			var gridrows =Grid.getCheckedRowKeys();
			var rowcnt = gridrows.length
			if(rowcnt == 0){
				alert('체크 선택없음');	
			}
			var arrpkdata = Grid.getColumnValues('mgmBldrgstPk');
			
			var arr = [];
			for(var i=0; i<rowcnt; i++){
				arr.push(arrpkdata[gridrows[i]].toString());
				//alert(arrpkdata[gridrows[i]].toString());
			}
			$('#searchTypeArr').val(arr);
			document.formFloor.target = "_blank";
			document.formFloor.submit();	

		}		
	</script>
	
	<style>	
		#loading {
		    width: 100%;
		    height: 100%;
		    top: 0;
		    left: 0;
		    position: fixed;
		    display: block;
		    opacity: 0.8;
		    background: white;
		    z-index: 99;
		    text-align: center;
		}
		
		#loading > img {
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    z-index: 100;
		}
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
 &nbsp;&nbsp;&nbsp;<a href="searchBasis">인허가정보</a>
 &nbsp;&nbsp;&nbsp;<a href="searchBrtitle">건축물대장</a>
 <hr>
   *********** 건축물대장 정보(창고시설) *********** 
 <hr>
    <!-- Start Contact -->
            <form role="form" id="form1" name="form1"  method="post">
               검색어 :   <input type="text" id="searchKeyword" name="searchKeyword" placeholder="명칭 또는 주소 일부분" value='<c:out value="${searchVO.searchKeyword}"/>' >
               <br><br>
               면적범위 : 
               <select id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
	    <!--        <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'}">selected</c:if>> 하한선 없음 </option>   -->
	                <option value="330.58"  <c:if test="${searchVO.searchExt1 eq '330.58'}">selected</c:if>>  100평 </option>
	                <option value="991.74"  <c:if test="${searchVO.searchExt1 eq '991.74'}">selected</c:if>> 300평 </option>
	                <option value="1652.89"  <c:if test="${searchVO.searchExt1 eq '1652.89'}">selected</c:if>> 500평 </option>
	                <option value="3305.79" <c:if test="${searchVO.searchExt1 eq '3305.79'}">selected</c:if>> 1000평 </option>
	                <option value="9917.36" <c:if test="${searchVO.searchExt1 eq '9917.36'}">selected</c:if>> 3000평 </option>
               </select>
               ~
               <select id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
	                <option value="9999999"<c:if test="${searchVO.searchExt2 eq '9999999'}">selected</c:if>>  상한선 없음 </option>
	                <option value="330.58"  <c:if test="${searchVO.searchExt2 eq '330.58'}">selected</c:if>>  100평 </option>
	                <option value="991.74"  <c:if test="${searchVO.searchExt2 eq '991.74'}">selected</c:if>> 300평 </option>
	                <option value="1652.89"  <c:if test="${searchVO.searchExt2 eq '1652.89'}">selected</c:if>> 500평 </option>
	                <option value="3305.79" <c:if test="${searchVO.searchExt2 eq '3305.79'}">selected</c:if>> 1000평 </option>
	                <option value="9917.36" <c:if test="${searchVO.searchExt2 eq '9917.36'}">selected</c:if>> 3000평 </option>
               </select>
               <br><br>
    <!-- 옵션 : 수도권, 비수도권, 다 포함 -->
	    	지역구분 : 
			<input type="radio" value="all_area" name="searchExt4" <c:if test="${searchVO.searchExt4 eq 'all_area'}">checked</c:if>> 전체 
			<input type="radio" value="sudo" name="searchExt4" <c:if test="${searchVO.searchExt4 eq 'sudo'}">checked</c:if>>수도권 
			<input type="radio" value="notsudo" name="searchExt4" <c:if test="${searchVO.searchExt4 eq 'notsudo'}">checked</c:if>>비수도권 
            <br><br>
    <!-- 옵션 : 실제착공일 ~이상 -->
			사용승인일 : 
			<input type="text" id="searchExt3" name="searchExt3" placeholder="사용승인일" value='<c:out value="${searchVO.searchExt3}"/>' > 이후
	        <br><br>
		    <button type="button" onclick="fn_formSubmit()"> 창고 찾기 </button>
		    &nbsp;&nbsp;&nbsp;&nbsp;
		    검색결과 : <text type="label" id="gridTotalCount" name="gridTotalCount"></text> 건
			<hr>
			<input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
       </form>
       
       <form id="formFloor" name="formFloor"  method="post" action="searchBrtitleFloor"> 
		    <button type="button" onclick="fn_formfloorSubmit()"> 체크된것 층별정보확인 </button>
			<input type="hidden" id="searchTypeArr" name="searchTypeArr" value='<c:out value="${searchVO.searchTypeArr}"/>' />
       </form>       

    <!-- End Contact -->

<script>
function(){
	var area_r = $(":input:radio[name=searchExt4]:checked").val();
		if(area_r==null){
			$('input:radio[name=searchExt4]:input[value="all_area"]').attr("checked", true);
		}
</script>	

<br>	
    <div id="grid" ></div>
<br>	
<div id="loading">
    <img src="images/loading.gif" alt="loading">
</div>

		<p style="font-size:14px">■ 건축물정보 표제부</p>
		<table  style="font-size:12px;width:100%">
			<tbody>
			<thead align="center">
				<tr>
					<td>등록번호</td>
					<td>대지위치</td>
					<td>건물명</td>
					<td>구분</td>
					<td>대지면적(㎡)</td>
					<td>건축면적(㎡)</td>
					<td>건폐율(%)</td>
					<td>연면적(㎡)</td>
					<td>용적률(%)</td>
					<td>건축허가일</td>
					<td>사용승인일</td>
					<td>연면적용적률산정(㎡)</td>
					<td>생성일자</td>
				</tr>
			</thead>				
			<tbody  align="center">
				<c:forEach var="brTitle" items="${brTitleList}" varStatus="status">
				<tr>
  					<td>${brTitle.mgmBldrgstPk}</td> 
  					<td>${brTitle.platPlc}</td> 
  					<td>${brTitle.bldNm}</td> 
  					<td>${brTitle.archGbCd}</td> 
  					<td>${brTitle.platArea}</td> 
  					<td>${brTitle.archArea}</td> 
  					<td>${brTitle.bcRat}</td> 
  					<td>${brTitle.totArea}</td> 
  					<td>${brTitle.vlRat}</td> 
  					<td>${brTitle.pmsDay}</td> 
  					<td>${brTitle.useAprDay}</td> 
  					<td>${brTitle.vlRatEstmTotArea}</td> 
  					<td>${brTitle.crtnDay}</td> 
				</tr>
				</c:forEach>
			</tbody>
		</table>	

</body>
</html>