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
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js" integrity="sha512-Y2IiVZeaBwXG1wSV7f13plqlmFOx8MdjuHyYFVoYzhyRr3nH/NMDjTBSswijzADdNzMyWNetbLMfOpIPl6Cv9g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>      
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
<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>접수리스트</strong></h5>
    <div class="row mt-5">
		<div class="col-md-10"></div>
		<div class="col-md-2">검색결과 : ${fn:length(reqlmList)} 건</div>
	</div>	
    <div class="row mt-5">
		<div class="col-md-12">
			<div class="table-responsive">
				<table class="table table-hover table-bordered table-sm" style="cellspacing:0;text-align:center;" >
						<tr style="background-color:#FAFAFA;">
							<td rowspan="2">순번</td>
							<td rowspan="2">접수번호</td>
							<td colspan="3">임차요청사</td>				
							<td colspan="9">희망조건</td>
							<td colspan="5">임차담당자</td>				
							<td colspan="5">접수자정보</td>				
							<td colspan="6">공동중계정보</td>
							<td rowspan="2">상태</td>
						</tr>
						<tr style="background-color:#FAFAFA; font-size:15px;">
						
							<td>기업명</td>
							<td>업종</td>
							<td>취급품목</td>

							<td>온도</td>
							<td>면적(평)</td>
							<td>지역구분</td>
							<td>선호지역1</td>
							<td>선호지역2</td>
							<td>선호지역3</td>
							<td>즉시입주</td>
							<td>입주시기</td>
							<td>계약(월)</td>

							<td>담당자</td>
							<td>직위</td>
							<td>연락처</td>
							<td>이메일</td>
							<td>매출액</td>
							<td>명함</td>

							<td>접수자</td>
							<td>유형</td>
							<td>날짜</td>
							<td>시간</td>
							<td>구분</td>
							
							<td>제공자</td>
							<td>공동중개사</td>
							<td>담당자</td>
							<td>전화번호</td>
							<td>명함</td>

						</tr>
						<c:forEach var="reqlm" items="${reqlmList}" varStatus="status">
						<tr style="font-size:14px;">
		  					<td>${status.count} </td> 
		
		<!--  					
		  					<td>${reqlm.reqseq}</td>
		-->  					 
							<td><a href="reqlmForm?reqseq=${reqlm.reqseq}" >${reqlm.reqseq}</a></td>
							<td>${reqlm.lmcopr}</td> 
		  					<td>${reqlm.lmsect}</td> 
		  					<td>${reqlm.lmitem}</td> 

		  					<td>${reqlm.lmtemp}</td> 
		  					<td>${reqlm.lmsize}</td> 
		  					<td>${reqlm.larea0}</td> 
		  					<td>${reqlm.larea1}</td> 
		  					<td>${reqlm.larea2}</td> 
		  					<td>${reqlm.larea3}</td> 
		  					<td>${reqlm.lminow}</td> 
		  					<td>${reqlm.lmfrom}</td> 
		  					<td>${reqlm.lmterm}</td> 

		  					<td>${reqlm.lmcont}</td> 
		  					<td>${reqlm.lmsitr}</td> 
		  					<td>${reqlm.lmtelp}</td> 
		  					<td>${reqlm.lmemal}</td> 
		  					<td>${reqlm.lmcapi}</td> 
		  					<td>
								<c:if test="${(reqlm.lmbzcr ne '') and (reqlm.lmbzcr ne ' ') and (reqlm.lmbzcr ne null)}">	
						            <a href="${reqlm.lmbzcr}" data-toggle="lightbox" class="col-sm-3" data-title="<label></label>" data-footer="<label></label>">
						                명함보기
						            </a>							
							 	</c:if>		  					
		  					</td>
		  					<td>${reqlm.requsr}</td> 
		  					<td>${reqlm.reqday}</td> 
		  					<td>${reqlm.reqcod}</td> 
		  					<td>${reqlm.reqtim}</td> 
		  					<td>${reqlm.rqifcd}</td> 
		  					<td>${reqlm.rqiusr}</td> 
		  					<td>${reqlm.rqicop}</td> 
		  					<td>${reqlm.rqiman}</td> 
		  					<td>${reqlm.rqitel}</td> 
		  					<td>
								<c:if test="${(reqlm.rqbzcr ne '') and (reqlm.rqbzcr ne ' ') and (reqlm.rqbzcr ne null)}">	
						            <a href="${reqlm.rqbzcr}" data-toggle="lightbox" class="col-sm-3" data-title="<label></label>" data-footer="<label></label>">
						                명함보기
						            </a>							
							 	</c:if>		  					
		  					</td>
		  					<td>${reqlm.rqstat}</td>
  					 
						</tr>
						</c:forEach>
				</table>
			</div>	
		</div>
	</div>
<br>	
</div>
<br><br>
<jsp:include page="inc_footer.jsp" flush="true"/> 
<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox();
	});
</script>
</body>
</html>