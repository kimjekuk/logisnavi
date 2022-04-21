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
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script>
	
//	$('input:radio[name=radioValue]:input[value="Y"]').attr("checked", true);
		
		//---------------------------------------------- toast grid -----------------------------------------------------//		
		var Grid;  
		var ModalGrid;  
		
		window.onload = function(){
			json = JSON.parse($("#gridData").val());
			$('#gridTotalCount').text(json.length);
			
			//표제부
			Grid = new tui.Grid({						
			        el: document.getElementById('grid'),
	 		        pageOptions: {
			            perPage: 5000,
			            useClient: true
			        }, 
			        scrollX: true,
			        scrollY: true,
			        useClientSort : true,
			        showDummyRows : true,
			        rowHeaders:['rowNum'],		   
			        columns: [
				          { header : '관리허가대장번호', name: 'mgmPmsrgstPk',align:'center'  , width : 180},
				          { header : '건물명', name: 'bldNm',align:'left'  , width : 180},
				          { header : '구조코드명', name: 'strctCdNm',align:'left'  , width : 180},
				          { header : '주용도코드명', name: 'mainPurpsCdNm',align:'center'  , width : 100},
				          { header : '층구분코드명', name: 'flrGbCdNm',align:'center'  , width : 100},
				          { header : '층번호', name: 'flrNo',align:'center'  , width : 80},
				          { header : '층면적', name: 'flrArea',align:'right'  , width : 100},
				          { header : '생성일자', name: 'crtnDay',align:'left'  , width : 80},
			        ],
			        columnOptions : {
			        	resizable:true
			        }
			        , data : json		        		        
			    });

			
//		Grid.setData(json);		  		
		}			
		
			
//			alert(arrpkdata[gridrows[0]].toString());
//			const arr = Grid.getCheckedRowKeys()[1];
//			const arr = Grid.getColumnValues('mgmPmsrgstPk');
//			alert(arr.length);
//			alert(Grid.getColumnValues('mgmPmsrgstPk'));
//					getFormattedValue(rowKey, columnName)
//			alert(Grid.getRowSpanData(0, 'mgmPmsrgstPk'));
//			alert(Grid.getFormattedValue(0, 'mgmPmsrgstPk'));

        
    </script>
</head>

<body>
 <br>
 <hr>
 *********** [층별정보]건축인허가 정보(창고시설) *********** 
 <hr>
 <br>
 <input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
    검색결과 : <text type="label" id="gridTotalCount" name="gridTotalCount"></text> 건
 <div id="grid"></div>
</body>
</html>
</html>