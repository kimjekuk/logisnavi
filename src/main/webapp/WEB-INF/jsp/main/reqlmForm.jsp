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
		$(document).ready(function(){
				
			  $("input:radio[name=rqifcd]").click(function(){
// 			    if($("input[name=rqifcd]:checked").val() == "direct"){
// 		    	   $('#div_direct').show();	
// 		    	   $('#div_cowork1').hide();	
// 		    	   $('#div_cowork2').hide();	
// 		    	   $('#div_cowork3').hide();	
// 		    	   $('#div_cowork4').hide();	
// 			    }else{
// 		    	   $('#div_cowork1').show();	
// 		    	   $('#div_cowork2').show();	
// 		    	   $('#div_cowork3').show();	
// 		    	   $('#div_cowork4').show();	
// 		    	   $('#div_direct').hide();	
// 			    }
			  });
	
			  $('#lmppse').on('change',function(){
				if($(this).val() == 'etc'){	
			       $('#lmppse_etc').show();	
				}else{
			       $('#lmppse_etc').hide();	
				};
			  });
			  
			 //????????????
			 if("${reqlmInfo.reqseq}" != ''){
				 //????????????
				 $("#str_button").html("????????????");
				 
				 //direct, cowork div??????
				 if("${reqlmInfo.rqifcd}" != 'direct'){
 					   $('input:radio[name=rqifcd]:input[value=' + "${reqlmInfo.rqifcd}" + ']').attr("checked", true);
					 
// 			    	   $('#div_cowork1').show();	
// 			    	   $('#div_cowork2').show();	
// 			    	   $('#div_cowork3').show();	
// 			    	   $('#div_cowork4').show();	
// 			    	   $('#div_direct').hide();					 
				 }
				 
				 //??????????????????
				 if("${reqlmInfo.lmtemp}" != ''){
					 var strLmtemp = "${reqlmInfo.lmtemp}"; 
					 const arr = strLmtemp.split(",");
					 $('input:checkbox[name="lmtemp"]').each(function() {
						 if(arr.includes(this.value)){
					            this.checked = true; //checked ??????
						 }
					 });
				 }
	
				 //????????????(??????)
				 if("${reqlmInfo.lminow}" != ''){
					 $('input:checkbox[name="lminow"]').attr("checked", true);
				 }
				 
				 //??????????????????(?????????)
				 if("${reqlmInfo.larea0}" != ''){
					 $('input:radio[name=larea0]:input[value=' + "${reqlmInfo.larea0}" + ']').attr("checked", true);
				 }
				 
			 }else{
			 //????????????
				 $("#str_button").html("????????????");
			 }
		});	
	</script>
    <style>
    	div {  border: solid red 0px; } 
    	span { font-size:15px;text-decoration:none;}
    	label {font-size:12px;font-weight:none;color:#696969}
    </style>
  </head>
  <body>
 <jsp:include page="inc_header.jsp" flush="true"/>
 

<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>??????????????????</strong></h5>
	<form role="form" id="form1" name="form1"  method="post" action="reqlmSave">
  	<div class="row">
        <div class="col-md-12">
		</div>
	</div>
  	<div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
        
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr style="background-color:#FAFAFA; font-size:13px;text-align:left;">
					<td style="padding-left:15px">??????????????????</td>
				</tr>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-2 ">
							    <label>????????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmppse"   name="lmppse" value="${reqlmInfo.lmppse}" required>
							</div>
							<div class="col-md-2 ">
								<label>????????????</label> 
								<select class="custom-select" id="lmtemp" name="lmtemp" style="font-size:13px;min-width:20px;" required>
								  <option value=""    <c:if test="${reqlmInfo.lmtemp eq ''}">selected</c:if>></option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp eq '??????'}">selected</c:if>>??????</option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp eq '??????'}">selected</c:if>>??????</option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp eq '??????'}">selected</c:if>>??????</option>
								</select>
								<select class="custom-select" id="lmtemp2" name="lmtemp2" style="font-size:13px;min-width:20px;" >
								  <option value=""    <c:if test="${reqlmInfo.lmtemp2 eq ''}">selected</c:if>></option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp2 eq '??????'}">selected</c:if>>??????</option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp2 eq '??????'}">selected</c:if>>??????</option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp2 eq '??????'}">selected</c:if>>??????</option>
								</select>
								<select class="custom-select" id="lmtemp3" name="lmtemp3" style="font-size:13px;min-width:20px;" >
								  <option value=""    <c:if test="${reqlmInfo.lmtemp3 eq ''}">selected</c:if>></option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp3 eq '??????'}">selected</c:if>>??????</option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp3 eq '??????'}">selected</c:if>>??????</option>
								  <option value="??????" <c:if test="${reqlmInfo.lmtemp3 eq '??????'}">selected</c:if>>??????</option>
								</select>
<!--  
						            <div class="custom-control custom-checkbox">
						              <input type="checkbox" class="custom-control-inline"  value="??????" name="lmtemp" >
									  <label>??????</label> 
						            </div>
						            <div class="custom-control custom-checkbox">
						              <input type="checkbox" class="custom-control-inline"  value="??????" name="lmtemp2" >
									  <label>??????</label> 
						            </div>
						            <div class="custom-control custom-checkbox">
						              <input type="checkbox" class="custom-control-inline"  value="??????" name="lmtemp3" >
									  <label>??????</label> 
						            </div>
-->						            
							</div>
							<div class="col-md-2 ">
							    <label>????????????</label> 
								<input type="number" class="form-control form-control-sm" id="lmsize" name="lmsize" min="1" max="9999999" value="${reqlmInfo.lmsize}" required>
								<input type="number" class="form-control form-control-sm" id="lmsize2" name="lmsize2" min="1" max="9999999" value="${reqlmInfo.lmsize2}" >
								<input type="number" class="form-control form-control-sm" id="lmsize3" name="lmsize3" min="1" max="9999999" value="${reqlmInfo.lmsize3}" >
							</div>
							<div class="col-md-3 ">
							    <label>????????????</label> 
						            <div class="custom-control custom-checkbox">
						              <input type="checkbox" class="custom-control-inline"  value="??????" name="lminow" >
									  <label>??????</label> 
						            </div>
								<input type="date" class="form-control form-control-sm" id="lmfrom"  name="lmfrom"  value="${reqlmInfo.lmfrom}" required>
							</div>
							<div class="col-md-2 ">
							    <label>????????????(??????)</label> 
								<input type="number" class="form-control form-control-sm" id="lmterm"  name="lmterm"  min="1" max="9999999"  value="${reqlmInfo.lmterm}" required>
							</div>
			            </div>
			            <hr>
						<div class="row">
							<div class="col-md-2 ">
							    <label>????????????</label> 
				              <div class="custom-control custom-radio">
				                <input id="larea0" name="larea0" type="radio" class="custom-control-inline"  value="??????" checked required>
							    <label>??????</label> 
				              </div>
				              <div class="custom-control custom-radio">
				                <input id="larea0" name="larea0" type="radio" class="custom-control-inline"  value="?????????" required>
							    <label>?????????</label> 
				              </div>
				              <div class="custom-control custom-radio">
				                <input id="larea0" name="larea0" type="radio" class="custom-control-inline"  value="????????????" required>
							    <label>????????????</label> 
				              </div>
							</div>
							<div class="col-md-2 ">
							    <label>????????????1</label> 
								<input type="text" class="form-control form-control-sm" id="larea1"  name="larea1"  value="${reqlmInfo.larea1}" required>
							</div>
							<div class="col-md-2 ">
							    <label>????????????2</label> 
								<input type="text" class="form-control form-control-sm" id="larea2"  name="larea2"  value="${reqlmInfo.larea2}" required>
							</div>
							<div class="col-md-2 ">
							    <label>????????????3</label> 
								<input type="text" class="form-control form-control-sm" id="larea3"  name="larea3"  value="${reqlmInfo.larea3}" required>
							</div>
							<div class="col-md-1 "></div>
			            </div>				            
			            
					</td>
				</tr>
			</table>
			        
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr style="background-color:#FAFAFA; font-size:13px;text-align:left;">
					<td style="padding-left:15px">???????????????</td>
				</tr>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-2 ">
							<label>????????????</label> 
				              <div class="custom-control custom-radio">
				                <input id="rqifcd" name="rqifcd" type="radio" class="custom-control-inline"  value="direct" checked required>
							    <label>????????????</label> 
				              </div>
				              <div class="custom-control custom-radio">
				                <input id="rqifcd" name="rqifcd" type="radio" class="custom-control-inline"  value="cowork"required>
							    <label>????????????</label> 
				              </div>
				              <div class="custom-control custom-radio">
				                <input id="rqifcd" name="rqifcd" type="radio" class="custom-control-inline"  value="customer"required>
							    <label>????????????</label> 
				              </div>
							</div>
							<div class="col-md-2 ">
<!--  							
			             	   <div id = "div_direct">
								    <label>???????????????</label> 
									<input type="text" class="form-control form-control-sm" id="rqiusr" name="rqiusr" value="${reqlmInfo.rqiusr}" >
								</div>
-->								
			          	       <div id = "div_cowork1" style="display:show">
								    <label>?????????</label> 
									<input type="text" class="form-control form-control-sm" id="rqicop" name="rqicop" value="${reqlmInfo.rqicop}" >
								    <label>?????????</label> 
									<input type="text" class="form-control form-control-sm" id="rqimai" name="rqimai"  value="${reqlmInfo.rqimai}">
								</div>
								
							</div>
							<div class="col-md-2 ">
			          	       <div id = "div_cowork2" style="display:show">
								    <label>?????????</label> 
									<input type="text" class="form-control form-control-sm" id="rqiman" name="rqiman" value="${reqlmInfo.rqiman}" >
								    <label>????????????</label> 
									<input type="tel" class="form-control form-control-sm"  id="rqitel" name="rqitel"  value="${reqlmInfo.rqitel}" >
			                   </div>
							</div>
							<div class="col-md-3 ">
			          	       <div id = "div_cowork3" style="display:show">
								    <label>??????</label> 
									   <img id="rqbzcr_view" name="rqbzcr_view" 
										<c:choose>
											<c:when test="${empty reqlmInfo.rqbzcr}" >
												src="images/noimg_w200h150.gif"  
											</c:when> 
											<c:otherwise>
												src="${reqlmInfo.rqbzcr}"  
											</c:otherwise>
										</c:choose>							
									   width="200px" height="150px" border="1px solid grey">
								</div>
							</div>
							<div class="col-md-2 ">
			          	       <div id = "div_cowork4" style="display:show">
								    <input type="file" class="custom-file-input" id="file001" name="file001"  accept='image/*' >
								    <label class="custom-file-label" for="file001"></label>
								    <br><br>
								    <div>
										<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg01('file001')"> ?????????????????? </button>
					  	  	            <input type="hidden" id="rqbzcr" name="rqbzcr"  size="20"  value="${reqlmInfo.rqbzcr}" >
								    </div>
							    </div>
							 </div>	
			            </div>	
					</td>
				</tr>
			</table>
			



			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr style="background-color:#FAFAFA; font-size:13px;text-align:left;">
					<td style="padding-left:15px">??????????????????</td>
				</tr>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-2 ">
							    <label>?????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmcopr" name="lmcopr"  value="${reqlmInfo.lmcopr}" required>
							</div>
							<div class="col-md-2 ">
							    <label>??????</label> 
								<input type="text" class="form-control form-control-sm" id="lmsect" name="lmsect"  value="${reqlmInfo.lmsect}" required>
							</div>
							<div class="col-md-2 ">
							    <label>????????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmitem" name="lmitem"  value="${reqlmInfo.lmitem}" required>
							</div>
							<div class="col-md-2 ">
							    <label>?????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmcapi" name="lmcapi"  value="${reqlmInfo.lmcapi}" required>
							</div>
			            </div>
						<div class="row">
							<div class="col-md-2 ">
							    <label>????????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmcont" name="lmcont"  value="${reqlmInfo.lmcont}" required>
							</div>
							<div class="col-md-2 ">
							    <label>??????</label> 
								<input type="text" class="form-control form-control-sm" id="lmsitr" name="lmsitr"  value="${reqlmInfo.lmsitr}" required>
							</div>
							<div class="col-md-2 ">
							    <label>?????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmtelp" name="lmtelp"  value="${reqlmInfo.lmtelp}" required>
							</div>
							<div class="col-md-2 ">
							    <label>?????????</label> 
								<input type="text" class="form-control form-control-sm" id="lmemal" name="lmemal"  value="${reqlmInfo.lmemal}" required>
							</div>
			             </div>
						<!-- ?????? ?????? -->		  	          	       		
						<hr>
						<div class="row">
							<div class="col-md-2 ">
							    <label>??????</label> 
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
							<div class="col-md-1 ">
							</div>
							<div class="col-md-2">
							    <input type="file" class="custom-file-input" id="file002" name="file002"  accept='image/*' >
							    <label class="custom-file-label" for="file002"></label>
							    <br><br>
							    <div>
									<button type="button" class="btn btn-secondary btn-sm" onclick="fn_upFileImg02('file002')"> ?????????????????? </button>
				  	  	            <input type="hidden" id="lmbzcr" name="lmbzcr"  size="20"  value="${reqlmInfo.lmbzcr}" >
							    </div>
							</div>
			             </div>					
					</td>
				</tr>
			</table>
			
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr style="background-color:#FAFAFA; font-size:13px;text-align:left;">
					<td style="padding-left:15px">??????</td>
				</tr>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-12">
							<textarea class="form-control" id="stretc" name="stretc" rows="5" >${reqlmInfo.stretc}</textarea>
							</div>
			            </div>	
					</td>
				</tr>
			</table>
			
			<table  id="tables" class="table table-bordered  table-sm" style="cellspacing:0;width:100%;text-align:center;" >
				<tr style="background-color:#FAFAFA; font-size:13px;text-align:left;">
					<td style="padding-left:15px">??????????????????</td>
				</tr>
				<tr>
					<td>
						<div class="row">
							<div class="col-md-3">
								<label>?????????</label> 
								<input type="text" class="form-control form-control-sm" id="requsr" name="requsr" value="${reqlmInfo.requsr}" required>
							</div>
							<div class="col-md-3">
								<label for="requsr">?????????</label> 
								<input type="date" class="form-control form-control-sm" id="reqday" name="reqday" min="2021-12-01" max="2030-12-31"  value="${reqlmInfo.reqday}" required>
							</div>
							<div class="col-md-3">
								<label for="requsr">????????????</label> 
								<input type="time" class="form-control form-control-sm" id="reqtim" name="reqtim"    value="${reqlmInfo.reqtim}" required>
							</div>
							<div class="col-md-1"></div>
			            </div>	
					</td>
				</tr>
			</table>
						
		</div>		
	</div>
	<div class="row">
		<div class="col-md-4 "></div>
		<div class="col-md-2  mt-3 mb-5">
               <select class="custom-select d-block w-100" id="rqstat" name="rqstat"  required>
				  <option value="??????"   <c:if test="${reqlmInfo.rqstat eq '??????'}">selected</c:if>>??????</option>
				  <option value="??????"   <c:if test="${reqlmInfo.rqstat eq '??????'}">selected</c:if>>?????????</option>
				  <option value="?????????"  <c:if test="${reqlmInfo.rqstat eq '?????????'}">selected</c:if>>?????????</option>
               </select>
		</div>
		<div class="col-md-2  mt-3 mb-5">
 	  	            <input type="hidden" id="reqseq" name="reqseq" value="${reqlmInfo.reqseq}"  > 
				<button class="btn btn-primary" type="submit"><span id="str_button">????????????</span></button>
		</div>
		<div class="col-md-4 mb-3"></div>
	</div>								
 	</form>
 </div>
 
 <jsp:include page="inc_footer.jsp" flush="true"/> 
 <script>
	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
	    event.preventDefault();
	    $(this).ekkoLightbox();
	});
</script>
 <script>
		function fn_upFileImg01(strfile){
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
				                $("#rqbzcr_view").attr("src", result.strImg001);
				                $("#rqbzcr").val(result.strImg001);
							},
					        error: function() {
					            alert('Error occured' + brcode);
					        }
					   	})
				}
		}
		
		function fn_upFileImg02(strfile){
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
			                $("#lmbzcr_view").attr("src", result.strImg002);
			                $("#lmbzcr").val(result.strImg002);
						},
				        error: function() {
				            alert('Error occured' + brcode);
				        }
				   	})
			}
		}	

</script>
</body>
</html>