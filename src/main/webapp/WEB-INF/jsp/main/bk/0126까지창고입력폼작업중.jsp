<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
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

		$(document).ready(function(){
			 //등록모드
			 if("${wahama.whcode}" == '' || "${wahama.whcode}" == 0){
				 //버튼문구
				 $("#str_button").html("등록하기");
			 }else{
			 //수정모드
				 //버튼문구
				 $("#str_button").html("수정하기");
				 $("span[name='str_whfuse_ref']").html("");
			 }
		});		
	
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="whfckd"]').each(function() {
				this.checked = chk; 
			})	
		} 	
		
	</script>
	
	<style>	
		table, th, td {
		  border-collapse: collapse;
		  text-align: center;
		  white-space:nowrap;		  
		}
		input[type='text'],input[type='password'],input[type='search']
	   ,input[type='email'],input[type='number'],input[type='tel'],input[type='date'],input[type='time']
	   {
		 font-size: 12px;
		 border: 1px solid #d7d7d7;
		 color : #666666;
		 vertical-align: middle;
     	}
     	
    	span { font-size:15px;text-decoration:none;}
    	label {font-size:12px;font-weight:none;margin-top:10px; margin-bottom: 0;color:#696969}
	</style>	
	
</head>

<body>
<!-- <jsp:include page="inc_header4.jsp" flush="true"/> -->
<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>창고정보등록(건축물 관리정보기반)</strong></h5>
    <!-- Start Contact -->
     <form role="form" id="formWama" name="formWama"  method="post" action="ctrWareSave">
		<div class="card ml-3 mr-3 mt-3">
		     <div class="card-header card-header-warning">
				<span>기본정보</span>
		     </div>	
	 		 <div class="card-body">
				<div class="row">
					<div class="col-md-4 ">
					    <label>건물명</label> 
						<input type="text" class="form-control form-control-sm" id="lmcopr" name="lmcopr"  value="${reqlmInfo.lmcopr}" required>
					</div>
					<div class="col-md-6 ">
					    <label>대지위치</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
	            </div>
				<div class="row">
					<div class="col-md-2 ">
					    <label>대지면적(평)</label> 
						<input type="text" class="form-control form-control-sm" id="lmcont" name="lmcont"  value="${reqlmInfo.lmcont}" required>
					</div>
					<div class="col-md-2 ">
					    <label>건축면적(평)</label> 
						<input type="text" class="form-control form-control-sm" id="lmsitr" name="lmsitr"  value="${reqlmInfo.lmsitr}" required>
					</div>
					<div class="col-md-2 ">
					    <label>연면적(평)</label> 
						<input type="text" class="form-control form-control-sm" id="lmtelp" name="lmtelp"  value="${reqlmInfo.lmtelp}" required>
					</div>
					<div class="col-md-2 ">
					    <label>건폐율(%)</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
					<div class="col-md-2 ">
					    <label>용적율(%)</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
					<div class="col-md-2 ">
					    <label>용적률산정 연면적(평)</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
	             </div>
				<div class="row">
					<div class="col-md-2 ">
					    <label>건축물구조</label> 
						<input type="text" class="form-control form-control-sm" id="lmcont" name="lmcont"  value="${reqlmInfo.lmcont}" required>
					</div>
					<div class="col-md-2 ">
					    <label>건축규모(층수)</label> 
						<input type="text" class="form-control form-control-sm" id="lmsitr" name="lmsitr"  value="${reqlmInfo.lmsitr}" required>
					</div>
					<div class="col-md-2 ">
					    <label>인근IC</label> 
						<input type="text" class="form-control form-control-sm" id="lmtelp" name="lmtelp"  value="${reqlmInfo.lmtelp}" required>
					</div>
					<div class="col-md-2 ">
					    <label>투자사</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
					<div class="col-md-2 ">
					    <label>운영사</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
					<div class="col-md-2 ">
					    <label>인근IC</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
	             </div>	     
				<div class="row">
					<div class="col-md-2 ">
					    <label>인허가일</label> 
						<input type="text" class="form-control form-control-sm" id="lmcont" name="lmcont"  value="${reqlmInfo.lmcont}" required>
					</div>
					<div class="col-md-2 ">
					    <label>사용승인일</label> 
						<input type="text" class="form-control form-control-sm" id="lmsitr" name="lmsitr"  value="${reqlmInfo.lmsitr}" required>
					</div>
					<div class="col-md-2 ">
					    <label>착공일</label> 
						<input type="text" class="form-control form-control-sm" id="lmtelp" name="lmtelp"  value="${reqlmInfo.lmtelp}" required>
					</div>
					<div class="col-md-2 ">
					    <label>건축물대장번호</label> 
						<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
					</div>
<!--  hidden값 -->					
				  	    <input type="hidden" id="brpk" name="brpk"  value="${brpk}" > 
						<input type="hidden" id="bacode" name="bacode" value="${wahama.bacode}">
						<input type="hidden" id="kkompx" name="kkompx" value="${wahama.kkompx}">
						<input type="hidden" id="kkompy" name="kkompy" value="${wahama.kkompx}">
	  	  	            <input type="hidden" id="whcode" name="whcode" value="${wahama.whcode}">
						<input type="hidden" id='mpsggc' name='mpsggc'  value="${wahama.mpsggc}">
						<input type="hidden" id='mpdngc' name='mpdngc'  value="${wahama.mpdngc}">
						<input type="hidden" id='mpabun' name='mpabun'  value="${wahama.mpabun}">
						<input type="hidden" id='mpadji' name='mpadji'  value="${wahama.mpadji}">	  	  	             			
	  	  	            		
	             </div>	     	                     
			 </div>	
		 </div>

		<div class="card ml-3 mr-3 mt-3">
		     <div class="card-header card-header-warning">
				<span>임대조건</span>
		     </div>	
	 		 <div class="card-body">
				<div class="row">
					<div class="col-md-2 ">
					    <label>인근임대료시세</label> 
						<input type="text" class="form-control form-control-sm" id="lmcopr" name="lmcopr"  value="${reqlmInfo.lmcopr}" required>
					</div>
					<div class="col-md-2 ">
					    <label>임대료</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-2 ">
					    <label>임대료포함면적</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-2 ">
					    <label>보증금</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
	            </div>
				<div class="row">
					<div class="col-md-2 ">
						    <label>관리비-창고</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-2 ">
					    <label>관리비-하역장</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-2 ">
					    <label>관리비-사무실</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-2 ">
					    <label>관리비-공용</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-2 ">
					    <label>수도광열비</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
	            </div>
				<div class="row">
					<div class="col-md-2 ">
					    <label>임대료인상율</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-4 ">
					    <label>Rent Free</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
					<div class="col-md-6 ">
					    <label>추가조건</label> 
						<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
					</div>
	            </div>
			 </div>	
		 </div>


		<div class="card ml-3 mr-3 mt-3">
		     <div class="card-header card-header-warning">
				<span>이미지등록</span>
		     </div>	
	 		 <div class="card-body">
				<div class="row">
					<div class="col-md-2 ">
					    <label>전경도</label> 
						<img id="img001" name="img001"
							<c:choose>
								<c:when test="${empty wahama.img001}" >
									src="images/noimg_w200h150.gif"  
								</c:when> 
								<c:otherwise>
									src="${wahama.img001}"  
								</c:otherwise>
							</c:choose>					
							width="200px" height="150px" border="1px solid grey">					
					</div>			
					<div class="col-md-1 "></div>
					<div class="col-md-2">
						<label>파일선택</label> 
						<input class="form-control  form-control-sm" type="file" id="file001" name="file001"  accept='image/*' />
					</div>
					<div class="col-md-1">
						<label>파일등록</label> 
						<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg01('file001')"> 등록 </button>
	  	  	            <input type="hidden" id="lmbzcr" name="lmbzcr"  size="20"  value="${reqlmInfo.lmbzcr}" >
					</div>
					<div class="col-md-2 ">
					    <label>배치도</label> 
							<img id="lmbzcr_view" name="lmbzcr_view"
								<c:choose>
									<c:when test="${empty reqlmInfo.lmbzcr}" >
										src="images/noimg_w200h150.gif"  
									</c:when> 
									<c:otherwise>
										src="${reqlmInfo.lmbzcr}"  
									</c:otherwise>
								</c:choose>					
								width="200px" height="150px" border="1px solid grey">
					</div>			
					<div class="col-md-1 "></div>
					<div class="col-md-2">
						<label>파일선택</label> 
						<input class="form-control  form-control-sm" type="file" id="file002" name="file002"  accept='image/*' />
					</div>
					<div class="col-md-1">
						<label>파일등록</label> 
						<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg02('file002')"> 등록 </button>
	  	  	            <input type="hidden" id="lmbzcr" name="lmbzcr"  size="20"  value="${reqlmInfo.lmbzcr}" >
					</div>
	            </div>
				<div class="row">
					<div class="col-md-12 ">
						<div id="map" style="width:100%;height:200px;border:1px solid grey;"></div>
					</div>	            	            
				</div>	
			 </div>	
		 </div>

<br><br><br><br><br>

		<table  class="table table-hover mt-3">
			<tbody>
			<thead align="center">
				<tr style="background-color:#FAFAFA;">
					<td rowspan=2>선택<input id="chkall" name="chkall" title="모두선택" onclick="fnCheckAll()" type="checkbox" checked></td>
					<td rowspan=2>지상/지하</td>
					<td rowspan=2>층</td>
					<td rowspan=2>주용도</td>
					<td rowspan=2>층별면적(평)</td>
					<td colspan=4>임대면적</td>
					<td colspan=5>임대조건</td>
					<td colspan=4>층별SPEC</td>
					<td rowspan=2>상태</td>
<!--  					
					<td colspan=6>추가정보</td>
					<td rowspan=2>층면적[바닥](평)</td>
					<td colspan=4>바닥면적</td>
-->					
				</tr>
				<tr style="background-color:#FAFAFA;">
					<td>창고</td>	
					<td>하역장</td>	
					<td>사무실</td>	
					<td>공용</td>	

					<td>계약면적</td>	
					<td>면적협의</td>	

					<td colspan=2>입주시기</td>	
<!--
					<td>To</td>
-->					
					<td>임대료/평</td>

					<td>유효고</td>	
					<td>도크수</td>
					<td>접안방식</td>
					<td>온도</td>	
					
<!--  					
					<td>적재하중</td>	
					<td>입주업체1</td>	
					<td>입주업체2</td>	
					<td>입주업체3</td>	

					<td>임대료</td>	
					<td>관리비</td>	
					<td>창고</td>	
					<td>하역장</td>	
					<td>사무실</td>	
					<td>공용</td>	
-->					
				</tr>
			</thead>				
			<tbody  align="center">
				<c:forEach var="wahafl" items="${wahaflVOList}" varStatus="status">
				<tr>
					<td>${status.count} <input type='checkbox' name='whfckd' value="${status.count}" checked>
						<input type="hidden" name='whfseq'  value="${status.count}">
					</td>
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
					<td> <span name="str_whfuse_ref">${wahafl.whflnm}</span>
						<select id="whfuse" name="whfuse" required>
						  <option value=""       <c:if test="${wahafl.whfuse eq ''}">selected</c:if>> </option>
						  <option value="창고"    <c:if test="${wahafl.whfuse eq '창고'}">selected</c:if>>창고</option>
						  <option value="하역장"    <c:if test="${wahafl.whfuse eq '하역장'}">selected</c:if>>하역장</option>
						  <option value="사무실"   <c:if test="${wahafl.whfuse eq '사무실'}">selected</c:if>>사무실</option>
						  <option value="공용" <c:if test="${wahafl.whfuse eq '공용'}">selected</c:if>>공용</option>
						</select>
					<td><input style="text-align:right" type="text" name="flarea" size="6"  value="${wahafl.flarea}"   ></td>
					
					<td><input style="text-align:right" type="text" name="flslwa" size="6"  value="${wahafl.flslwa}"  ></td>
					<td><input style="text-align:right" type="text" name="flsldo" size="6"  value="${wahafl.flsldo}"  ></td>
					<td><input style="text-align:right" type="text" name="flslof" size="6"  value="${wahafl.flslof}"  ></td>
					<td><input style="text-align:right" type="text" name="flslmz" size="6"  value="${wahafl.flslmz}"  ></td>					
					<td><input style="text-align:right" type="text" name="fllmsz" size="6"  value="${wahafl.fllmsz}"   ></td>
					<td>
						<input type="checkbox" value="협의" name="fllmyn" <c:if test="${wahafl.fllmyn eq '협의'}">checked</c:if>>
					</td>  					
					<td>
						<select id="lsfnow" name="lsfnow"  required>
						  <option value="즉시"    <c:if test="${wahafl.lsfnow eq '즉시'}">selected</c:if>>즉시</option>
						  <option value="협의"    <c:if test="${wahafl.lsfnow eq '협의'}">selected</c:if>>협의</option>
						  <option value="임대완료" <c:if test="${wahafl.lsfnow eq '임대완료'}">selected</c:if>>임대완료</option>
						</select>
					</td>
					<td><input style="text-align:center" type="date" name="lsfrom" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lsfrom}"  ></td>
<!--					
					<td><input style="text-align:center" type="date" name="lstmto" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lstmto}"  ></td>
-->					
					<td><input style="text-align:right" type="text" name="pprice" size="4" value="${wahafl.pprice}"  ></td>
					
					<td><input style="text-align:right"  type="text" name="flhegt" size="4" value="${wahafl.flhegt}"  ></td>
					<td><input style="text-align:right"  type="text" name="docknu" size="4" value="${wahafl.docknu}"  ></td>
					<td style="text-align:left">
						<input type="checkbox" value="40FT"    name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'40FT')}">checked</c:if>>40FT
						<input type="checkbox" value="20FT"    name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'20FT')}">checked</c:if>>20FT
						<input type="checkbox" value="5Ton"    name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'5Ton')}">checked</c:if>>5톤  						
						<input type="checkbox" value="화물EV"   name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'화물EV')}">checked</c:if>>화물EV					
						<input type="checkbox" value="수직반송기" name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'수직반송기')}">checked</c:if>>수직LF
					</td>					
					<td>
						<select id="whtemp" name="whtemp"  required>
						  <option value=""    <c:if test="${wahafl.whtemp eq ''}">selected</c:if>></option>
						  <option value="상온" <c:if test="${wahafl.whtemp eq '상온'}">selected</c:if>>상온</option>
						  <option value="냉장" <c:if test="${wahafl.whtemp eq '냉장'}">selected</c:if>>냉장</option>
						  <option value="냉동" <c:if test="${wahafl.whtemp eq '냉동'}">selected</c:if>>냉동</option>
						</select>
					</td>
					<td>
						<select name="status" required>
						  <option value="초기등록"  <c:if test="${wahafl.status eq '초기등록'}">selected</c:if>>초기등록</option>
						  <option value="계약진행"  <c:if test="${wahafl.status eq '계약진행'}">selected</c:if>>계약진행</option>
						  <option value="클로징"  <c:if test="${wahafl.status eq '클로징'}">selected</c:if>>클로징</option>
						</select>
						
						<input type="hidden" name="lsfrom" value="${wahafl.lsfrom}"  >
						<input type="hidden" name="lstmto" value="${wahafl.lstmto}"  >
						<input type="hidden" name="flweit" value="${wahafl.flweit}"  >
						<input type="hidden" name="lsusr1" value="${wahafl.lsusr1}"  >
						<input type="hidden" name="lsusr2" value="${wahafl.lsusr2}"  >
						<input type="hidden" name="lsusr3" value="${wahafl.lsusr3}"  >
						<input type="hidden" name="flmpay" value="${wahafl.flmpay}"  >
						<input type="hidden" name="admpay" value="${wahafl.admpay}"  >
						
						<input type="hidden" name="flszwa" value="${wahafl.flszwa}"  >
						<input type="hidden" name="flszof" value="${wahafl.flszof}"  >
						<input type="hidden" name="flszdo" value="${wahafl.flszdo}"  >
						<input type="hidden" name="flszmz" value="${wahafl.flszmz}"  >
						
					</td>
<!--  					
					<td><input style="text-align:right"  type="text" name="flweit" size="4" value="${wahafl.flweit}"  ></td>
					<td><input style="text-align:center" type="text" name="lsusr1" size="10" value="${wahafl.lsusr1}"  ></td>
					<td><input style="text-align:center" type="text" name="lsusr2" size="10" value="${wahafl.lsusr2}"  ></td>
					<td><input style="text-align:center" type="text" name="lsusr3" size="10" value="${wahafl.lsusr3}"  ></td>
					<td><input style="text-align:right"  type="text" name="flmpay" size="4" value="${wahafl.flmpay}"  ></td>
					<td><input style="text-align:right"  type="text" name="admpay" size="4" value="${wahafl.admpay}"  ></td>
					<td><input style="text-align:right"  type="text" name="flarea" size="6"  value="${wahafl.flarea}"  required ></td>
					<td><input style="text-align:right"  type="text" name="flszwa" size="6"  value="${wahafl.flszwa}"  ></td>
					<td><input style="text-align:right"  type="text" name="flszof" size="6"  value="${wahafl.flszof}"  ></td>
					<td><input style="text-align:right"  type="text" name="flszdo" size="6"  value="${wahafl.flszdo}"  ></td>
					<td><input style="text-align:right"  type="text" name="flszmz" size="6"  value="${wahafl.flszmz}"  ></td>
-->					
				</tr>
				</c:forEach>
			</tbody>
		</table>	
				<button type="button" class="btn btn-primary btn-sm" onclick="fn_formSubmit()"><span id="str_button">등록하기</span></button>
		<br>
   </form>
<br>
</div>


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

	function fn_formSubmit(){		
	
// 		if ( ! chkInputValue("#whname", "[기본정보] 창고명칭")) return false;
// 		if ( ! chkInputValue("#szarea", "[기본정보] 연면적")) return false;
		if ( $("#whname").val() == ''){
			alert("[기본정보] 창고명칭을 입력하세요");
			return false;
		}
		if ( $("#szarea").val() == ''){
			alert("[기본정보] 연면적을 입력하세요");
			return false;
		}
		if ( $("#stflnu").val() == 0){
			alert("[기본정보] 지상층수를 입력하세요");
			return false;
		}
	////	if ( ! chkInputValue("#stflnu", "[기본정보] 지상층수")) return false;
		
			var wamaData = new Object();
			wamaData.whcode = $("#whcode").val();	
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
			wamaData.stflnu = $("#stflnu").val();
			wamaData.stblnu = $("#stblnu").val();
			wamaData.cofine = $("#cofine").val();
			wamaData.cooper = $("#cooper").val();
			wamaData.mpicif = $("#mpicif").val();
			wamaData.etcstr = $("#etcstr").val();
			wamaData.prprdy = $("#prprdy").val();
			wamaData.prstdy = $("#prstdy").val();
			wamaData.brcode = $("#brcode").val();
			wamaData.img001 = $('#img001').attr("src");
			wamaData.img002 = $('#img002').attr("src");
			wamaData.kkompx = $("#kkompx").val();
			wamaData.kkompy = $("#kkompy").val();			

			wamaData.lmpsif = $("#lmpsif").val();			
			wamaData.lmpsit = $("#lmpsit").val();			
			wamaData.lmppay = $("#lmppay").val();			
			wamaData.lmpinc = $("#lmpinc").val();			
			wamaData.lmpdps = $("#lmpdps").val();			
			wamaData.lmpwhc = $("#lmpwhc").val();			
			wamaData.lmpdcc = $("#lmpdcc").val();			
			wamaData.lmpofc = $("#lmpofc").val();			
			wamaData.lmppbc = $("#lmppbc").val();			
			wamaData.lmpwtc = $("#lmpwtc").val();			
			wamaData.lmpupp = $("#lmpupp").val();			
			wamaData.lmprtf = $("#lmprtf").val();			
			wamaData.lmpadd = $("#lmpadd").val();			
			
			wamaData.mpsggc = $("#mpsggc").val();			
			wamaData.mpdngc = $("#mpdngc").val();			
			wamaData.mpabun = $("#mpabun").val();			
			wamaData.mpadji = $("#mpadji").val();			

			wamaData = JSON.stringify(wamaData);
			var jsonWmFl = new Object();
			jsonWmFl.wahamaJVO = JSON.parse(wamaData)

		
			var jsonArrWF = new Array();		
			var waflData = new Object();
			var size = $("input[name='whfckd']").length;
			var chkbox = document.getElementsByName('whfckd'); 
			var j = 0;
			for(i=0;i<size;i++){
				if(chkbox[i].checked) { 
		    	
			    	var waflData = new Object();
			    	
					if (document.getElementsByName('whfudn')[i].value == ''){ alert("[층별정보 " + (i+1) + "행 ] 지상/지하 입력하세요"); return false   }			    	
					if (document.getElementsByName('whflcd')[i].value == ''){ alert("[층별정보 " + (i+1) + "행 ] 층 입력하세요"); return false   }			    	
					if (document.getElementsByName('whfuse')[i].value == ''){ alert("[층별정보 " + (i+1) + "행 ] 주용도 입력하세요"); return false   }			    	
					if (document.getElementsByName('flarea')[i].value == ''){ alert("[층별정보 " + (i+1) + "행 ] 바닥면적 입력하세요"); return false   }			    	
			    	
//  					if ( ! chkInputValue(document.getElementsByName('whfudn')[i], "[층별정보 " + (i+1) + "행 ] " + "지상/지하")) return false;
//  					if ( ! chkInputValue(document.getElementsByName('whflcd')[i], "[층별정보 " + (i+1) + "행 ] " + "층")) return false;
//  					if ( ! chkInputValue(document.getElementsByName('whfuse')[i], "[층별정보 " + (i+1) + "행 ] " + "주용도")) return false;
//  					if ( ! chkInputValue(document.getElementsByName('flarea')[i], "[층별정보 " + (i+1) + "행 ] " + "바닥면적")) return false;
 					 //					if ( ! chkInputValue(document.getElementsByName('whtemp')[i], "[층별정보 " + (i+1) + "행 ] " + "온도")) return false;
								    	
			    	waflData.whfseq = document.getElementsByName('whfseq')[i].value;
			    	waflData.whfudn = document.getElementsByName('whfudn')[i].value;
			    	waflData.whflcd = document.getElementsByName('whflcd')[i].value;
			    	waflData.whfuse = document.getElementsByName('whfuse')[i].value;
			    	waflData.whtemp = document.getElementsByName('whtemp')[i].value;
			    	waflData.flarea = document.getElementsByName('flarea')[i].value;
			    	if(document.getElementsByName("fllmyn")[i].checked == true){
				    	waflData.fllmyn = document.getElementsByName('fllmyn')[i].value;
			    	}
			    	waflData.fllmsz = document.getElementsByName('fllmsz')[i].value;
			    	waflData.flszwa = document.getElementsByName('flszwa')[i].value;
			    	waflData.flszof = document.getElementsByName('flszof')[i].value;
			    	waflData.flszdo = document.getElementsByName('flszdo')[i].value;
			    	waflData.flszmz = document.getElementsByName('flszmz')[i].value;
			    	waflData.flslwa = document.getElementsByName('flslwa')[i].value;
			    	waflData.flslof = document.getElementsByName('flslof')[i].value;
			    	waflData.flsldo = document.getElementsByName('flsldo')[i].value;
			    	waflData.flslmz = document.getElementsByName('flslmz')[i].value;
			    	waflData.flmpay = document.getElementsByName('flmpay')[i].value;
			    	waflData.admpay = document.getElementsByName('admpay')[i].value;
			    	waflData.pprice = document.getElementsByName('pprice')[i].value;
			    	waflData.lsfnow = document.getElementsByName('lsfnow')[i].value;
			    	waflData.lsfrom = document.getElementsByName('lsfrom')[i].value;
			    	waflData.lstmto = document.getElementsByName('lstmto')[i].value;
			    	waflData.flhegt = document.getElementsByName('flhegt')[i].value;
			    	waflData.docknu = document.getElementsByName('docknu')[i].value;
			    	waflData.flweit = document.getElementsByName('flweit')[i].value;
			    	waflData.lsusr1 = document.getElementsByName('lsusr1')[i].value;
			    	waflData.lsusr2 = document.getElementsByName('lsusr2')[i].value;
			    	waflData.lsusr3 = document.getElementsByName('lsusr3')[i].value;
			    	waflData.status = document.getElementsByName('status')[i].value;

			    	
				    	var trdockArray=new Array();
				    	//trdock 체크수가 5개이므로 체크수변경시 수정필요
				    	for(z=0;z<5;z++){
				            if(document.getElementsByName("trdock")[j+z].checked == true){
				            	trdockArray.push(document.getElementsByName("trdock")[j+z].value);
				            }
				    	}		    	
			    	waflData.trdock = trdockArray.join();
			    	
			    	waflData = JSON.stringify(waflData);
			    	jsonArrWF.push(JSON.parse(waflData));
				}
		    	j = (i + 1) * 5 ;
 		    }	
			jsonWmFl.wahaflJVO = jsonArrWF
			//add
			var formData = new FormData();
			formData.append("jsonWmFl",JSON.stringify(jsonWmFl));			
			
			$.ajax({
				url: "ctrWareSave",
				type:"post", 
				dataType: 'json',
				processData : false,
				contentType: false,					
			    async: false, 
				data: JSON.stringify(jsonWmFl),
//				data: formData,
				success : function(result){      
					alert("등록하였습니다.s");
                    if(result.code == "OK") {
                        alert("OK");
                    } else {
                        alert("NG");
                    }
				},
		        error: function() {
		        	alert("등록하였습니다.e");
		        	window.location.href = "search";
//		            alert('Error occured');
		        }
		   	})		

		}
	

	function fn_upFileImg01(strfile){
//		if(strfile == 'file001'){
			var file = $("input[type=file]")[0].files[0];
			if (file) {
				var formData = new FormData();
				formData.append("file001", file); 
					$.ajax({
						url: "upFileImg01",
					    async: false, 
					    contentType: false,
					    processData: false,		
						type:"post", 
						data : formData,
						success : function(result){
			                $("#img001").attr("src", result.strImg001);
						},
				        error: function() {
				            alert('Error occured' + brcode);
				        }
				   	})
			}
//		}
	}	
 	 
	function fn_upFileImg02(strfile){
//		if(strfile == 'file001'){
			var file = $("input[type=file]")[1].files[0];
			if (file) {
				var formData = new FormData();
				formData.append("file002", file); 
					$.ajax({
						url: "upFileImg02",
					    async: false, 
					    contentType: false,
					    processData: false,		
						type:"post", 
						data : formData,
						success : function(result){
			                $("#img002").attr("src", result.strImg002);
						},
				        error: function() {
				            alert('Error occured' + brcode);
				        }
				   	})
			}
//		}
	}	
</script>
<!--
	<jsp:include page="inc_footer3.jsp" flush="true"/>
--> 
</body>
</html>
