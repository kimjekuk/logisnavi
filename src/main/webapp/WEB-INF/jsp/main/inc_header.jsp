<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!doctype html>
<html lang="ko">
  <head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>IamLogis</title>
    <style>
    
/*
 		body {
		    background-color: white; 
		    background-image: url(images/bgimg01.jpg);
		    background-repeat: no-repeat;
		}    
 */    
	    
	   	div {  border: solid red 0px; } 
	    .nav-link{
	    		  font-size:14px;
				  color: #fff;
				}
	    .dropdown-item{
	    		  font-size:14px;
				  color: #black;
				}
    
    </style>
  </head>
  <body>
<nav class="navbar navbar-expand-md" style="background-color: #004080;">
<div class="container">
    <a class="navbar-brand" style="color: #fff;" href="index"><strong>IamLogis</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
        <span class="navbar-toggler-icon"><span class="fa fa-solid fa-bars fa-lg" style="color:white"></span></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index"> <span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <ul class="navbar-nav mr-5">
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        <b>창고정보</b>
		      </a>
		      <div class="dropdown-menu">
					<a class="dropdown-item" href="search">창고검색</a>
					<a class="dropdown-item" href="searchMap">지도검색(내부용)</a>
					<a class="dropdown-item" href="searchMapExt">지도검색(외부용)</a>
		      </div>
		    </li>
		  
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        <b>의뢰관리</b>
		      </a>
		      <div class="dropdown-menu">
					<a class="dropdown-item" href="reqlmForm">접수등록</a>
					<a class="dropdown-item" href="reqlmlist">접수리스트</a>
					<a class="dropdown-item" href="matchList">매칭정보</a>
		      </div>
		    </li>
		  
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        <b>건축데이터</b>
		      </a>
		      <div class="dropdown-menu">
					<a class="dropdown-item" href="searchBasis">인허가정보</a>
					<a class="dropdown-item" href="searchBrtitle">건축물대장</a>
		      </div>
		    </li>

		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle"  href="#" id="navbardrop" data-toggle="dropdown">
		        <b>창고통계정보</b>
		      </a>
		      <div class="dropdown-menu">
					<a class="dropdown-item" href="wareSatistics">통계정보1</a>
		      </div>
		    </li>
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        <b>test</b>
		      </a>
		      <div class="dropdown-menu">
				<a class="dropdown-item" href="test">test(Schedule)</a>
<!--  		    
				<a class="dropdown-item" href="echart">test(echart)</a>
				<a class="dropdown-item" href="testQgis">test(Qgis)</a>
				<a class="dropdown-item" href="viewMapPoligon">test(Poligon)</a>
-->
		      </div>
		    </li>        
<!--  		    
            <li class="nav-item">
                <a class="nav-link" href="#">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"></a>
            </li>
-->            
        </ul>
    </div>
</div>    
</nav>

  </body>
</html>