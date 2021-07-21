<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<link href="js/dynatree/ui.dynatree.css" rel="stylesheet" id="skinSheet"/>

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
	<script src="js/project9.js"></script>    
	<script>
		function fn_formSubmit(){
			document.form1.submit();	
		}
	</script>

</head>

<body>
    <div id="wrapper">
		<jsp:include page="../common/navigation.jsp" />		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header"> Warehouse's Detail Information </h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <br>창고 번호 : <c:out value="${warehouseVO.whcode}"/>
            <br>창고 명 : <c:out value="${warehouseVO.whname}"/>
            <br>창고 주소 : <c:out value="${warehouseVO.mpadrs}"/>
            <br>창고 좌표X : <c:out value="${warehouseVO.kkompx}"/>
            <br>창고 좌표Y : <c:out value="${warehouseVO.kkompy}"/>
            <br>연면적 : <c:out value="${warehouseVO.szarea}"/>
        </div>
    </div>
</body>

</html>
