<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><s:message code="common.pageTitle"/></title>
    <link href="css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script>
		function fn_formSubmit(){
			document.form1.submit();	
		}
		
		function fnCheckAll() {
			var	chk = $("#chkall").is(":checked");
			$('input:checkbox[name="checkRow"]').each(function() {
				this.checked = chk; 
			})	
		}    
	</script>

</head>

<body>

    <div id="wrapper">

		<jsp:include page="../common/navigation.jsp" />
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"> 창고조회 </h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div class="input-group custom-search-form col-lg-3">
				<form role="form" id="form1" name="form1"  method="post">
					<input class="form-control" placeholder="창고명" type="text" name="searchKeyword" 
						   value='<c:out value="${searchVO.searchKeyword}"/>' >
					<input class="form-control" placeholder="주소" type="text" name="searchExt1" 
						   value='<c:out value="${searchVO.searchExt1}"/>' >
					<input class="form-control" placeholder="고유번호" type="text" name="searchExt2" 
						   value='<c:out value="${searchVO.searchExt2}"/>' >
					<span class="input-group-btn">	                        
						<button class="btn btn-default" onclick="fn_formSubmit()">
						    <i class="fa fa-search"> 창고 조회 </i>
						</button>
            		</span>
				</form>	
            </div>
            <!-- /.row -->
            </br>
            <div class="row">
	            <button type="button" class="btn btn-default pull-right" onclick="form2.submit()">
	            	<i class="fa fa-times fa-fw"></i>지도보기
	            </button>     
				&nbsp;&nbsp;&nbsp;
				<input id="chkall" name="chkall" title="모두선택" onclick="fnCheckAll()" type="checkbox"> 전체선택             
            </div>
            
			<br/>
			
				<form role="form" id="form2" name="form2"  method="post" action="viewCheckedMap">
					<c:forEach var="listview" items="${listview}" varStatus="status">
						<div class="listBody">							
<!--  							<c:out value="${status.index + 1}"/> -->
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="checkRow" value="<c:out value="${listview.whcode}"/>"/> &nbsp;
							<a href="wareDetail?whcode=${listview.whcode}">${listview.whcode}</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${listview.whname}"/>   
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${listview.mpadrs}"/>   
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${listview.kkompx}"/>   
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${listview.kkompy}"/>   
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:out value="${listview.szarea}"/>   
						</div>
					</c:forEach>	
				</form>	
				<br/>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>