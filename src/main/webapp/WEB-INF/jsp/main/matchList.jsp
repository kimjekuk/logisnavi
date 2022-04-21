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
	<style>	
    	div {  border: solid red 1px; } 
    	span { font-size:15px;text-decoration:none;}
    	label {font-size:12px;font-weight:none;margin-top:10px; margin-bottom: 0;color:#696969}
		table td {
		  vertical-align: middle !important;white-space: nowrap;font-size:14px;
		}    
  	    hr {
		    height: 1px;
		    background: #FAFAFA;
	    }		
	</style>	
	<script type="text/javascript">
	function fn_formSubmit(){
//		if ( $("#searchKeyword").val() == ''){	alert("명칭 또는 주소 일부분을 입력하세요");	return false; }
		document.form1.submit();	
	}
	
	
	function fn_formSubmit2(formName){
		
		alert('공사중');
		
//		document.formName.submit();	
	}
	
	function fn_viewSuggestDiv(){
		$('[name=suggestDiv]').css("display","block");
	}		
	function fn_hideSuggestDiv(){
		$('[name=suggestDiv]').css("display","none");				
	}		
	</script>	
	
	
  </head>
<body>
<jsp:include page="inc_header.jsp" flush="true"/>
<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>임차임대 매칭리스트</strong></h5>
	<form role="form" id="form1" name="form1"  method="post">
	  <div class="row">
	        <div class="col-md-12">
				<div class="card ml-3 mr-3">
		 		 	<div class="card-body">
						<div class="row">
							<div class="col-md-12">
							</div>
			            </div>
						<div class="row">
							<div class="col-md-12">
								<label for="requsr"><b>[ 매칭 조건 ]</b></label>
							</div>						
							<div class="col-md-2">
								<label for="requsr">면적차이허용(평)</label> 
				                 <select class="form-control form-control-sm" id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
					                  <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'      }">selected</c:if>> 접수면적과일치 </option>
					                  <option value="100"  <c:if test="${searchVO.searchExt1 eq '100'    }">selected</c:if>> &#177; 100평 </option>
					                  <option value="300"  <c:if test="${searchVO.searchExt1 eq '300'    }">selected</c:if>> &#177; 300평 </option>
					                  <option value="500"  <c:if test="${searchVO.searchExt1 eq '500'    }">selected</c:if>> &#177; 500평 </option>
					                  <option value="1000" <c:if test="${searchVO.searchExt1 eq '1000'   }">selected</c:if>> &#177; 1000평 </option>
				                 </select>
							</div>
							<div class="col-md-2">
								<label for="searchExt2">온도매칭</label> 
				                 <select class="form-control form-control-sm" id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
					                  <option value="매칭안함"  <c:if test="${searchVO.searchExt2 eq '매칭안함'    }">selected</c:if>> 매칭안함 </option>
					                  <option value="매칭"    <c:if test="${searchVO.searchExt2 eq '매칭'      }">selected</c:if>> 매칭 </option>
				                 </select>
							</div>
							<div class="col-md-3">
								<label for="searchExt5">지역매칭(전체/수도권/수도권외)</label> 
				                 <select class="form-control form-control-sm" id="searchExt5" name="searchExt5" value='<c:out value="${searchVO.searchExt5}"/>'>
					                  <option value="매칭안함"  <c:if test="${searchVO.searchExt5 eq '매칭안함'    }">selected</c:if>> 매칭안함 </option>
					                  <option value="매칭"    <c:if test="${searchVO.searchExt5 eq '매칭'      }">selected</c:if>> 매칭 </option>
				                 </select>
							</div>
			            </div>
			            <hr>			            
						<div class="row">
							<div class="col-md-12">
								<label for="requsr"><b>[ 창고정보 ]</b></label>
							</div>						
							<div class="col-md-2">
								<label for="searchExt3">층별상태</label> 
				                 <select class="form-control form-control-sm" id="searchExt3" name="searchExt3" value='<c:out value="${searchVO.searchExt3}"/>'>
					                  <option value="전체"  <c:if test="${searchVO.searchExt3 eq '전체'    }">selected</c:if>> 전체 </option>
					                  <option value="클로징제외"    <c:if test="${searchVO.searchExt3 eq '클로징제외'      }">selected</c:if>> 클로징제외 </option>
				                 </select>
							</div>
							<div class="col-md-2">
								<label for="searchExt4">입주시기</label>
				                 <select class="form-control form-control-sm" id="searchExt4" name="searchExt4" value='<c:out value="${searchVO.searchExt4}"/>'>
					                  <option value="전체"  <c:if test="${searchVO.searchExt4 eq '전체'    }">selected</c:if>> 전체 </option>
					                  <option value="즉시 또는 협의"    <c:if test="${searchVO.searchExt4 eq '즉시 또는 협의'      }">selected</c:if>> 즉시 또는 협의 </option>
					                  <option value="즉시"    <c:if test="${searchVO.searchExt4 eq '즉시'      }">selected</c:if>> 즉시 </option>
					                  <option value="협의"    <c:if test="${searchVO.searchExt4 eq '협의'      }">selected</c:if>> 협의 </option>
				                 </select>								
							</div>							
			            </div>
			            <br>
						<div class="row">
							<div class="col-md-12 d-flex justify-content-center mt-1">
								<button type="button"  class="btn btn-sm btn-primary"  onclick="fn_formSubmit()"> 매칭정보 호출</button>
							</div>
			            </div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<span>
							매칭결과 : ${fn:length(matchList)} 개층
						</span>
					</div>
	     	   </div>		
				<div class="row">
					<div class="col-md-5"></div>
					<div class="col-md-3">
						<button class="btn btn-sm btn-danger" type="button"  onclick="fn_viewSuggestDiv()">제안모드</button>
							&nbsp;&nbsp;
						<button class="btn btn-sm btn-secondary" type="button"  onclick="fn_hideSuggestDiv()">검색모드</button>
					</div>
					<div class="col-md-4"></div>
				</div>	     	   			            								
			</div>
		</div>
      </form>

    <div class="row mt-4">
		<div class="col-md-12">
			<c:set var="req_no" value="0" />	
			<c:forEach var="list" items="${matchList}" varStatus="status">
				<c:if test="${reqseq_temp ne list.reqseq}">
				<c:set var="req_no" value="${req_no = req_no + 1}" />	
					<div class="table-responsive mt-3">
						<table class="table table-hover table-bordered table-sm" style="cellspacing:0;text-align:center;" >
							<tr style="background-color:#004080; font-size:15px;color:white">
								<td>NO</td>
								<td>접수번호</td>
								<td>온도</td>
								<td>면적(평)</td>
								<td>지역구분</td>
<!--  								
								<td>선호지역1</td>
								<td>선호지역2</td>								
								<td>선호지역3</td>
-->								
								<td>즉시입주</td>
								<td>입주시기</td>
								<td>계약(월)</td>
								<td>접수일</td>
								<td>상태</td>
							</tr>			
							<tr style="background-color:#F8FFFF; font-size:15px;">
			  					<td>${req_no}</td> 
								<td><a href="reqlmForm?reqseq=${list.reqseq}" >${list.reqseq}</a></td>
			  					<td>${list.lmtemp}</td> 
			  					<td><fmt:formatNumber value="${list.lmsize}" pattern="#,###" /></td> 
			  					<td>${list.larea0}</td> 
<!--  								
			  					<td>${list.larea1}</td> 
			  					<td>${list.larea2}</td> 
			  					<td>${list.larea3}</td> 
-->								
			  					<td>${list.lminow}</td> 
			  					<td>${list.lmfrom}</td> 
			  					<td>${list.lmterm}</td> 
			  					<td>${list.reqday}</td> 
			  					<td>${list.rqstat}</td> 
							</tr>			
						</table>
					</div>
				</c:if>

<!-- 	------------------------------------------------------------------	 -->			
<!-- 	------------------------------------------------------------------	 -->			

	<div id="${list.reqseq}" name="suggestDiv" style="display:none">
				<form role="form" name="f${list.reqseq}"  method="post" action="suggestForm">	
					<c:if test="${reqseq_temp ne list.reqseq}">
						<div class="col-sm-12">
							<button type="button" class="btn btn-danger btn-sm" onclick="fn_formSubmit2('f${list.reqseq}')">선택창고 제안하기</button>
							 &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  
							<input type="radio" value="${list.reqseq}" name="formLayout"> <span style="font-size:13px"> 레이아웃1 </span > &nbsp;&nbsp; 
							<input type="radio" value="${list.reqseq}" name="formLayout"> <span style="font-size:13px"> 레이아웃2 </span > &nbsp;&nbsp; 
							<input type="radio" value="${list.reqseq}" name="formLayout"> <span style="font-size:13px"> 레이아웃3 </span > &nbsp;&nbsp; 
							<input type="hidden" value="${list.reqseq}" name="paramReqseq"> 
						</div>
						<br>				
					</c:if>
					<c:if test="${reqseq_temp eq list.reqseq}">
						<div class="row">
								<c:if test="${list.wmf_whcode ne matchList[status.index + 1].wmf_whcode}">
									<div class="col-sm-1" style="border:1px red;text-align:center">
										<input type="checkbox" value="${list.wmf_whcode}" name="suggestWhs">
									</div>						
									<div class="col-sm-11" style="border:1px red">
										<p style="font-size:13px">${list.wmf_whname}</p>
									</div>						
								</c:if>
						</div>	
					</c:if>								
				</form>
				
	</div>				
				<c:if test="${reqseq_temp ne list.reqseq}">
					<div class="table-responsive">
						<table class="table table-hover table-bordered table-sm" style="cellspacing:0;text-align:center;" >
							<tr style="background-color:#FAFAFA; font-size:12px;">
								<td colspan="4">창고정보</td>
								<td colspan="7">층별정보</td>
							</tr>							
							<tr style="background-color:#FAFAFA; font-size:12px;">
								
								<td>창고코드</td>
								<td>창고명</td>
<!--  								
								<td>창고주소</td>
-->
								<td>면적(평)</td>
								<td>건축규모</td>
								
								<td>층정보</td>
								<td>주용도</td>
								<td>온도</td>
								<td>층면적(평)</td>
								<td>입주시기</td>
								<td>상태</td>
								<td>면적오차(평)</td>
								
							</tr>			
				</c:if>		
							<tr style="background-color:#fff; font-size:12px;">
								<td><a href="detail?whcode=<c:out value="${list.wmf_whcode}"/>">${list.wmf_whcode}</a></td>
								<td>${list.wmf_whname}</td>
<!--  								
								<td>${list.wm_mpadrs}</td>
-->								
								<td><fmt:formatNumber value="${list.wmf_szarea}" pattern="#,###" /></td>
								<td>${list.wmf_ifsize}</td>
								<td>${list.wmf_whflnm}</td>
								<td>${list.wmf_whfuse}</td>
								<td>${list.wmf_whtemp}</td>
								<td><fmt:formatNumber value="${list.wmf_fllmsz}" pattern="#,###" /></td>
								<td>( ${list.wmf_lsfnow} ) ~ ${list.wmf_lsfrom} </td>
								<td>${list.wmf_status}</td>
								<td><fmt:formatNumber value="${list.difsize}" pattern="#,###" /></td>
							</tr>			
				<c:set var="reqseq_temp" value="${list.reqseq}" />	
				<c:set var="reqseq_next" value="${matchList[status.index + 1].reqseq}"/> 
				<c:if test="${reqseq_temp ne reqseq_next}">
					   </table>
				   <hr>		
				   </div>		
				</c:if>		
			</c:forEach>
		</div>		
	</div>		
</div>
<br><br>


<jsp:include page="inc_footer.jsp" flush="true"/> 
<script>
//	var area_r = $(":input:radio[name=searchExt4]:checked").val();
//	if(area_r==null){
//		$('input:radio[name=searchExt4]:input[value="1"]').attr("checked", true);
//	}
</script></body>
</html>