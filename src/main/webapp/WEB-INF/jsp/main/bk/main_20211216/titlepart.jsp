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
    <link rel="shortcut icon" type="image/x-icon" href="css/assets/img/favicon.ico">
    
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
			$('#myModal').modal("hide");
		}
		
		function fn_showModal(idx) {
			$('#myModal').modal("show");
		}
		
		function fn_hideModal() {
			$('#myModal').modal("hide");
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
					$("#select_sigungu").append("<option value='' selected>????????? ??????</option>");
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
						$("#select_dong").append("<option value='' selected>??? ??????</option>");
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
			
			
			function fn_getModalinfo(mgbdrgpk){
				$.ajax({
					url: "detailTitle",
					type:"post", 
					data : {mgbdrgpk: mgbdrgpk},
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
			            alert('Error occured' + mgbdrgpk);
			        }
			   	})
				$('#myModal').modal("show");
			}			
		//---------------------------------------------------------------------------------------------//
		
	</script>

</head>

<body onload="fn_initSelectOpt();">
<jsp:include page="inc_header.jsp" flush="true"/>

    <!-- Start Contents -->
    <div>
    <br><br>
			 <div class="form-group col-md-15 mb-15" style="text-align:center;border:1px ">
			    <form role="form" id="form1" name="form1"  method="post">
			    <div class="column">
 			         <select id="select_sido"  onChange="fn_getSigungu(this.value);" >
						<option value="" >??? ?????? ????????? ??????    </option>
						<option value="11" >???????????????</option>
						<option value="26" >???????????????</option>
						<option value="27" >???????????????</option>
						<option value="28" >???????????????</option>
						<option value="29" >???????????????</option>
						<option value="30" >???????????????</option>
						<option value="31" >???????????????</option>
						<option value="36" >?????????????????????</option>
						<option value="41" >?????????</option>
						<option value="42" >?????????</option>
						<option value="43" >????????????</option>
						<option value="44" >????????????</option>
						<option value="45" >????????????</option>
						<option value="46" >????????????</option>
						<option value="47" >????????????</option>
						<option value="48" >????????????</option>
						<option value="50" >?????????????????????</option>
			         </select> &nbsp;&nbsp;
			         <select id="select_sigungu" onChange="fn_getDongcd(this.value);" >
			   	 	      <option value='' >????????? ??????</option>
			         </select> &nbsp;&nbsp;
			         <select id="select_dong" onChange="fn_setSearch(this.value, 3);">
			     	     <option value='' >??? ??????</option>
			         </select> &nbsp;&nbsp;
			         
			         <input type="hidden" id="searchKeyword" name="searchKeyword"> 
			         <input type="hidden" id="searchedName" name="searchedName"> 
			         
			       	 <button class="btn btn-outline btn-primary" onclick="fn_formSubmit(1);" >??????</button>
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
							??????????????? : ${searchVO.rowStart} , ????????? ??????: ${searchVO.rowEnd} , ?????? ????????? : ${searchVO.totPage} 
						     ,?????? ????????? ??? : , ${searchVO.totRow} , ?????? ????????? :  ${searchVO.page} , ??????????????? :  ${searchVO.pageStart}  
						     , ??????????????? : ${searchVO.pageEnd} 
						--%>
					</c:if>
				</div>
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
					<th>??????</th>
					<th>????????????</th>
					<th>????????????</th>
					<th>????????????</th>
					<th>???????????????</th>
					<th>????????? ??? ??????</th>
					<th>?????????</th>
					<th>?????????</th>
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
						<a href="javascript:fn_getModalinfo('${tplist.mgbdrgpk}');"><c:out value="${tplist.mgbdrgpk}"/></a>
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
		

 <!-- modal ?????? start -->
    <div id="myModal" style="display: none;text-align:center;" class="modal fade bs-example-modal-xl" role="dialog" tabindex="-1" aria-labelledby="myLargeModalLabel">
    	<div class="modal-dialog modal-xl" role="document" style="background-color: white;text-align:center;border: 1px solid green"> 
    		<br>
	        	[ ??????????????? ?????? ]
	        <p id="modal_mgbdrgpk"></p>
        	<center>
			<br>????????????<br>
			<table  width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td colspan="3" style="border: 1px solid grey;width: 70px; text-align: center;font-size:5px"><h1 id="modal_ldxy" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">??????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_nadbob" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_ldar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_grossar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????? ??? ??????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_dongnm" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_star" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????? ????????? ?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_cprtesgrossar" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_bdcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_bdrt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_cprt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_hosu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_mauscdnm" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_etstruct" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">???????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_maextdvcd" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_apday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_strstday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">??????????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_permday" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
				</tbody>
			</table>
			<br>??????<br>
			<table width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">??????</td>
					</tr>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center;">???????????? ???X</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;">???????????? ???X</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;">?????? ???X</td>
					</tr>
				</tbody>
			</table>
			<br>?????????<br>
			<table width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">???????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_inmsnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">???????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_insfnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">???????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_otmsnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;">???????????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;"><h1 id="modal_otsfnu" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
				</tbody>
			</table>
			<br>?????????<br>
			<table width=80% style="border: 1px solid grey;font-size:15px">
				<tbody>
					<tr>
						<td style="border: 1px solid grey;width: 70px; text-align: center; background: #FAFAFA;font-size:15px;">??????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;font-size:15px;"><h1 id="modal_elevcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;font-size:15px; background: #FAFAFA;">?????????</td>
						<td style="border: 1px solid grey;width: 70px; text-align: center;font-size:15px;"><h1 id="modal_liftcnt" style="margin:0px 0px 0px 0px;font-size:15px"/></td>
					</tr>
				</tbody>
			</table>
			<br>
			</center>
        	<center><button type="button" class="btn btn-primary" onclick="fn_hideModal()">??????</button></center>
			<br>
		</div>			
    </div>
<!-- modal ?????? end -->

</div>
<!-- end TitlePart List -->       

   <br><br>
<jsp:include page="inc_footer.jsp" flush="true"/>
</body>
</html>