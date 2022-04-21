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
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://use.fontawesome.com/926fe18a63.js"></script>
    <title>IamLogis</title>
	<style>
    	div {  border: solid red 1px; } 
	</style>	
  </head>
  <body>
<!--
	<jsp:include page="inc_header4.jsp" flush="true"/>
-->


<div class="container">
    <h2> </h2>
	    
	<div id="demo" class="carousel slide" data-ride="carousel">
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  <div class="carousel-inner">
	    <div class="carousel-item active  align-self-center">
	      <img class="img-fluid" src="css/assets/img/banner_img_01.jpg" width="100%" height="100%" alt="">
	      <div class="carousel-caption">
		      <div class="text-align-center align-self-center">
		          <h1 class="h1 text-success"><b>Find</b></h1><br>
		          <h3 class="h2">창고유형별 검색</h3>
		          <br>
		          <p>
		             상온, 냉동, 냉장, 위험물 등의 시설유형으로 검색하여, <br>
		             창고운영업체와 임대창고 공간을 찾으실 수 있습니다.<br>
		          </p>
		      </div>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img class="img-fluid" src="css/assets/img/banner_img_02.jpg" width="100%" height="100%" alt="">
	      <div class="carousel-caption">
		      <div class="text-align-left align-self-center">
		          <h1 class="h1 text-success"><b>Find</b></h1><br>
		          <h3 class="h2">창고유형별 검색</h3>
		          <br>
		          <p>
		             상온, 냉동, 냉장, 위험물 등의 시설유형으로 검색하여, <br>
		             창고운영업체와 임대창고 공간을 찾으실 수 있습니다.<br>
		          </p>
		      </div>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img class="img-fluid" src="css/assets/img/banner_img_03.jpg" width="100%" height="100%" alt="">
	      <div class="carousel-caption">
		      <div class="text-align-left align-self-center">
		          <h1 class="h1 text-success"><b>Find</b></h1><br>
		          <h3 class="h2">창고유형별 검색</h3>
		          <br>
		          <p>
		             상온, 냉동, 냉장, 위험물 등의 시설유형으로 검색하여, <br>
		             창고운영업체와 임대창고 공간을 찾으실 수 있습니다.<br>
		          </p>
		      </div>
	      </div>   
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
	
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="css/assets/img/category_img_01.jpg" class="rounded-circle"></a>
                <h5 class="text-center mt-3 mb-3">영업창고</h5>
                <!--  
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                -->
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="css/assets/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="h5 text-center mt-3 mb-3">물류부동산</h5>
                <!--  
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                -->
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="css/assets/img/category_img_03.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="h5 text-center mt-3 mb-3">SELF STORAGE</h5>
                <!--  
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                -->
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="http://iamlogis.com/detail_jeonsok.html">
                        <img src="css/assets/img/feature_prod_01.jpg" width="100%" height="100%" class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <ul class="list-unstyled d-flex justify-content-between">
                            <li>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                            </li>
                            <li class="text-muted text-right">임대료(평당) 24,000원</li>
                        </ul>
                        <a href="shop-single.html" class="h5 text-decoration-none text-dark">GREYBOX 안산물류센터</a>
                        <p class="card-text">
                        <br>
                           창고시설(상온,저온),근린생활<br>
                           지하1층/지상6층(창고 6개층)<br>
                           연면적 33,310 평<br>
                        </p>
                        <p class="text-muted">Reviews (24)</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="http://iamlogis.com/detail_jeonsok.html">
                        <img src="css/assets/img/feature_prod_02.jpg"  width="100%" height="100%"  class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <ul class="list-unstyled d-flex justify-content-between">
                            <li>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                            </li>
                            <li class="text-muted text-right">임대료(평당) 48,000원</li>
                        </ul>
                        <a href="shop-single.html" class="h5 text-decoration-none text-dark">안성 능룩리 물류센터</a>
                        <p class="card-text">
                        <br>
                           창고시설(상온)<br>
                           지하3층/지상3층(창고 6개층)<br>
                           연면적 20,000 평<br>
                        </p>
                        <p class="text-muted">Reviews (48)</p>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-4 mb-4">
                <div class="card h-100">
                    <a href="http://iamlogis.com/detail_jeonsok.html">
                        <img src="css/assets/img/feature_prod_03.jpg"  width="100%" height="100%"  class="card-img-top" alt="...">
                    </a>
                    <div class="card-body">
                        <ul class="list-unstyled d-flex justify-content-between">
                            <li>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-warning fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                                <i class="text-muted fa fa-star"></i>
                            </li>
                            <li class="text-muted text-right">임대료(평당) 12,000원</li>
                        </ul>
                        <a href="shop-single.html" class="h5 text-decoration-none text-dark">이천 이치리 물류센터</a>
                        <p class="card-text">
                        <br>
                           창고시설(상온)<br>
                           지하2층/지상4층(창고 6개층)<br>
                           연면적 25,000 평<br>
                        </p>
                        <p class="text-muted">Reviews (74)</p>
                    </div>
                </div>
            </div>
    	</div>
	</div>
</div>
<!--
	<jsp:include page="inc_footer3.jsp" flush="true"/> 
-->
  </body>
</html>