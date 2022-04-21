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
 	<style>
 
  .chart {
      display: grid;
      border: 2px solid grey;
      position: relative;
      overflow: hidden;  
  }
  .chart-row {
    display: grid;      
    grid-template-columns: 50px 1fr;
    background-color: #fff;
  }
  .chart-row:nth-child(odd) {
    background-color: #fff;
  }
  .chart-period {
    color: black;
    background-color:  #fff !important;
    border-bottom: 2px solid grey; 
    grid-template-columns: 50px repeat(12, 1fr);
  }
  .chart-lines {
    position: absolute;
    height: 100%;
    width: 100%;
    background-color: transparent;
    grid-template-columns: 50px repeat(12, 1fr);
  }
  .chart-period > span {    
    text-align: center;
    font-size: 13px;
    align-self: center;
    font-weight: bold;
    padding: 15px 0;    
  }
  .chart-lines > span {
    display: block;
    border-right: 1px solid rgba(0, 0, 0, 0.3);
  }
 
  .chart-row-item {
    background-color:#fff;
    border: 1px solid  grey;
    border-top: 0;
    border-left: 0;      
    padding: 20px 0;
    font-size: 15px;
    font-weight: bold;
    text-align: center;
  } 

  .chart-row-bars {
    list-style: none;
    display: grid;
    padding: 15px 0;
    margin: 0;
    grid-template-columns: repeat(12, 1fr);
    grid-gap: 10px 0;
    border-bottom: 1px solid grey;
  }
 .chart  li {
    font-weight: 450;
    text-align: left;
    font-size: 15px;
    min-height: 15px;
    background-color: #fff;
    padding: 5px 15px;
    color: #fff;
    overflow: hidden;
    position: relative;
    cursor: pointer;
    border-radius: 15px;
  }
  .chart ul .chart-li-one {
    grid-column: 1/2; 
    background-color:#588BAE;
  }
  .chart ul .chart-li-two-a {
    grid-column: 2/2; 
    background-color: #0080FF;
  }
  .chart ul .chart-li-two-b {
    grid-column: 2/4; 
    background-color:#4682B4;
  } 
  .chart ul .chart-li-three {
    grid-column: 3/5; 
    background-color:#57A0D3;
  }
  .chart ul .chart-li-four {
    grid-column: 3/9; 
    background-color:#0E4D92;
  }
  .chart ul .chart-li-five {
    grid-column: 7/10; 
    background-color:#4F97A3;
  }
  .chart ul .chart-li-six {
    grid-column: 10/12; 
    background-color:#73C2FB;
  }
  .chart ul .chart-li-seven {
    grid-column: 1/3; 
    background-color:#0080FF;
  }
	
	</style>	
 </head>	
<body>
<jsp:include page="inc_header.jsp" flush="true"/>

<div class="container">
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>현황관리</strong></h5>
	  <div class="row">
	        <div class="col-md-12">
	   		</div>
	  </div>
	 


      <div class="chart">
      <div class="chart-row chart-period">
          <div class="chart-row-item">창고</div>
          <span>22'01</span><span>22'02</span><span>22'03</span>
          <span>22'04</span><span>22'05</span><span>22'06</span>
          <span>22'07</span><span>22'08</span><span>22'09</span>
          <span>22'10</span><span>22'11</span><span>22'12</span>
      </div>
      <div class="chart-row chart-lines">
        <span></span><span></span><span></span>
        <span></span><span></span><span></span>
        <span></span><span></span><span></span>
        <span></span><span></span><span></span>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1111</div>
        <ul class="chart-row-bars">
          <li class="chart-li-one">접수</li>
        </ul>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1112</div>
        <ul class="chart-row-bars">
          <li class="chart-li-two-a">접수</li>
          <li class="chart-li-two-b">실사</li>          
        </ul>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1113</div>
        <ul class="chart-row-bars">
          <li class="chart-li-three">계약</li>
        </ul>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1114</div>
        <ul class="chart-row-bars">
          <li class="chart-li-four">임대</li>
        </ul>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1115</div>
        <ul class="chart-row-bars">
          <li class="chart-li-five">접수</li>
        </ul>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1116</div>
        <ul class="chart-row-bars">
          <li class="chart-li-six">계약</li>
        </ul>
      </div>
      <div class="chart-row">
        <div class="chart-row-item">1117</div>
        <ul class="chart-row-bars">
          <li class="chart-li-seven">접수</li>
        </ul>
      </div>
    </div>
    

	 <div class="row mt-5 mb-3">
	       <div class="col-md-12">
	       </div>
	 </div>
	    
	   <div class="chart">
	        <ul class="chart-row-bars">
				<li class="chart-li-seven">임대</li>
				<li class="chart-li-seven">임대</li>
				<li class="chart-li-seven">임대</li>
				<li class="chart-li-seven">임대</li>
	        </ul>
	  </div>      
<!--  	  
	  <div class="row">
	        <div class="col-md-12">
	        	<jsp:include page="qgis.jsp" flush="true"/>
	   		</div>
	  </div>
-->	            
</div>
<br>
<jsp:include page="inc_footer.jsp" flush="true"/>
</body>

</html>

