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
	<script>
	
		function fn_formSubmit(){
			if ( $("#searchKeyword").val() == ''){	alert("명칭 또는 주소 일부분을 입력하세요");	return false; }
// 			if ( ! chkInputValue("#searchKeyword", "명칭 또는 주소 일부분 ")) return false;

 			if(Number($("#searchExt1").val()) > Number($("#searchExt2").val())){
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
		
		function fn_getModalinfo(brcode){
			$.ajax({
				url: "detailTitle",
				type:"post", 
				data : {mgbdrgpk: brcode},
				success : function(result){         
					var titlepartVO = result;
					$('#modal_mgbdrgpk').text(titlepartVO.mgbdrgpk);
					$('#modal_ldxy').text(titlepartVO.ldxy);
					$('#modal_nadbob').text(titlepartVO.nadbob);
					$('#modal_ldar').text(titlepartVO.ldar);
					$('#modal_grossar').text(titlepartVO.grossar);
					$('#modal_dongnm').text(titlepartVO.dongnm);
					$('#modal_star').text(titlepartVO.star);
					$('#modal_cprtesgrossar').text(titlepartVO.cprtesgrossar);
					$('#modal_bdcnt').text(titlepartVO.bdcnt);
					$('#modal_bdrt').text(titlepartVO.bdrt);
					$('#modal_cprt').text(titlepartVO.cprt);
					$('#modal_hosu').text(titlepartVO.hosu);
					$('#modal_mauscdnm').text(titlepartVO.mauscdnm);
					$('#modal_etstruct').text(titlepartVO.etstruct);
					$('#modal_maextdvcd').text(titlepartVO.maextdvcd);
					$('#modal_apday').text(titlepartVO.apday);
					$('#modal_strstday').text(titlepartVO.strstday);
					$('#modal_permday').text(titlepartVO.permday);

					$('#modal_inmsnu').text(titlepartVO.inmsnu);
					$('#modal_otmsnu').text(titlepartVO.otmsnu);
					$('#modal_insfnu').text(titlepartVO.insfnu);
					$('#modal_otsfnu').text(titlepartVO.otsfnu);
					$('#modal_elevcnt').text(titlepartVO.elevcnt);
					$('#modal_liftcnt').text(titlepartVO.liftcnt);
					
					$('#modal_idx').val(titlepartVO)
				},
		        error: function() {
		            alert('Error occured' + brcode);
		        }
		   	})
			$('#myModal').modal("show");
		}	
		
		function fn_viewmap(){
			$('#map').css("display","block");
			map.relayout();
			setBounds(bounds);
		}		
		function fn_hidemap(){
			$('#map').css("display","none");				
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
<div class="container" style="background-color:white">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>창고정보검색</strong></h5>
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
							<!--  
							<div class="col-md-1"></div>
							<div class="col-md-2">
								<label>기준 (층/창고)</label> 
								<select class="custom-select" id="searchExt3" name="searchExt3" style="font-size:13px;min-width:20px;" required>
								  <option value="층별"    <c:if test="${searchVO.searchExt3 eq '층별'}">selected</c:if>>층별</option>
								  <option value="창고별"   <c:if test="${searchVO.searchExt3 eq '창고별'}">selected</c:if>>창고별</option>
								</select>
							</div>
							-->
							<div class="col-md-2">
								<label for="requsr">층별연면적 하한(평)</label> 
				                 <select class="form-control form-control-sm" id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
				                  <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'      }">selected</c:if>> 하한선없음 </option>
				                  <option value="100"  <c:if test="${searchVO.searchExt1 eq '100'    }">selected</c:if>>  100평 </option>
				                  <option value="300"  <c:if test="${searchVO.searchExt1 eq '300'    }">selected</c:if>> 300평 </option>
				                  <option value="500"  <c:if test="${searchVO.searchExt1 eq '500'    }">selected</c:if>> 500평 </option>
				                  <option value="1000" <c:if test="${searchVO.searchExt1 eq '1000'   }">selected</c:if>> 1000평 </option>
				                  <option value="3000" <c:if test="${searchVO.searchExt1 eq '3000'   }">selected</c:if>> 3000평 </option>
				                 </select>
							</div>
							<div class="col-md-2">
								<label for="requsr">층별연면적 상한(평)</label> 
				                 <select class="form-control form-control-sm" id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
				                  <option value="99999999"    <c:if test="${searchVO.searchExt2   eq '99999999'     }">selected</c:if>>  상한선없음 </option>
				                  <option value="100"   <c:if test="${searchVO.searchExt2  eq '100'   }">selected</c:if>>  100평 </option>
				                  <option value="300"   <c:if test="${searchVO.searchExt2  eq '300'   }">selected</c:if>> 300평 </option>
				                  <option value="500"    <c:if test="${searchVO.searchExt2 eq '500'   }">selected</c:if>> 500평 </option>
				                  <option value="1000"  <c:if test="${searchVO.searchExt2  eq '1000'  }">selected</c:if>> 1000평 </option>
				                  <option value="3000"  <c:if test="${searchVO.searchExt2  eq '3000'  }">selected</c:if>> 3000평 </option>
				                 </select>
							</div>
							<div class="col-md-1"></div>
			            </div>	
						<div class="row">
							<div class="col-md-12">&nbsp;</div>						
			            </div>	
						<div class="row">
							<div class="col-md-3">
								<label style="color:blue">유형</label> 
								<select class="custom-select" id="searchExt4" name="searchExt4"  style="font-size:13px;min-width:80px;" required>
								  <option value=""          <c:if test="${searchVO.searchExt4 eq ''}"         >selected</c:if>>전체      </option>
								  <option value="상온창고"    <c:if test="${searchVO.searchExt4 eq '상온창고'}"   >selected</c:if>>상온창고    </option>
								  <option value="냉장냉동창고" <c:if test="${searchVO.searchExt4 eq '냉장냉동창고'}">selected</c:if>>냉장냉동창고  </option>
								  <option value="냉동창고"    <c:if test="${searchVO.searchExt4 eq '냉동창고'}"   >selected</c:if>>냉동창고    </option>
								  <option value="냉장창고"    <c:if test="${searchVO.searchExt4 eq '냉장창고'}"   >selected</c:if>>냉장창고    </option>
								  <option value="위험물창고"  <c:if test="${searchVO.searchExt4 eq '위험물창고'}"  >selected</c:if>>위험물창고  </option>
								  <option value="하역장"     <c:if test="${searchVO.searchExt4 eq '하역장'}"     >selected</c:if>>하역장     </option>
								  <option value="사무실"     <c:if test="${searchVO.searchExt4 eq '사무실'}"     >selected</c:if>>사무실     </option>
								  <option value="공용"      <c:if test="${searchVO.searchExt4 eq '공용'}"       >selected</c:if>>공용      </option>
								</select>						
							</div>						
							<div class="col-md-3">
								<label style="color:blue">기준 (공실/전체)</label> 
								<select class="form-control form-control-sm" id="searchExt3" name="searchExt3" style="font-size:13px;min-width:10px;" required>
								  <option value="공실"    <c:if test="${searchVO.searchExt3 eq '공실'}">selected</c:if>>공실만 대상</option>
								  <option value="전체"   <c:if test="${searchVO.searchExt3 eq '전체'}">selected</c:if>>전체대상</option>
								</select>
							</div>			            
							<div class="col-md-3">
								<label style="color:blue">삭제정보 (미포함/포함)</label> 
								<select class="form-control form-control-sm" id="searchExt5" name="searchExt5" style="font-size:13px;min-width:10px;" required>
								  <option value="미포함"    <c:if test="${searchVO.searchExt5 eq '미포함'}">selected</c:if>>미포함</option>
								  <option value="포함"   <c:if test="${searchVO.searchExt5 eq '포함'}">selected</c:if>>포함</option>
								  <option value="삭제창고만"   <c:if test="${searchVO.searchExt5 eq '삭제창고만'}">selected</c:if>>삭제창고만</option>
								</select>
							</div>			            
						</div>			            
			            
						<div class="row">
							<div class="col-md-12 d-flex justify-content-center mt-5">
				                <button class="btn btn-sm btn-primary" type="button"  onclick="fn_formSubmit()"><span id="str_button"><strong>검색하기</strong></span></button>
							</div>
			            </div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<span>
							${fn:length(listview)} : 개층
						</span>
					</div>
	     	   </div>					            								
			</div>
		</div>
     </form>
		<c:if test="${fn:length(listview) > 0}">
		<div class="row">
			<div class="col-md-12 d-flex justify-content-center mt-3">
				<button class="btn btn-sm btn-warning" type="button"  onclick="fn_viewmap()">지도보기</button>
					&nbsp;&nbsp;
				<button class="btn btn-sm btn-warning" type="button"  onclick="fn_hidemap()">지도닫기</button>
			</div>
		</div>
		<div class="row" >
			<div class="col-md-12">
	 		 	<div class="card-body">
					<div id="map" style="width:100%;height:500px;display:none"></div>		
				</div>
			</div>
 	   </div>      
	  </c:if>		
	  
	<c:set var="whcode_temp" value="" />
	<c:set var="sum_flarea" value="0" />			
	<c:forEach var="warelist" items="${listview}" varStatus="status">
		<c:if test="${whcode_temp ne warelist.whcode}">
			<div class="row mt-5 mb-1">
			<div class="col-md-12">
				<table id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
					<tbody>
						<tr style="background-color:#FAFAFA;font-weight:bold;font-size:16px;">
							<td>
								창고번호 : ${warelist.whcode}
							</td>
							<td colspan="2">
								<a href="javascript:fn_getModalinfo('${warelist.brcode}');">${warelist.brcode}</a>
							</td>
							<td>
								<a href="detail?whcode=<c:out value="${warelist.whcode}"/>">상세보기</a>
							</td>
						</tr>
						<tr>
							<td style="width: 138px; align: center" rowspan="5"> 
					            <a href="${warelist.img001}" data-toggle="lightbox" class="col-bg-3" data-title="<label>창고번호 : ${warelist.whcode}</label>" data-footer="<label>${warelist.mpadrs}</label>">
					                <img src="${warelist.img001}" height="220" width="300">
					            </a>							
							</td>
							<td style="width: 70px; text-align: center;background-color:#FAFAFA; font-size:14px;text-align:center;font-weight:bold">창고명</td>
							<td style="width: 280px; text-align: center;font-size:14px;">${warelist.whname}</td>
							<td style="width: 400px; text-align: left;font-size:14px;" rowspan="5">
							상세 정보
							<br><br>
							인근IC : ${warelist.mpicif}
							</td>
						</tr>
						<tr>
							<td style="width: 70px; text-align: center;background-color:#FAFAFA; font-size:14px;text-align:center;font-weight:bold">위치</td>
							<td style="width: 280px; text-align: center;font-size:14px;">${warelist.mpadrs}</td>
						</tr>
						<tr>
							<td style="width: 70px; text-align: center;background-color:#FAFAFA; font-size:14px;text-align:center;font-weight:bold">연면적</td>
							<td id="szarea" style="width: 280px; text-align: center;font-size:14px;"><fmt:formatNumber value="${warelist.szarea}" pattern="#,###" />&nbsp;평</td>
						</tr>
						<tr>
							<td style="width: 70px; text-align: center;background-color:#FAFAFA; font-size:14px;text-align:center;font-weight:bold">규모</td>
							<td style="width: 280px; text-align: center;font-size:14px;">${warelist.ifsize}</td>
						</tr>
						<tr>
							<td style="width: 70px; text-align: center;background-color:#FAFAFA; font-size:14px;text-align:center;font-weight:bold">준공일</td>
							<td style="width: 280px; text-align: center;font-size:14px;">${warelist.prusdy}</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>				
		</c:if>			
			<div class="row">
			<div class="col-md-12">
			<c:if test="${whcode_temp ne warelist.whcode}">
			<table id="tables" class="table table-hover table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr style="background-color:#FAFAFA; font-size:14px;text-align:center;font-weight:bold">
					<td style="width:10%;">층</td>
					<td style="width:10%;">주용도</td>
					<td style="width:10%;">온도</td>
					<td style="width:10%;">임대면적(평)</td>
					<td style="width:10%;color:blue">공실면적(평)</td>
					<td style="width:10%;">임대료(월/평)</td>
					<td style="width:20%;">입주시기</td>
					<td style="width:10%;">도면</td>
					<td style="width:10%;">상태</td>
<!-- <th>즐겨찾기</th> -->
				</tr>
			</c:if>				
				<c:set var="sum_flarea" value="${sum_flarea + warelist.flarea}" />			
				<tr style="font-size:14px;text-align:center">
					<td>
						${warelist.whflnm}
					</td>
					<td>
						${warelist.whfuse}
					</td>
					<td>
						${warelist.whtemp}
					</td>
					<td style="text-align:right">
						<fmt:formatNumber value="${warelist.flarea}" pattern="#,###" />
						<!-- <fmt:formatNumber value="${Math.round(warelist.flarea *  0.3025)}" pattern="#,###" />평 -->
					</td>
					<td style="text-align:right">
						<fmt:formatNumber value="${warelist.flsesz}" pattern="#,###" />
						<!-- <fmt:formatNumber value="${Math.round(warelist.flarea *  0.3025)}" pattern="#,###" />평 -->
					</td>
					<td style="text-align:right">
						<fmt:formatNumber value="${warelist.pprice}" pattern="#,###" />
					</td>
					<td>
						${warelist.lsfnow}
						<c:if test="${(warelist.lsfrom ne '') and (warelist.lsfrom ne ' ') and (warelist.lsfrom ne null)}">	
						 ( ${warelist.lsfrom} ) ~
						 </c:if>
					</td>	
					<td>
						<c:if test="${(warelist.cadf01 ne '') and (warelist.cadf01 ne ' ') and (warelist.cadf01 ne null)}">
				            <a href="${warelist.cadf01}" data-toggle="lightbox" class="col-bg-3" data-title="<label>도면</label>" data-footer="<label></label>">
								<img alt="도면" src="${warelist.cadf01}" height="20" width="20" />
				            </a>							
						 </c:if>
					</td>
					<td>
						${warelist.status}
					</td>
	<!--				
					<td>
						<i>grade</i>
					</td>
	-->				
				</tr>			
				<c:set var="whcode_temp" value="${warelist.whcode}" />	
				<c:set var="whcode_next" value="${listview[status.index + 1].whcode}"/> 	
			<c:if test="${whcode_temp ne whcode_next}">				
				<tr style="background:#FAFAFA;text-align:right;font-style:italic;color:blue">
					<td colspan=3 style="text-align:center">SUM</td>
					<td><fmt:formatNumber value="${sum_flarea}" pattern="#,###" /></td>				
					<td colspan=4 style="text-align:center"></td>
				</tr>				
				<c:set var="sum_flarea" value="0" />			
			</table>
			</c:if>
			</div>
		</div>
		</c:forEach>			
	
	</div>
	<!-- end floor items -->              
	</div>        
</div>

    <!--End items-->
   <br><br>
   

 <!-- modal 화면 start -->
    <div id="myModal" style="display: none;text-align:center;" class="modal fade bs-example-modal-xl" role="dialog" tabindex="-1" aria-labelledby="myLargeModalLabel">
    	<div class="modal-dialog modal-xl" role="document" style="background-color: white;"> 
			<div class="container">
				<h6  class="mt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>건축물관리 대장</strong></h6>
				  <div class="row">
				        <div class="col-md-12">
				        관리번호 : <p id="modal_mgbdrgpk"></p>
				        </div>
				  </div>
				  <div class="row mt-2">
				        <div class="col-md-12" style="text-align:left;"><h6>기본정보</h6></div>
				  </div>
				  <div class="row">
				        <div class="col-md-12">
							<table  class="table table-bordered  table-sm" style="font-size:15px;width:100%">
								<tbody>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">대지위치</td>
										<td colspan="3" style="width: 70px; text-align: center;font-size:5px"><h1 id="modal_ldxy" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">지번</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_nadbob" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">대지면적</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_ldar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">연면적</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_grossar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">명칭 및 번호</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_dongnm" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">건축면적</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_star" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">용적율 산정용 연면적</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_cprtesgrossar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">건축물수</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_bdcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">건폐율</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_bdrt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">용적율</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_cprt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">총호수</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_hosu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">주용도</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_mauscdnm" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">주구조</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_etstruct" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">부속건축물</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_maextdvcd" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">허가일자</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_apday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">착공일자</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_strstday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">사용승인일자</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_permday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
								</tbody>
							</table>			        
				        </div>
				  </div>
				  <div class="row mt-2">
				        <div class="col-md-12" style="text-align:left;"><h6>용도</h6></div>
				  </div>
				  <div class="row">
				        <div class="col-md-12">
							<table class="table-bordered" style="font-size:15px;width:100%">
								<tbody>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">용도지역</td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">용도지구</td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">구역</td>
									</tr>
									<tr>
										<td style="width: 70px; text-align: center;">용도지역 값X</td>
										<td style="width: 70px; text-align: center;">용도지구 값X</td>
										<td style="width: 70px; text-align: center;">구역 값X</td>
									</tr>
								</tbody>
							</table>			        
				        </div>
				  </div>
				  <div class="row mt-2">
				        <div class="col-md-12" style="text-align:left;"><h6>주차장</h6></div>
				  </div>
				  <div class="row">
				        <div class="col-md-12">
							<table class="table-bordered" style="font-size:15px;width:100%">
								<tbody>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">옥내기계식</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_inmsnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">옥내자주식</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_insfnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">옥외기계식</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_otmsnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center; background: #FAFAFA;">옥외자주식</td>
										<td style="width: 70px; text-align: center;"><h1 id="modal_otsfnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
								</tbody>
							</table>
				        </div>
				  </div>
				  <div class="row">
				        <div class="col-md-12" style="text-align:left;"><h6>승강기</h6></div>
				  </div>
				  <div class="row">
				        <div class="col-md-12">
							<table class="table-bordered" style="font-size:15px;width:100%">
								<tbody>
									<tr>
										<td style="width: 70px; text-align: center; background: #FAFAFA;font-size:15px;">승용</td>
										<td style="width: 70px; text-align: center;font-size:15px;"><h1 id="modal_elevcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
										<td style="width: 70px; text-align: center;font-size:15px; background: #FAFAFA;">비상용</td>
										<td style="width: 70px; text-align: center;font-size:15px;"><h1 id="modal_liftcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
									</tr>
								</tbody>
							</table>
				        </div>
				  </div>
				  <div class="row mt-5 mb-3">
				        <div class="col-md-12">
				        	<button type="button" class="btn btn-primary" onclick="fn_hideModal()">닫기</button>
				        </div>
				  </div>
			</div>
			<br>
		</div>			
    </div>
<!-- modal 화면 end -->

   
<jsp:include page="inc_footer.jsp" flush="true"/>
<script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox();
	});
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5c29ce6ec33bdda502a87f1006e5f87&libraries=services"></script>
<script>
		var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
		MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
		OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
		OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
		OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
		OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
		OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
		OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
		SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
		SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
		SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
		SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var positions = [];
		<c:forEach var="listview" items="${listview}" varStatus="status">
			positions.push(
			    {
			        content: '<div style="width:200px; height:100px;"><center><br>${listview.whname}<br><a href="detail?whcode=${listview.whcode}">상세보기</a><br></center></div>', 
			        latlng: new kakao.maps.LatLng(<c:out value="${listview.kkompx}"/>, <c:out value="${listview.kkompy}"/>)
			    });
		</c:forEach>		
		
		selectedInfowindow = null;
		
		var bounds = new kakao.maps.LatLngBounds();   
		for (var i = 0; i < positions.length; i ++) {
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });    
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		    bounds.extend(positions[i].latlng);    
		    kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
		}
		
		function makeClickListener(map, marker, infowindow) {
		    return function() {
		    	if (!selectedInfowindow) {
		            infowindow.open(map, marker);  
		    	} else {
		    		selectedInfowindow.close();
		    		infowindow.open(map, marker);  
		    	}
		        selectedInfowindow = infowindow
		    	
		    };
		}
		
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		function setBounds() {
		  map.setBounds(bounds);
		  var level = map.getLevel();
		  if(level < 7){
			  map.setLevel(7);
		  }
		}
		setBounds(bounds);
</script>
</body>
</html>