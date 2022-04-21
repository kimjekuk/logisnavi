<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
    <title>IamLogis LM System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://use.fontawesome.com/926fe18a63.js"></script>
    <script src="js/jquery-2.2.3.min.js"></script>
	<style>
		.headerSpace div {
			margin-top: 0;
			margin-bottom: 0;
		}
	</style>
</head>

<body>
	<section class="headerSpace">
		<div>
		  <jsp:include page="inc_header.jsp" flush="true"/>
		</div>
		<div>
		  <jsp:include page="inc_footer.jsp" flush="true"/> 
		</div>
	</section>
	<script>
	</script>
</body>
</html>
