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
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    
	<script>
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
			        header : {
			        	height : 80,
			        	complexColumns : [
       			 		{
       			 			header : '실임차인정보',
       			 			name : 'mergeColumn3',
       			 			childNames : [
       			 				    'lmcopr','lmsect','lmitem','lmcont','lmsitr','lmtelp','lmemal','lmcapi','lmbzcr'
       			 			]
       			 		},       			 		
       			 		{
       			 			header : '임차희망조건',
       			 			name : 'mergeColumn4',
       			 			childNames : [
       			 				    'lmppse','lmtemp','lmsize','larea0','larea1','larea2','larea3'
       			 				,'lminow','lmfrom','lmterm'
       			 			]       			 			
       			 		},
       			 		{
       			 			header : '접수정보',
       			 			name : 'mergeColumn1',
       			 			childNames : [
       			 				    'requsr', 'reqcod', 'reqday','reqtim'
       			 			]
       			 		},
       			 		{
       			 			header : '정보제공처',
       			 			name : 'mergeColumn2',
       			 			childNames : [
       			 				    'rqifcd','rqiusr','rqicop','rqiman','rqitel','rqbzcr'
       			 			]
       			 		}       			 		
			        	]
			        },	
			        rowHeaders:['rowNum', 'checkbox'],		   
			        columns: [
			            { header : '접수번호', name: 'reqseq' ,
			              formatter: function({value}) {
							//         var url = 'javascript:test(' + '\''+ value.toString() + '\'' + ')';
			                var url = 'reqlmForm?reqseq=' + value.toString() ;
			                return '<a href="' + url + '" >'+value.toString()+'</a>';
  			            } ,align:'center', width : 80},
			            { header : '기업명', name : 'lmcopr', align : 'center' , width : 120 } ,
			            { header : '업종', name : 'lmsect', align : 'center' , width : 120 } ,
			            { header : '취급품목', name : 'lmitem', align : 'center' , width : 120 } ,
			            { header : '담당자', name : 'lmcont', align : 'center' , width : 120 } ,
			            { header : '직위', name : 'lmsitr', align : 'center' , width : 120 } ,
			            { header : '연락처', name : 'lmtelp', align : 'center' , width : 120 } ,
			            { header : '이메일', name : 'lmemal', align : 'center' , width : 120 } ,
			            { header : '매출액', name : 'lmcapi', align : 'center' , width : 120 } ,
			            { header : '명함', name : 'lmbzcr', align : 'center' , width : 120 } ,
			            { header : '온도', name : 'lmtemp', align : 'center' , width : 120 } ,
			            { header : '면적', name : 'lmsize', align : 'center' , width : 120 } ,
			            { header : '지역구분', name : 'larea0', align : 'center' , width : 120 } ,
			            { header : '지역1', name : 'larea1', align : 'center' , width : 120 } ,
			            { header : '지역2', name : 'larea2', align : 'center' , width : 120 } ,
			            { header : '지역3', name : 'larea3', align : 'center' , width : 120 } ,
			            { header : '입주즉시여부', name : 'lminow', align : 'center' , width : 120 } ,
			            { header : '입주가능시점', name : 'lmfrom', align : 'center' , width : 120 } ,
			            { header : '계약기간(월)', name : 'lmterm', align : 'center' , width : 120 } ,
			            { header : '상태', name : 'rqstat', align : 'center' , width : 120 },
			            { header : '접수자', name : 'requsr', align : 'center' , width : 120 } ,
			            { header : '유형', name : 'reqcod', align : 'center' , width : 120 } ,
			            { header : '날짜', name : 'reqday', align : 'center' , width : 120 } ,
			            { header : '시간', name : 'reqtim', align : 'center' , width : 120 } ,
			            { header : '구분', name : 'rqifcd', align : 'center' , width : 120 } ,
			            { header : '제공자', name : 'rqiusr', align : 'center' , width : 120 } ,
			            { header : '공동중개사', name : 'rqicop', align : 'center' , width : 120 } ,
			            { header : '담당자', name : 'rqiman', align : 'center' , width : 120 } ,
			            { header : '전화번호', name : 'rqitel', align : 'center' , width : 120 } ,
			            { header : '명함', name : 'rqbzcr', align : 'center' , width : 120 } 			            
			        ],
			        columnOptions : {
			        	resizable:true
			        }
			        , data : json		        		        
			    });

		}				
	</script>
	<style>	
		table, th, td {
		  border: 1px solid grey;
		  border-collapse: collapse;
		}
		th, td {
		  text-align: center;
		}
	</style>	

</head>



<body>
 <input type="hidden" id="gridData" name="gridData" value='<c:out value="${searchVO.searchExt9}"/>' />
 
 <a href="index.html">Home</a><br><br>
 &nbsp;&nbsp;&nbsp;<a href="reqlmForm">임차의뢰 정보등록</a>
 &nbsp;&nbsp;&nbsp;<a href="reqlmlist">임차의뢰 리스트</a>
 <hr>
   *********** 임차의뢰 리스트조회 *********** 
 <hr>
  리스트
 <hr>
  검색결과 : <text type="label" id="gridTotalCount" name="gridTotalCount"></text> 건
	
<br>	
    <div id="grid"></div>
<br>	

</body>
</html>