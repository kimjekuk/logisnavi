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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="initial-scale=1,user-scalable=no,maximum-scale=1,width=device-width">
        <meta name="mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <link rel="stylesheet" href="js/gis/resources/ol.css">
        <link rel="stylesheet" href="js/gis/resources/fontawesome-all.min.css">
        <link rel="stylesheet" href="js/gis/resources/ol-layerswitcher.css">
        <link rel="stylesheet" href="js/gis/resources/qgis2web.css">
<style>
.search-layer {
  top: 65px;
  left: .5em;
}
.ol-touch .search-layer {
  top: 80px;
}
</style>
        <style>
        html, body {
            background-color: #ffffff;
        }
        .ol-control button {
            background-color: #f8f8f8 !important;
            color: #000000 !important;
            border-radius: 0px !important;
        }
        .ol-zoom, .geolocate, .gcd-gl-control .ol-control {
            background-color: rgba(255,255,255,.4) !important;
            padding: 3px !important;
        }
        .ol-scale-line {
            background: none !important;
        }
        .ol-scale-line-inner {
            border: 2px solid #f8f8f8 !important;
            border-top: none !important;
            background: rgba(255, 255, 255, 0.5) !important;
            color: black !important;
        }
        </style>
        <style>
        #map {
            width: 1662px;
            height: 852px;
        }
        </style>
        <title></title>
    </head>
    <body>
	<jsp:include page="inc_header.jsp" flush="true"/>
	<h5  class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;"><strong>GIS이미지</strong></h5>
		<div class="container">		
		  <div class="row">
		        <div class="col-md-12" style="border: solid grey 1px;">
			        <div id="map" width="100%">
			            <div id="popup" class="ol-popup">
			                <a href="#" id="popup-closer" class="ol-popup-closer"></a>
			                <div id="popup-content"></div>
			            </div>
			        </div>
				</div>
		  </div>			        
		</div>    
	<jsp:include page="inc_footer.jsp" flush="true"/>        
        <script src="js/gis/resources/qgis2web_expressions.js"></script>
        <script src="js/gis/resources/polyfills.js"></script>
        <script src="js/gis/resources/functions.js"></script>
        <script src="js/gis/resources/ol.js"></script>
        <script src="js/gis/resources/ol-layerswitcher.js"></script>
        <script src="js/gis/layers/___0.js"></script>
        <script src="js/gis/styles/___0_style.js"></script>
        <script src="js/gis/layers/layers.js" type="text/javascript"></script> 
        <script src="js/gis/resources/Autolinker.min.js"></script>
        <script src="js/gis/resources/qgis2web.js"></script>
    </body>
</html>
