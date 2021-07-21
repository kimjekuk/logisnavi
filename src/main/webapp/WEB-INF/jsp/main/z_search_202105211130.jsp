<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

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

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/assets/css/fontawesome.min.css">
    
    
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script>
		function fn_formSubmit(){
			if ( ! chkInputValue("#searchKeyword", "명칭 및 위치 ")) return false;	
			document.form1.submit();	
		}
		
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="checkRow"]').each(function() {
				this.checked = chk; 
			})	
		}    
	</script>

</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>

    <!-- Start Contact -->
    <div class="container py-5">
            <form class="col-md-9 m-auto" role="form" id="form1" name="form1"  method="post">
                <div class="row">
                <div class="form-group col-md-5 mb-3">
<!--                <label for="inputSearch3">명칭 및 위치</label> -->
                    <input type="text" class="form-control mt-2" id="searchKeyword" name="searchKeyword" placeholder="명칭 및 위치"  
                    	value='<c:out value="${searchVO.searchKeyword}"/>' >
                </div>
                    <div class="form-group col-md-3 mb-3">
<!--                    <label for="inputSearch2">From</label> -->
	                    <select class="form-control mt-2" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
		                    <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'}">selected</c:if>> 하한선 없음 </option>
		                    <option value="100"  <c:if test="${searchVO.searchExt1 eq '100'}">selected</c:if>>  100 평 </option>
		                    <option value="300"  <c:if test="${searchVO.searchExt1 eq '300'}">selected</c:if>> 300 평 </option>
		                    <option value="500"  <c:if test="${searchVO.searchExt1 eq '500'}">selected</c:if>> 500 평 </option>
		                    <option value="1000" <c:if test="${searchVO.searchExt1 eq '1000'}">selected</c:if>> 1000 평 </option>
		                    <option value="2000" <c:if test="${searchVO.searchExt1 eq '2000'}">selected</c:if>> 2000 평 </option>
		                    <option value="3000" <c:if test="${searchVO.searchExt1 eq '3000'}">selected</c:if>> 3000 평 </option>
	                    </select>

<!--                    <label for="inputSearch3">To</label> -->
	                    <select class="form-control mt-2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
		                    <option value="9999999"<c:if test="${searchVO.searchExt2 eq '9999999'}">selected</c:if>>  상한선 없음 </option>
		                    <option value="100"  <c:if test="${searchVO.searchExt2 eq '100'}">selected</c:if>>  100 평 </option>
		                    <option value="300"  <c:if test="${searchVO.searchExt2 eq '300'}">selected</c:if>> 300 평 </option>
		                    <option value="500"  <c:if test="${searchVO.searchExt2 eq '500'}">selected</c:if>> 500 평 </option>
		                    <option value="1000" <c:if test="${searchVO.searchExt2 eq '1000'}">selected</c:if>> 1000 평 </option>
		                    <option value="2000" <c:if test="${searchVO.searchExt2 eq '2000'}">selected</c:if>> 2000 평 </option>
		                    <option value="3000" <c:if test="${searchVO.searchExt2 eq '3000'}">selected</c:if>> 3000 평 </option>
	                    </select>
                    </div>

                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onclick="fn_formSubmit()">창고 찾기</button>
                    </div>
                </div>
            </form>
    </div>
    <!-- End Contact -->


    <!-- Start items -->
    <div class="container py-5">
	<!-- start warehouse items -->       
<c:set var="whcode_temp" value="" />
<c:forEach var="listview" items="${listview}" varStatus="status">
<c:if test="${whcode_temp ne listview.whcode}">
		<div>
			<table style="width: 800px; height: 186px;">
				<tbody>
					<tr>
						<td style="width: 138px;" rowspan="4">
						<img src="http://iamlogis.com/mallimg/2021/02/16/1613453884-67_N_150x120_100_7.jpg" width=200px heigth=200px>
						</td>
						<td style="width: 70px; text-align: left;">위치</td>
						<td style="width: 280px; text-align: left;"><c:out value="${listview.mpadrs}"/></td>
						<td style="width: 128px; text-align: right;" rowspan="4">
						즐겨찾기
						</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: left;">교통</td>
						<td style="width: 280px; text-align: left;">평촌IC 2km</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: left;">규모</td>
						<td style="width: 280px; text-align: left;"><c:out value="${listview.ifsize}"/></td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: left;">준공일</td>
						<td style="width: 280px; text-align: left;"><c:out value="${listview.prusdy}"/></td>
					</tr>
				</tbody>
			</table>
		</div>    
	<!-- end warehouse items -->       
	<br>	        

	<!-- start floor items -->       
		<div>
			<table align="center" width=100%>
			<thead align="center">
				<tr>
					<th>선택</th>
					<th>층</th>
					<th>면적</th>
					<th>용도</th>
					<th>임대료(월/평)</th>
					<th>평단가</th>
					<th>입주시기</th>
					<th>도면</th>
					<th>즐겨찾기</th>
				</tr>
			</thead>
			<tbody  align="center">
</c:if>			
			<tr>
				<td>
					<input id='floor-45341-01704395' type='checkbox'>
				</td>
				<td>
					<a href="/industrial/property-113119086002/01704395"><c:out value="${listview.whflnm}"/></a>
				</td>
				<td>
					<c:out value="${listview.flarea}"/>
				</td>
				<td>
					<c:out value="${listview.usetyp}"/>
				</td>
				<td>
					<c:out value="${listview.flmpay}"/>
				</td>
				<td>
					<c:out value="${listview.pprice}"/>
				</td>
				<td>
					<c:out value="${listview.lsfrom}"/>
				</td>
				<td>
					<img alt="도면" data-src="https://image.cbre-propertysearch.jp/img/photo/0002/113119086002_0_ZA_01_00.jpg" />
				</td>
				<td>
					<i>grade</i>
				</td>
			</tr>
			
<c:set var="whcode_temp" value="${listview.whcode}" />		
		</c:forEach>			
		</div>        
			</tbody>	
			</table>
	<!-- end floor items -->              
	</div>        
    <!--End items-->
   
<jsp:include page="inc_footer.jsp" flush="true"/>


</body>

</html>