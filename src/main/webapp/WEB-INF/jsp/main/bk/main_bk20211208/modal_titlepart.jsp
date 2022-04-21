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

		function fn_initSelectOpt(){
			$("#searchKeyword").val("${searchKeyword}");
		}
	
		function fn_formSubmit(page){ 
			document.form1.page.value=page;
			document.form1.submit();
		}
		
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="checkRow"]').each(function() {
				this.checked = chk; 
			})	
		}    
		
		function fn_showDetail(a) {
			
			$("#TPdetail").show();
		}
		//---------------------------------------------------------------------------------------------//
		function fn_getSigungu(sidocd){
			$.ajax({
				url: "getSigungu",
				type:"post", 
				data : {sidocd: sidocd},
				success : function(result){         
					$("#select_sigungu").empty();
					$("#select_sigungu").append("<option value='' selected>시군구 선택</option>");
						$.each(result, function(idx, val) {
							$("#select_sigungu").append("<option value='"+ val.combovalue +"'>"+val.combooption+"</option>")	
						});
					}
		   	})
		   	fn_setSearch(sidocd,1);
		   	
		}		
		 
			function fn_getDongcd(sigungu){
				$.ajax({
					url: "getdongcd",
					type:"post", 
					data : {sigungu: sigungu},
					success : function(result){         
						$("#select_dong").empty();
						$("#select_dong").append("<option value='' selected>동 선택</option>");
							$.each(result, function(idx, val) {
								$("#select_dong").append("<option value='"+ val.combovalue +"'>"+val.combooption+"</option>")	
							});
						}
			   	})
			   	fn_setSearch(sigungu,2);
			}		
			
			function fn_setSearch(code,val){
				$("#searchKeyword").val(code);
				$("#searchedName").val("");
//				$("#searchedName").val($("#select_dong").text());
				$("#searchedName").val($("#select_sido option:selected").text() 
									+ " " + $("#select_sigungu option:selected").text() 
									+ " " + $("#select_dong option:selected").text());
			}				
		//---------------------------------------------------------------------------------------------//
		
	</script>

</head>

<body onload="fn_initSelectOpt();">
<jsp:include page="inc_header.jsp" flush="true"/>

    <!-- Start Contents -->
    <div>
    <br><br>
	    <div style="text-align:center;border:1px ">
	    <form role="form" id="form1" name="form1"  method="post">
	         <select id="select_sido" onChange="fn_getSigungu(this.value);" >
				<option value="" >도 또는 특별시 선택    </option>
				<option value="11" >서울특별시</option>
				<option value="26" >부산광역시</option>
				<option value="27" >대구광역시</option>
				<option value="28" >인천광역시</option>
				<option value="29" >광주광역시</option>
				<option value="30" >대전광역시</option>
				<option value="31" >울산광역시</option>
				<option value="36" >세종특별자치시</option>
				<option value="41" >경기도</option>
				<option value="42" >강원도</option>
				<option value="43" >충청북도</option>
				<option value="44" >충청남도</option>
				<option value="45" >전라북도</option>
				<option value="46" >전라남도</option>
				<option value="47" >경상북도</option>
				<option value="48" >경상남도</option>
				<option value="50" >제주특별자치도</option>
	         </select> &nbsp;&nbsp;
	         <select id="select_sigungu" onChange="fn_getDongcd(this.value);" >
	   	 	      <option value='' >시군구 구분</option>
	         </select> &nbsp;&nbsp;
	         <select id="select_dong" onChange="fn_setSearch(this.value, 3);">
	     	     <option value='' >동 구분</option>
	         </select> &nbsp;&nbsp;
	         
	         <input type="hidden" id="searchKeyword" name="searchKeyword"> 
	         <input type="text" id="searchedName" name="searchedName"> 
	         
	       	 <button class="btn btn-outline btn-primary" onclick="fn_formSubmit(1);" >검색</button>
			<!-- start Paging -->	
			<c:if test="${searchVO.totPage>1}">

				<div>
				<a href="#" onclick="fn_formSubmit(1)"><i class="fa fa-angle-double-left fa-fw"></i></a>
				<a href="#" onclick="fn_formSubmit(${searchVO.page-1})"><i class="fa fa-angle-left  fa-fw"></i></a>
				<c:forEach var="i" begin="${searchVO.pageStart}" end="${searchVO.pageEnd}" step="1">
		            <c:choose>
		                <c:when test="${i eq searchVO.page}">
							<c:out value="${i}"/>
		                </c:when>
		                <c:otherwise>
							<a href="#" onclick="fn_formSubmit(${i})"><c:out value="${i}"/></a>
		                </c:otherwise>
		            </c:choose>
				</c:forEach>
				<a href="#" onclick="fn_formSubmit(${searchVO.page+1})"><i class="fa fa-angle-right  fa-fw"></i></a>
				<a href="#" onclick="fn_formSubmit(${searchVO.totPage})"><i class="fa fa-angle-double-right  fa-fw"></i></a>
				</div>
				<input type="hidden" name="page" id="page" value="" />
				<%-- 
					시작행번호 : ${searchVO.rowStart} , 종료행 번호: ${searchVO.rowEnd} , 전체 페이수 : ${searchVO.totPage} 
				     ,전체 데이터 수 : , ${searchVO.totRow} , 현재 페이지 :  ${searchVO.page} , 시작페이지 :  ${searchVO.pageStart}  
				     , 종료페이지 : ${searchVO.pageEnd} 
				--%>
			</c:if>
			</form> 
			<!-- end Paging -->
    	</div>
    <!-- End Contents -->
	</div >
    <!-- Start TitlePart List -->
    <div style="border:1px ;">
	<!-- start floor items -->       
		<table class="table_type04" align="center" width=98% style="font-size:15px;">
			<thead align="center">
				<tr>
					<th>번호</th>
					<th>관리번호</th>
					<th>대장종류</th>
					<th>대지위치</th>
					<th>건축물명칭</th>
					<th>동명칭 및 번호</th>
					<th>주용도</th>
					<th>연면적</th>
				</tr>
			</thead>
			<tbody  align="center">
			<c:forEach var="tplist" items="${listview}" varStatus="status">
				<tr>
					<td>
						<%-- <c:out value="${status.index + 1}"/> --%>
						${searchVO.rowStart + status.index}
					</td>	
					<td>
						<a href="javascript:fn_showDetail(${status.index});"><c:out value="${tplist.mgbdrgpk}"/></a>
					</td>
					<td>
						<c:out value="${tplist.rgkdcdnm}"/>
					</td>
					<td>
						<c:out value="${tplist.ldxy}"/>
					</td>
					<td>
						<c:out value="${tplist.bdnm}"/>
					</td>
					<td>
						<c:out value="${tplist.dongnm}"/>
					</td>
					<td>
						<c:out value="${tplist.mauscdnm}"/>
					</td>
					<td style="text-align:right">
						<fmt:formatNumber value="${tplist.grossar}" pattern="#,###" />&nbsp;m<sup>2</sup>
					</td>				
				</tr>			
			</c:forEach>			
			</tbody>	
		</table>
		<br>
<!--  	<div id="TitlepartDetail" style="width:1100px;height:500px;margin-top:10px;display:none;border:1px">  -->
		<div id="TPdetail" name="TPdetail" style="width:100%;height:500px;margin-top:10px;margin-bottom:200px;display:none;">
        	건축물 정보 : <c:out value="${listview[0].mgbdrgpk}"/><br>
			<table class="table_type03" width=100% style="font-size:15px">
				<tbody>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">대지위치</td>
						<td colspan="3" style="width: 70px; text-align: center;">${listview[0].ldxy}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">지번</td>
						<td style="width: 70px; text-align: center;">${listview[0].nadbob}</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">대지면적</td>
						<td style="width: 70px; text-align: center;">${listview[0].ldar}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">연면적</td>
						<td style="width: 70px; text-align: center;">${listview[0].grossar}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">명칭 및 번호</td>
						<td style="width: 70px; text-align: center;">${listview[0].dongnm}</td>					
					</tr>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">건축면적</td>
						<td style="width: 70px; text-align: center;">${listview[0].star}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">용적율 산정용 연면적</td>
						<td style="width: 70px; text-align: center;">${listview[0].cprtesgrossar}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">건축물수</td>
						<td style="width: 70px; text-align: center;">${listview[0].bdcnt}</td>			
					</tr>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">건폐율</td>
						<td style="width: 70px; text-align: center;">${listview[0].bdrt}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">용적율</td>
						<td style="width: 70px; text-align: center;">${listview[0].cprt}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">총호수</td>
						<td style="width: 70px; text-align: center;">${listview[0].hosu}</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">주용도</td>
						<td style="width: 70px; text-align: center;">${listview[0].mauscdnm}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">주구조</td>
						<td style="width: 70px; text-align: center;">${listview[0].etstruct}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">부속건축물</td>
						<td style="width: 70px; text-align: center;">${listview[0].maextdvcd}</td>					
					</tr>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">허가일자</td>
						<td style="width: 70px; text-align: center;">${listview[0].apday}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">착공일자</td>
						<td style="width: 70px; text-align: center;">${listview[0].strstday}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">사용승인일자</td>
						<td style="width: 70px; text-align: center;">${listview[0].permday}</td>
					</tr>
				</tbody>
			</table>
			<br>용도<br>
			<table class="table_type04" width=100% style="font-size:15px">
				<tbody>
					<tr>
						<th style="width: 70px; text-align: center; background: #FAFAFA;">용도지역</th>
						<th style="width: 70px; text-align: center; background: #FAFAFA;">용도지구</th>
						<th style="width: 70px; text-align: center; background: #FAFAFA;">구역</th>
					</tr>
					<tr>
						<td style="width: 70px; text-align: center;">용도지역 값X</td>
						<td style="width: 70px; text-align: center;">용도지구 값X</td>
						<td style="width: 70px; text-align: center;">구역 값X</td>
					</tr>
				</tbody>
			</table>
			<br>주차장<br>
			<table class="table_type03" width=100% style="font-size:15px">
				<tbody>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">옥내기계식</td>
						<td style="width: 70px; text-align: center;">${listview[0].inmsnu}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">옥내자주식</td>
						<td style="width: 70px; text-align: center;">${listview[0].permday}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">옥외기계식</td>
						<td style="width: 70px; text-align: center;">${listview[0].insfnu}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">옥외자주식</td>
						<td style="width: 70px; text-align: center;">${listview[0].otsfnu}</td>
					</tr>
				</tbody>
			</table>
			<br>승강기<br>
			<table class="table_type03" width=100% style="font-size:15px">
				<tbody>
					<tr>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">승용</td>
						<td style="width: 70px; text-align: center;">${listview[0].elevcnt}</td>
						<td style="width: 70px; text-align: center; background: #FAFAFA;">비상용</td>
						<td style="width: 70px; text-align: center;">${listview[0].liftcnt}</td>
					</tr>
				</tbody>
			</table>			
		</div>
	</div>
	<!-- end TitlePart List -->       

   <br><br>
<jsp:include page="inc_footer.jsp" flush="true"/>
</body>
</html>