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


	
	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
	
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>	
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
    
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
<%--     <script src="css/sb-admin/metisMenu.min.js"></script> --%>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script>
	
	function fn_formSubmit(){
		if ( ! chkInputValue("#searchKeyword", "명칭 또는 주소 일부분 ")) return false;

		if(Number($("#searchExt1").val()) >= Number($("#searchExt2").val())){
			alert("하한선 값을 더 크게 지정하세요");
			return false;
		}
		document.form1.submit();	
	}	
	
	//---------------------------------------------- toast grid -----------------------------------------------------//		
	var Grid;  
	
	window.onload = function(){
		json = JSON.parse($("#gridData").val());
		
		//표제부
		Grid = new tui.Grid({						
		        el: document.getElementById('grid'),
				data : json,		        
 		        pageOptions: {
		            perPage: 10,
		            useClient: true
		        }, 
		        scrollX: true,
		        scrollY: true,
		        rowHeaders:['rowNum'],
		        header:{
		        	height:40
		        },
		        columns: [
		          { header: '창고명', name: 'whname' },
		          { header: '주소', name: 'mpadrs' },
		          { header: '연면적', name: 'szarea' },			          
		          { header: '규모', name: 'ifsize' },			          
		          { header: '건축구조', name: 'ifstrt' },			          
		          { header: '접안방식', name: 'trcoty' },			          
		          { header: '허가일', name: 'prprdy' },
		          { header: '착공일', name: 'prstdy' },
		          { header: '사용승인일', name: 'prusdy' },
		          { header: '조감도', name: 'img001' }
 		          ,
		          {
		              title: 'Warehouse Image',
		              name: 'img001',
		              align: 'center',
		              formatter: function(value) {
//		            	  alert(value);
//		                  var albumId = value.toString();
		                  var url = "";
		                  return '<img src="' + url + '" width="10" height="10" />';
		              }
		          }
		        ],
		        columnOptions : {
		        	resizable:true
		        }
		    });	  
		
			  		
	}	
	

    
    function xlsdown(){
   	   console.log('xlsdown() clicked');
//    	Grid.export('xlsx', json);
    }

	</script>		
	<style>
	    .tui-grid-cell.big-font {
	        font-size: 30pt;
	    }	
	</style>

</head>

<body>
<jsp:include page="inc_header.jsp" flush="true"/>
    <!-- Start Contact -->
    <div class="container py-5"  style="border:1px red;">
            <form class="col-md-9 m-auto" role="form" id="form1" name="form1"  method="post">
                <div class="row">
                <div class="form-group col-md-5 mb-3">
<!--                <label for="inputSearch3">명칭 및 위치</label> -->
                    <input type="text" class="form-control mt-2" id="searchKeyword" name="searchKeyword" placeholder="명칭 또는 주소 일부분"  
                    	value='<c:out value="${searchVO.searchKeyword}"/>' >
                </div>
                    <div class="form-group col-md-3 mb-3">
<!--                    <label for="inputSearch2">From</label> -->
	                    <select class="form-control mt-2" id="searchExt1" name="searchExt1" value='<c:out value="${searchVO.searchExt1}"/>'>
		                    <option value="0"    <c:if test="${searchVO.searchExt1 eq '0'}">selected</c:if>> 하한선 없음 </option>
		                    <option value="330.58"  <c:if test="${searchVO.searchExt1 eq '330.58'}">selected</c:if>>  100평 </option>
		                    <option value="991.74"  <c:if test="${searchVO.searchExt1 eq '991.74'}">selected</c:if>> 300평 </option>
		                    <option value="1652.89"  <c:if test="${searchVO.searchExt1 eq '1652.89'}">selected</c:if>> 500평 </option>
		                    <option value="3305.79" <c:if test="${searchVO.searchExt1 eq '3305.79'}">selected</c:if>> 1000평 </option>
		                    <option value="9917.36" <c:if test="${searchVO.searchExt1 eq '9917.36'}">selected</c:if>> 3000평 </option>
	                    </select>
<!--                    <label for="inputSearch3">To</label> -->
	                    <select class="form-control mt-2" id="searchExt2" name="searchExt2" value='<c:out value="${searchVO.searchExt2}"/>'>
		                    <option value="9999999"<c:if test="${searchVO.searchExt2 eq '9999999'}">selected</c:if>>  상한선 없음 </option>
		                    <option value="330.58"  <c:if test="${searchVO.searchExt2 eq '330.58'}">selected</c:if>>  100평 </option>
		                    <option value="991.74"  <c:if test="${searchVO.searchExt2 eq '991.74'}">selected</c:if>> 300평 </option>
		                    <option value="1652.89"  <c:if test="${searchVO.searchExt2 eq '1652.89'}">selected</c:if>> 500평 </option>
		                    <option value="3305.79" <c:if test="${searchVO.searchExt2 eq '3305.79'}">selected</c:if>> 1000평 </option>
		                    <option value="9917.36" <c:if test="${searchVO.searchExt2 eq '9917.36'}">selected</c:if>> 3000평 </option>
	                    </select>
                    </div>
                    <div class="col text-end mt-2">
                        <button type="button" class="btn btn-success btn-lg px-3" onclick="fn_formSubmit()">창고 찾기</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;${fn:length(listview)} : 개층
                    </div>
                </div>
	<input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
            </form>
    </div> 
   <button type="button" class="btn btn-success btn-lg px-3" onclick="xlsdown()">엑셀다운로드</button>
   	
   	<br>
    <input type='button' id='editBtn'>
      <div id="grid" class="ex2"></div>
      <div id="fl" ></div>
</body>
</html>