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
    	div {  border: solid red 0px; } 
    	span { font-size:15px;text-decoration:none;}
    	label {font-size:12px;font-weight:none;margin-top:10px; margin-bottom: 0;color:#696969}
		table td {
		  vertical-align: middle !important;white-space: nowrap;font-size:14px;
		}
		select {
		  font-size:10px;
		}
		select option {
		  background: grey;
		  color: #fff;
		  padding: 3px 0;
		  font-size:10pt;
		}		
		    	
	</style>	
	
</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>

<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>창고정보등록(건축물정보기반)</strong></h5>
  	<div class="row">
        <div class="col-md-12">
			<h6  class="mt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>기본정보</strong></h6>
		<hr>
		</div>
	</div>
     <form role="form" id="formWama" name="formWama"  method="post" action="ctrWareSave">
      	 <input type="hidden" id="brpk" name="brpk"  value="${brpk}" > 
  	<div class="row">
        <div class="col-md-6">
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;">건축물 개요</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;">건물명</td>
					<td><input type="text" class="form-control form-control-sm" id="whname" name="whname" size="20" value="${wahama.whname}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">위치</td>
					<td><input type="text" class="form-control form-control-sm" style="color:grey;" id="mpadrs" name="mpadrs" size="50"  value="${wahama.mpadrs}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">대지면적(평)</td>                                                                 
					<td><input style="text-align:right" type="text" class="form-control form-control-sm" id="szposi" name="szposi" size="7" value="${wahama.szposi}"  required ></td>
				</tr>				                                                                                               
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">건축면적(평)</td>                                                                 
					<td><input style="text-align:right" type="text" class="form-control form-control-sm" id="szstrt" name="szstrt" size="7" value="${wahama.szstrt}"  required ></td>
				</tr>				                                                                                               
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">연면적(평)</td>                                                                   
					<td><input style="text-align:right" type="text" class="form-control form-control-sm" id="szarea" name="szarea" size="7" value="${wahama.szarea}"  required ></td>
				</tr>						                                                                                       
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">건폐율(%)</td>                                                                
					<td><input style="text-align:right" type="text" class="form-control form-control-sm" id="sbcret" name="sbcret" size="7"  value="${wahama.sbcret}" required ></td> 
				</tr>                                                                                                              
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">용적율(%)</td>                                                                
					<td><input style="text-align:right" type="text" class="form-control form-control-sm" id="svlret" name="svlret" size="7"  value="${wahama.svlret}" required ></td>
				</tr>						                                                                                       
				<tr>                                                                                                               
					<td style="background: #FAFAFA;">용적률산정 연면적(평)</td>                                                    
					<td><input style="text-align:right" type="text" class="form-control form-control-sm" id="sbcvlt" name="sbcvlt" size="7" value="${wahama.sbcvlt}"  required ></td>
				</tr>						                                                                                       
				<tr>
					<td style="background: #FAFAFA;">사용승인일</td>
					<td><input style="text-align:center" type="text" class="form-control form-control-sm" id="prusdy" name="prusdy" size="8" value="${wahama.prusdy}" required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축물구조</td>
					<td><input type="text" class="form-control form-control-sm" id="ifstrt" name="ifstrt" size="20" value="${wahama.ifstrt}"  required ></td>
				</tr>						
				<tr>
					<td style="background: #FAFAFA;">건축규모(층수)</td>
					<td>
					  	<div class="row">
						    <div class="col-md-3">지상 : </div>
						    <div class="col-md-3">
						    	<input type="number" class="form-control form-control-sm" id="stflnu" name="stflnu" min="0" max="10" value="${wahama.stflnu}" required >
						    </div>
						    <div class="col-md-3">지하 : </div>
						    <div class="col-md-3">
						    	<input type="number" class="form-control form-control-sm" id="stblnu" name="stblnu" min="0" max="10" value="${wahama.stblnu}" required >
						    </div>
					    </div>
					</td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">인근IC</td>
					<td><input type="text" class="form-control form-control-sm" id="mpicif" name="mpicif" size="20" value="${wahama.mpicif}"  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">특이사항</td>
					<td><input type="text" class="form-control form-control-sm" id="etcstr" name="etcstr" size="20" value="${wahama.etcstr}"  required ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">인허가일</td>
					<td><input type="text" class="form-control form-control-sm" style="text-align:center;color:grey;" id="prprdy" name="prprdy" size="20" value="${wahama.prprdy}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">착공일</td>
					<td><input type="text" class="form-control form-control-sm" style="text-align:center;color:grey;" id="prstdy" name="prstdy" size="20" value="${wahama.prstdy}" readOnly ></td>
				</tr>				
				<tr>
					<td style="background: #FAFAFA;">건축물대장번호</td>
					<td><input type="text" class="form-control form-control-sm" style="text-align:center;color:grey;" id="brcode" name="brcode" size="20" value="${wahama.brcode}" readOnly >
						<input type="hidden" id="bacode" name="bacode" value="${wahama.bacode}" >
						<input type="hidden" id="kkompx" name="kkompx" value="${wahama.kkompx}" >
						<input type="hidden" id="kkompy" name="kkompy" value="${wahama.kkompy}" >
	  	  	            <input type="hidden" id="whcode" name="whcode" value="${wahama.whcode}"  > 
	  	  	            <input type="hidden" id="cofine" name="cofine" value="${wahama.cofine}"  > 
	  	  	            <input type="hidden" id="cooper" name="cooper" value="${wahama.cooper}"  > 
					</td>						
				</tr>				
			</table>
		</div>
        <div class="col-md-6">
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr>
					<td colspan="4" style="font-weight:bolder;background: #FAFAFA;">임대 조건</td>
				</tr>									
				<tr>
					<td colspan="2" style="background: #FAFAFA;">인근임대료시세</td>
					<td colspan="2" >
					  	<div class="row">
						    <div class="col-md-5">
						    	<input style="text-align:right" type="number" class="form-control form-control-sm" min="0" max="999999" id="lmpsif" name="lmpsif" value="${wahama.lmpsif}">
						    </div>
						    <div class="col-md-2"> ~ </div>
						    <div class="col-md-5">
						    	<input style="text-align:right" type="number" class="form-control form-control-sm" min="0" max="999999" id="lmpsit" name="lmpsit" value="${wahama.lmpsit}">
						    </div>
					    </div>
					</td>					
				<tr>				                                                                       
				<tr>                                                                                       
					<td colspan="2" style="background: #FAFAFA;">임대료</td>                               
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmppay" name="lmppay" size="20" value="${wahama.lmppay}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td colspan="2" style="background: #FAFAFA;">임대료포함면적</td>                       
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpinc" name="lmpinc" size="20" value="${wahama.lmpinc}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td colspan="2" style="background: #FAFAFA;">보증금</td>                               
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpdps" name="lmpdps" size="20" value="${wahama.lmpdps}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td rowspan="8" style="background: #FAFAFA;">관리비</td>                               
					<td style="background: #FAFAFA;">창 고</td>                                             
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpwhc" name="lmpwhc" size="20" value="${wahama.lmpwhc}"></td>
				<tr>						                                                               
				<tr>                                                                                       
					<td style="background: #FAFAFA;">하역장</td>                                           
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpdcc" name="lmpdcc" size="20" value="${wahama.lmpdcc}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td style="background: #FAFAFA;">사무실</td>                                           
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpofc" name="lmpofc" size="20" value="${wahama.lmpofc}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td style="background: #FAFAFA;">공 용</td>                                             
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmppbc" name="lmppbc" size="20" value="${wahama.lmppbc}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td colspan="2" style="background: #FAFAFA;">수도광열비</td>                           
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpwtc" name="lmpwtc" size="20" value="${wahama.lmpwtc}"></td>
				<tr>				                                                                       
				<tr>                                                                                       
					<td colspan="2" style="background: #FAFAFA;">임대료인상율</td>                         
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmpupp" name="lmpupp" size="20" value="${wahama.lmpupp}"></td>
				<tr>	
				<tr>
					<td colspan="2" style="background: #FAFAFA;">Rent Free</td>
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm" id="lmprtf" name="lmprtf" size="20" value="${wahama.lmprtf}"></td>
				<tr>	
				<tr>
					<td colspan="2" style="background: #FAFAFA;">추가조건</td>
					<td colspan="2" ><input style="text-align:left" type="text" class="form-control form-control-sm"  id="lmpadd" name="lmpadd" size="35" value="${wahama.lmpadd}"></td>
				<tr>
			</table>					
		</div>
	</div>
  	<div class="row">
        <div class="col-md-12">
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr>
					<td colspan="6" style="font-weight:bolder;background: #FAFAFA;color:blue;">임대인정보</td>
				</tr>				
				<tr>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;color:blue;">개발정보</td>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;color:blue;">임대문의</td>
					<td colspan="2" style="font-weight:bolder;background: #FAFAFA;color:blue;">담당자</td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">소유자</td>
					<td><input type="text" class="form-control form-control-sm" id="cdvown" name="cdvown" size="20" value="${wahama.cdvown}" required ></td>
					<td style="background: #FAFAFA;color:blue;">소유자</td>
					<td><input type="text" class="form-control form-control-sm" id="lmvown" name="lmvown" size="20" value="${wahama.lmvown}" required ></td>
					<td style="background: #FAFAFA;color:blue;">성함</td>
					<td><input type="text" class="form-control form-control-sm" id="catnam" name="catnam" size="20" value="${wahama.catnam}" required ></td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">시행사</td>
					<td><input type="text" class="form-control form-control-sm" id="cdvsih" name="cdvsih" size="20" value="${wahama.cdvsih}" required ></td>
					<td style="background: #FAFAFA;color:blue;">AMC</td>
					<td><input type="text" class="form-control form-control-sm" id="lmvamc" name="lmvamc" size="20" value="${wahama.lmvamc}" required ></td>
					<td style="background: #FAFAFA;color:blue;">임대회사</td>
					<td><input type="text" class="form-control form-control-sm" id="catpos" name="catpos" size="20" value="${wahama.catpos}" required ></td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">시공사</td>
					<td><input type="text" class="form-control form-control-sm" id="cdvsig" name="cdvsig" size="20" value="${wahama.cdvsig}" required ></td>
					<td style="background: #FAFAFA;color:blue;">임대회사</td>
					<td><input type="text" class="form-control form-control-sm" id="lmvcom" name="lmvcom" size="20" value="${wahama.lmvcom}" required ></td>
					<td style="background: #FAFAFA;color:blue;">TEL</td>
					<td><input type="text" class="form-control form-control-sm" id="cattel" name="cattel" size="20" value="${wahama.cattel}" required ></td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">감리사</td>
					<td><input type="text" class="form-control form-control-sm" id="cdvgam" name="cdvgam" size="20" value="${wahama.cdvgam}" required ></td>
					<td style="background: #FAFAFA;color:blue;" rowspan=2>기타</td>
					<td  rowspan=2>
						<textarea class="form-control" id="lmvetc" name="lmvetc" rows="2" >${wahama.lmvetc}</textarea>
					</td>
					<td style="background: #FAFAFA;color:blue;">HP</td>
					<td><input type="text" class="form-control form-control-sm" id="cathpg" name="cathpg" size="20" value="${wahama.cathpg}" required ></td>
				</tr>				
				<tr> 
					<td style="background: #FAFAFA;color:blue;">설계사</td>
					<td><input type="text" class="form-control form-control-sm" id="cdvsul" name="cdvsul" size="20" value="${wahama.cdvsul}" required ></td>
					<td style="background: #FAFAFA;color:blue;">이메일</td>
					<td><input type="text" class="form-control form-control-sm" id="cateml" name="cateml" size="20" value="${wahama.cateml}" required ></td>
				</tr>				
				<tr> 
					<td colspan=4></td>
					<td colspan=2>
					담당자명함
							<div class="row">
<!--  							
								<div class="col-md-5">
								담당자명함
								<br>
								<img class="img-thumbnail" id="catcad" name="catcad"
									<c:choose>
										<c:when test="${empty wahama.catcad}" >
											src="images/noimg_w200h150.gif"  
										</c:when> 
										<c:otherwise>
											src="${wahama.catcad}"  
										</c:otherwise>
									</c:choose>					
									style="width:130px;height:100px;">					
								    <br>
							    </div>
								<div class="col-md-6">
								    <input type="file" style="width:30px" class="custom-file-input" id="file003" name="file003"  accept='image/*' >
								    <label class="custom-file-label" for="file003"></label>
								    <br><br>
						   			<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg03('file003')"> 이미지업로드 </button>
								</div>
-->								
							</div>
					</td>
				</tr>				
				
			</table>	
		</div>
	</div>			
	<br>
		<!-- row -->
  	<div class="row">
        <div class="col-md-4">
			<div class="row">
				<div class="col-md-12">전경도
				<hr>
				<img class="img-thumbnail" id="img001" name="img001"
					<c:choose>
						<c:when test="${empty wahama.img001}" >
							src="images/noimg_w200h150.gif"  
						</c:when> 
						<c:otherwise>
							src="${wahama.img001}"  
						</c:otherwise>
					</c:choose>					
					style="width:100%;height:200px;">					
				</div>
			</div>
			<div class="flex-row">
				<div class="col-md-12 ">
				    <br>
				    <input type="file" class="custom-file-input" id="file001" name="file001"  accept='image/*' >
				    <label class="custom-file-label" for="file001">파일선택</label>
		   			<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg01('file001')"> 이미지업로드 </button>
				</div>
			</div>
		</div>
        <div class="col-md-4">
			위치<hr>
			<div id="map" style="width:100%;height:200px;border:1px solid grey;"></div>
		</div>
        <div class="col-md-4">
			<div class="row">
				<div class="col-md-12">배치도
				<hr>
				<img class="img-thumbnail" id="img002" name="img002"
					<c:choose>
						<c:when test="${empty wahama.img002}" >
							src="images/noimg_w200h150.gif"  
						</c:when> 
						<c:otherwise>
							src="${wahama.img002}"  
						</c:otherwise>
					</c:choose>					
					style="width:100%;height:200px;">					
				</div>
			</div>
			<div class="flex-row">
				<div class="col-md-12 ">
				    <br>
				    <input type="file" class="custom-file-input" id="file002" name="file002"  accept='image/*' >
				    <label class="custom-file-label" for="file002">파일선택</label>
		   			<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg02('file002')"> 이미지업로드 </button>
				</div>
			</div>
		</div>		
	</div>	
	<hr>
	
  	<div class="row mt-5">
        <div class="col-md-12">		
		<h6  class="mt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>층별정보</strong></h6>
			<table  id="tables" class="table table-bordered table-sm" style="cellspacing:0;width:100%;text-align:center;" >
			<tbody>
				<tr style="background-color:#FAFAFA;">
					<td rowspan=2><input  id="chkall" name="chkall" title="모두선택" onclick="fnCheckAll()" type="checkbox" checked><br>선택</td>
					<td rowspan=2>지상/지하</td>
					<td rowspan=2>층</td>
					<td rowspan=2 colspan=2>주용도</td>
					<td rowspan=2>층별면적(평)</td>
					<td colspan=5>임대면적</td>
					<td colspan=5 style="color:blue">공실면적</td>
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
					<td>창 고</td>	
					<td>하역장</td>	
					<td>사무실</td>	
					<td>공 용</td>	
					<td>임대면적(합)</td>	
					
					
					<td style="color:blue">창 고</td>	
					<td style="color:blue">하역장</td>	
					<td style="color:blue">사무실</td>	
					<td style="color:blue">공 용</td>	
					<td style="color:blue">공실면적(합)</td>	
					
					
					<td>면적협의</td>	
					<td colspan=2>입주시기</td>	
<!--
					<td>To</td>
-->					
					<td style="color:blue">비용협의</td>	
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
				<c:forEach var="wahafl" items="${wahaflVOList}" varStatus="status">
				<tr>

					<c:choose>
						<c:when test="${wahafl.whfseq ne null}">
							<td>${wahafl.whfseq} &nbsp; <input type='checkbox' name='whfckd' value="${wahafl.whfseq}" checked>
								<input type="hidden" name='whfseq'  value="${wahafl.whfseq}">
							</td>
						</c:when> 
						<c:otherwise>
							<td>${status.count} &nbsp; <input type='checkbox' name='whfckd' value="${status.count}" checked>
								<input type="hidden" name='whfseq'  value="${status.count}">
							</td>
						</c:otherwise>
					</c:choose>					
					<td>
		                <select class="custom-select" id="whfudn" name="whfudn" style="font-size:13px;min-width:80px;" required>
							  <option value="지상" style="font-size:10pt" <c:if test="${wahafl.whfudn eq '지상'}">selected</c:if>>지상</option>
							  <option value="지하" style="font-size:10pt" <c:if test="${wahafl.whfudn eq '지하'}">selected</c:if>>지하</option>
							  <option value="옥탑" style="font-size:10pt" <c:if test="${wahafl.whfudn eq '옥탑'}">selected</c:if>>옥탑</option>
		                </select>
					</td>
					<td>
						<select class="custom-select" id="whflcd" name="whflcd" style="font-size:13px;min-width:50px;" required>
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
					<td> 
							<label name="str_whfuse_ref">${wahafl.whflnm}</label>
					</td>	
					<td> 
							<select class="custom-select" id="whfuse" name="whfuse"  style="font-size:13px;min-width:80px;" required>
							  <option value=""       <c:if test="${wahafl.whfuse eq ''}">selected</c:if>> </option>
							  <option value="상온창고"    <c:if test="${wahafl.whfuse eq '상온창고'}">selected</c:if>>상온창고</option>
							  <option value="냉장냉동창고"    <c:if test="${wahafl.whfuse eq '냉장냉동창고'}">selected</c:if>>냉장냉동창고</option>
							  <option value="냉동창고"    <c:if test="${wahafl.whfuse eq '냉동창고'}">selected</c:if>>냉동창고</option>
							  <option value="냉장창고"    <c:if test="${wahafl.whfuse eq '냉장창고'}">selected</c:if>>냉장창고</option>
							  <option value="위험물창고"    <c:if test="${wahafl.whfuse eq '위험물창고'}">selected</c:if>>위험물창고</option>
							  <option value="하역장"    <c:if test="${wahafl.whfuse eq '하역장'}">selected</c:if>>하역장</option>
							  <option value="사무실"   <c:if test="${wahafl.whfuse eq '사무실'}">selected</c:if>>사무실</option>
							  <option value="공용" <c:if test="${wahafl.whfuse eq '공용'}">selected</c:if>>공용</option>
							</select>
					</td>	
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flarea" size="6"  value="${wahafl.flarea}"   ></td>
					
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flslwa" size="6"  value="${wahafl.flslwa}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flsldo" size="6"  value="${wahafl.flsldo}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flslof" size="6"  value="${wahafl.flslof}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flslmz" size="6"  value="${wahafl.flslmz}"  ></td>
										
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="fllmsz" size="6"  value="${wahafl.fllmsz}"   ></td>
					
<!-- 공실면적 add start-->					
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flsewa" size="6"  value="${wahafl.flsewa}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flsedo" size="6"  value="${wahafl.flsedo}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flseof" size="6"  value="${wahafl.flseof}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flsemz" size="6"  value="${wahafl.flsemz}"  ></td>					
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;" type="number" name="flsesz" size="6"  value="${wahafl.flsesz}"   ></td>
<!-- 공실면적 add end-->					

					<td>
						<div class="form-check-inline">
						  <label class="form-check-label">
							<input  class="form-check-input" type="checkbox" value="협의" name="fllmyn" <c:if test="${wahafl.fllmyn eq '협의'}">checked</c:if>>협의						  
						  </label>
						</div>	
					</td>  					
					
					<td>
						<select class="custom-select" id="lsfnow" name="lsfnow" style="font-size:13px;min-width:80px;" required>
						  <option value="즉시"    <c:if test="${wahafl.lsfnow eq '즉시'}">selected</c:if>>즉시</option>
						  <option value="협의"    <c:if test="${wahafl.lsfnow eq '협의'}">selected</c:if>>협의</option>
						  <option value="임대완료" <c:if test="${wahafl.lsfnow eq '임대완료'}">selected</c:if>>임대완료</option>
						</select>
					</td>
					<td><input class="form-control form-control-sm" style="text-align:center" type="date" name="lsfrom" min="2021-12-01" max="2030-12-31" size="4" value="${wahafl.lsfrom}"  ></td>

<!-- 임대료협의 add start-->					
					<td>
						<div class="form-check-inline">
						  <label class="form-check-label">
							<input  class="form-check-input" type="checkbox" value="협의" name="pricyn" <c:if test="${wahafl.pricyn eq '협의'}">checked</c:if>>협의						  
						  </label>
						</div>	
					</td>  					
<!-- 임대료협의 add end-->					

					<td><input class="form-control form-control-sm"  style="text-align:right;min-width:80px;" type="number" name="pprice" size="4" value="${wahafl.pprice}"  ></td>
					
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;"  type="number" name="flhegt" size="4" value="${wahafl.flhegt}"  ></td>
					<td><input class="form-control form-control-sm" style="text-align:right;min-width:80px;"  type="number" name="docknu" size="4" value="${wahafl.docknu}"  ></td>
					
					<td style="text-align:left">					
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="40FT"    name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'40FT')}">checked</c:if>>40FT
						  </label>
						</div>					
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="20FT"    name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'20FT')}">checked</c:if>>20FT
						  </label>
						</div>	
						<div class="form-check-inline">
						  <label class="form-check-label">
						    <input type="checkbox" class="form-check-input" value="5Ton"    name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'5Ton')}">checked</c:if>>5톤
						  </label>
						</div>	
						<div class="form-check-inline">
						  <label class="form-check-label">
							<input type="checkbox" class="form-check-input" value="화물EV"   name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'화물EV')}">checked</c:if>>화물EV					
						  </label>
						</div>	
						<div class="form-check-inline">
						  <label class="form-check-label">
							<input type="checkbox" class="form-check-input" value="수직반송기" name="trdock"  <c:if test="${fn:contains(wahafl.trdock,'수직반송기')}">checked</c:if>>수직LF	
						  </label>
						</div>	
					</td>					
					<td>
						<select class="custom-select" id="whtemp" name="whtemp" style="font-size:13px;min-width:80px;" required>
						  <option value=""    <c:if test="${wahafl.whtemp eq ''}">selected</c:if>></option>
						  <option value="상온" <c:if test="${wahafl.whtemp eq '상온'}">selected</c:if>>상온</option>
						  <option value="냉장" <c:if test="${wahafl.whtemp eq '냉장'}">selected</c:if>>냉장</option>
						  <option value="냉동" <c:if test="${wahafl.whtemp eq '냉동'}">selected</c:if>>냉동</option>
						</select>
					</td>
					<td>
						<select class="custom-select" name="status" style="font-size:13px;min-width:120px;" required>
						  <option value="초기등록"  <c:if test="${wahafl.status eq '초기등록'}">selected</c:if>>초기등록</option>
						  <option value="계약진행"  <c:if test="${wahafl.status eq '계약진행'}">selected</c:if>>계약진행</option>
						  <option value="클로징"  <c:if test="${wahafl.status eq '클로징'}">selected</c:if>>클로징</option>
						</select>
						
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
		</table>	
		</div>		
	</div>	
	<div class="row mb-5">
		<div class="col-md-12 d-flex justify-content-center mt-5">
			<button type="button" class="btn btn-primary btn-sm" onclick="fn_formSubmit()"><span id="str_button">등록하기</span></button>
			<hr>
		</div>
    </div>		
   </form>
</div>

<jsp:include page="inc_footer.jsp" flush="true"/> 

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
    } else {
    	
        document.getElementById("kkompx").value = 37.2692521;
        document.getElementById("kkompy").value = 127.3743243;
        
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
			wamaData.bacode = $("#bacode").val();
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

			wamaData.cdvown = $("#cdvown").val();			
			wamaData.cdvsih = $("#cdvsih").val();			
			wamaData.cdvsig = $("#cdvsig").val();			
			wamaData.cdvgam = $("#cdvgam").val();			
			wamaData.cdvsul = $("#cdvsul").val();			
			wamaData.lmvown = $("#lmvown").val();			
			wamaData.lmvamc = $("#lmvamc").val();			
			wamaData.lmvcom = $("#lmvcom").val();			
			wamaData.lmvetc = $("#lmvetc").val();			
			wamaData.catnam = $("#catnam").val();			
			wamaData.catpos = $("#catpos").val();			
			wamaData.cattel = $("#cattel").val();			
			wamaData.cathpg = $("#cathpg").val();			
			wamaData.cateml = $("#cateml").val();			
			wamaData.catcad = $("#catcad").val();			

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
			    	
			    	waflData.flsewa = document.getElementsByName('flsewa')[i].value;
			    	waflData.flsedo = document.getElementsByName('flsedo')[i].value;
			    	waflData.flseof = document.getElementsByName('flseof')[i].value;
			    	waflData.flsemz = document.getElementsByName('flsemz')[i].value;
			    	waflData.flsesz = document.getElementsByName('flsesz')[i].value;
			    	
			    	if(document.getElementsByName("pricyn")[i].checked == true){
				    	waflData.pricyn = document.getElementsByName('pricyn')[i].value;
			    	}
			    	
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
//				dataType: 'json',
				processData : false,
				contentType: false,					
			    async: false, 
				data: JSON.stringify(jsonWmFl),
//				data: formData,
				success : function(result){      
					alert("적용하였습니다.");
 		        	window.location.href = "detail?whcode="+result;
//                     if(result.code == "OK") {
//                         alert("OK");
//                     } else {
//                         alert(result);
//                     }
				},
			     error:function(request,status,error){
			         alert("code:"+request.status+"\n"+"error:"+error);
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
</body>
</html>
