<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="ko">
  <head>
    <title>IamLogis</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script  src="https://code.jquery.com/jquery-3.6.0.min.js"  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="  crossorigin="anonymous"></script>	  
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://use.fontawesome.com/926fe18a63.js"></script>
	<script>
	
//	$('input:radio[name=radioValue]:input[value="Y"]').attr("checked", true);
var floorList;


		function fn_formSubmit(){
			if ( $("#searchKeyword").val() == ''){	alert("명칭 또는 주소 일부분을 입력하세요");	return false; }
			
// 			if ( ! chkInputValue("#searchKeyword", "명칭 또는 주소 일부분 ")) return false;
// 			if(Number($("#searchExt1").val()) >= Number($("#searchExt2").val())){
// 				alert("하한선 값을 더 크게 지정하세요");
// 				return false;
// 			}
//			$('#loading').show();

			document.form1.submit();	
			
			var spinner = document.getElementById('spinner');
		    spinner.style.visibility = 'visible';
		}
		
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="checkRow"]').each(function() {
				this.checked = chk; 
			})	
		}    
		
		$(document).ready(function(){
		});			
		
		function fn_popFloorInfo(code){
			$("#div_floorTd").empty();
			$.ajax({
				url: "searchBrtitleFloor",
				type:"post", 
				data : {brpk: code},
				success : function(result){  
 					$.each(result, function(idx, floorList) {
 						var insertTr = "";
 						insertTr += "<tr>";
 						insertTr += "<td>" + floorList.bldNm         + "</td>";
 						insertTr += "<td>" + floorList.mainPurpsCdNm + "</td>";
 						insertTr += "<td>" + floorList.flrGbCdNm     + "</td>";
 						insertTr += "<td>" + floorList.flrNo         + "</td>";
 						insertTr += "<td align='right'>" + floorList.area + "&nbsp;평</td>";
 						insertTr += "<td>" + floorList.crtnDay       + "</td>";
 						insertTr += "</tr>";
						 $("#div_floorTd").append(insertTr);
 					});					
				},

		        error: function() {
		            alert('Error occured' + brcode);
		        }
		   	})
		//	$('#modal_FloorInfo').modal("show");
		}			
		
	</script>
	
	<style>	
    	div {  border: solid red 0px; } 
    	span { font-size:15px;text-decoration:none;}
    	label {font-size:12px;font-weight:none;margin-top:10px; margin-bottom: 0;color:#696969}
		table td {
		  vertical-align: middle !important;white-space: nowrap;font-size:14px;
		}    
	</style>	
		
</head>
<body>

<jsp:include page="inc_header.jsp" flush="true"/>
<div class="container mb-5">
	<h5  class="mt-4 mb-4" style="color:green;margin-bottom:20px;text-align:center;"><strong>건축물대장 정보(창고시설)</strong></h5>
	<form role="form" id="form1" name="form1"  method="post">
	  <div class="row">
	        <div class="col-md-12">
				<div class="card ml-3 mr-3">
		 		 	<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label>검색어</label> 
			                    <input type="text" 
			                    	class="form-control form-control-sm" id="searchKeyword" name="searchKeyword" placeholder="명칭 또는 주소 일부분" 
			                    	value='<c:out value="${searchVO.searchKeyword}"/>' >
							</div>
							<div class="col-md-3">
								<label for="requsr">창고연면적(평)</label> 
				                 <select class="form-control form-control-sm" id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
				                    <option value="0"       <c:if test="${searchVO.searchExt1 eq '0'      }">selected</c:if>> 하한선없음 </option>
									<option value="330.58"  <c:if test="${searchVO.searchExt1 eq '330.58' }">selected</c:if>> 100평    </option>
									<option value="991.74"  <c:if test="${searchVO.searchExt1 eq '991.74' }">selected</c:if>> 300평    </option>
									<option value="1652.89" <c:if test="${searchVO.searchExt1 eq '1652.89'}">selected</c:if>> 500평    </option>
									<option value="3305.79" <c:if test="${searchVO.searchExt1 eq '3305.79'}">selected</c:if>> 1000평   </option>
									<option value="9917.36" <c:if test="${searchVO.searchExt1 eq '9917.36'}">selected</c:if>> 3000평   </option>
				                 </select>
							</div>
							<div class="col-md-3">
								<label for="requsr">&nbsp;</label> 
				                 <select class="form-control form-control-sm" id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
									<option value="9999999" <c:if test="${searchVO.searchExt2 eq '9999999'}">selected</c:if>>  상한선 없음 </option>
									<option value="330.58"  <c:if test="${searchVO.searchExt2 eq '330.58'}">selected</c:if>>  100평 </option>
									<option value="991.74"  <c:if test="${searchVO.searchExt2 eq '991.74'}">selected</c:if>> 300평 </option>
									<option value="1652.89" <c:if test="${searchVO.searchExt2 eq '1652.89'}">selected</c:if>> 500평 </option>
									<option value="3305.79" <c:if test="${searchVO.searchExt2 eq '3305.79'}">selected</c:if>> 1000평 </option>
									<option value="9917.36" <c:if test="${searchVO.searchExt2 eq '9917.36'}">selected</c:if>> 3000평 </option>
				                 </select>
							</div>
							<div class="col-md-1"></div>
			            </div>
						<div class="row mt-3">
							<div class="col-md-3">
								<label>지역구분</label>
					              <div class="custom-control custom-radio">
					                <input id="searchExt4" name="searchExt4" type="radio" class="custom-control-inline" value="all_area" <c:if test="${searchVO.searchExt4 eq 'all_area'}">checked</c:if>>
								    <label>전국</label> 
					              </div>
					              <div class="custom-control custom-radio">
					                <input id="searchExt4" name="searchExt4" type="radio" class="custom-control-inline" value="sudo"    <c:if test="${searchVO.searchExt4 eq 'sudo'}">checked</c:if>>
								    <label>수도권</label> 
					              </div>
					              <div class="custom-control custom-radio">
					                <input id="searchExt4" name="searchExt4" type="radio" class="custom-control-inline" value="notsudo" <c:if test="${searchVO.searchExt4 eq 'notsudo'}">checked</c:if>>
								    <label>수도권외</label> 
					              </div>
							</div>
							<div class="col-md-3">
								<label>사용승인일</label>
					              <div class="custom-control custom-radio">
					                <input type="radio" class="custom-control-inline" value="all_useAprDay" name="searchExt5" <c:if test="${searchVO.searchExt5 eq 'all_useAprDay'}">checked</c:if>>
								    <label>전체</label> 
					              </div>
					              <div class="custom-control custom-radio">
					                <input type="radio" class="custom-control-inline" value="is_useAprDay" name="searchExt5" <c:if test="${searchVO.searchExt5 eq 'is_useAprDay'}">checked</c:if>> 
								    <label>있음</label> 
					              </div>
					              <div class="custom-control custom-radio">
					                <input type="radio" class="custom-control-inline" value="null_useAprDay" name=searchExt5  <c:if test="${searchVO.searchExt5 eq 'null_useAprDay'}">checked</c:if>>
								    <label>없음</label> 
					              </div>
							</div>							
							<div class="col-md-2">
								<label>실제착공일 (~이후)</label> 
									<input type="text" class="form-control form-control-sm"  id="searchExt3" name="searchExt3" placeholder="실제착공일" value='<c:out value="${searchVO.searchExt3}"/>' > 
							</div>
			            </div>			            
			            <hr>
						<div class="row">
							<div class="col-md-2">
								<label for="requsr" style="color:blue">정렬항목</label> 
				                 <select class="form-control form-control-sm" id="searchExt7" name="searchExt7" value='<c:out value="${searchVO.searchExt7}"/>'>
										<option value="totarea" <c:if test="${searchVO.searchExt7 eq 'totarea'}">selected</c:if>>연면적</option>
				                 </select>
							</div>
							<div class="col-md-2">
								<label for="requsr" style="color:blue">정렬순서</label> 
				                 <select class="form-control form-control-sm" id="searchExt8" name="searchExt8" value='<c:out value="${searchVO.searchExt8}"/>'>
										<option value="desc" <c:if test="${searchVO.searchExt8 eq 'desc'}">selected</c:if>>내림차순</option>
										<option value="asc" <c:if test="${searchVO.searchExt8 eq 'asc'}">selected</c:if>>오름차순</option>
				                 </select>
							</div>
						</div>			            
						<div class="row">
							<div class="col-md-12 d-flex justify-content-center mt-5">
								<button type="button"  class="btn btn-sm btn-primary"  onclick="fn_formSubmit()"> 창고 찾기 </button>
							</div>
			            </div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<span>
							검색결과 : ${fn:length(brTitleList)}  건	
						</span>
					</div>
	     	   </div>					            								
			</div>
		</div>
		<input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
      </form>	
	  <div class="row mt-3">
	        <div class="col-md-12">
			    <div class="table-responsive">
					<table id="tables" class="table table-hover table-bordered table-sm" style="cellspacing:0;text-align:center;" >
							<thead align="center">
								<tr style="background-color:#FAFAFA;">
									<td>번호</td>
									<td>등록창고</td>
									<td>창고등록</td>
									<td>층정보</td>
									<td width="20%">대지위치</td>
									<td width="10%">건물명</td>
									<td>동명</td>
									<td>대지면적(평)</td>
									<td>건축면적(평)</td>
									<td>연면적(평)</td>
									<td>건축허가일</td>
									<td>사용승인일</td>
									<td>생성일자</td>
				<!--  					
									<td>등록번호</td>
									<td>건폐율(%)</td>
									<td>용적률(%)</td>
									<td>연면적용적률산정(㎡)</td>
				-->					
								</tr>
							</thead>				
							<tbody  align="center">
								<c:forEach var="brTitle" items="${brTitleList}" varStatus="status">
								<tr>
				  					<td>${status.count} </td> 
				  					<td> <a href="detail?whcode=${brTitle.registedflg}">${brTitle.registedflg}</a> </td> 
				  					<td>
				  						<a href="ctrWareForm?fromP=brtitle&brpk=${brTitle.mgmBldrgstPk}" > 
					  						<button type="button" class="btn btn-primary btn-sm">등록</button>
					  					</a>
				  					</td>
				  					<td>
					  					<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#floorModal" onClick="fn_popFloorInfo('${brTitle.mgmBldrgstPk}');">층정보</button>
				  					</td> 
				  					<td>${brTitle.platPlc}</td> 
				  					<td>${brTitle.bldNm}</td> 
				  					<td>${brTitle.dongNm}</td> 
				  					<td><fmt:formatNumber value="${brTitle.platArea}" pattern="#,###" /></td> 
				  					<td><fmt:formatNumber value="${brTitle.archArea}" pattern="#,###" /></td> 
				  					<td><fmt:formatNumber value="${brTitle.totArea}" pattern="#,###" /></td> 
				  					<td>${brTitle.pmsDay}</td> 
				  					<td>${brTitle.useAprDay}</td> 
				  					<td>${brTitle.crtnDay}</td> 
				<!--  					
				  					<td>${brTitle.mgmBldrgstPk}</td> 
				  					<td>${brTitle.vlRat}</td> 
				  					<td>${brTitle.bcRat}</td> 
				  					<td>${brTitle.vlRatEstmTotArea}</td>
				-->  					 
								</tr>
								</c:forEach>
							</tbody>
						</table>		        
	      		</div>
      		</div>
      </div>
</div>

<jsp:include page="inc_footer.jsp" flush="true"/> 
<!-- Modal -->
<div class="modal fade" id="floorModal" tabindex="-1" role="dialog" aria-labelledby="floorModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" style="display: flex;text-align: center;vertical-align: middle;">
    <div class="modal-content">
    	<div><h5>층별정보</h5></div> 
    	<div id="modal_FloorInfo_contents"  >
			<table class="table table-bordered table-sm"  style="font-size:12px;width:100%">
				<thead align="center">
					<tr style="background-color:#FAFAFA;">
						<td>건물명</td>
						<td>주용도코드명</td>  
						<td>층구분코드명</td>
						<td>층번호</td>
						<td>층면적</td>
						<td>생성일자</td>
					</tr>
				</thead>				
				<tbody id="div_floorTd" align="center">
				</tbody>
			</table>	
			<button type="button" class="btn btn-warning btn-sm mb-2" data-dismiss="modal">닫기</button>
			<br><br>
		</div>			
    </div>
  </div>
</div>
    
	<script>
	
	//function(){
			var area_r = $(":input:radio[name=searchExt4]:checked").val();
			var useAprDay_r = $(":input:radio[name=searchExt5]:checked").val();
			if(area_r==null){
				$('input:radio[name=searchExt4]:input[value="all_area"]').attr("checked", true);
			}
			if(useAprDay_r==null){
				$('input:radio[name=searchExt5]:input[value="null_useAprDay"]').attr("checked", true);
			}
	</script>
</body>
</html>