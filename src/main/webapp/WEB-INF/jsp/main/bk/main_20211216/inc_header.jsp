<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
    <title>IamLogis Warehouse Information Center</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>
	    
	<!-- Start Script -->
    <script src="js/assets/js/jquery-1.11.0.min.js"></script>
    <script src="js/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/assets/js/bootstrap.bundle.min.js"></script>
    <script src="js/assets/js/templatemo.js"></script>
    <script src="js/assets/js/custom.js"></script>
    <!-- End Script -->
    
</head>

<body>
    <!-- Start Top Nav -->
    <nav id="top_navi" class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@iamlogis.com">info@iamlogis.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:1644-1804">1644-1804</a>
                </div>
                <div>
                <!--  
                    <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                  -->
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="index.html">
                Iamlogis
            </a>

            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="search">창고조회</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="reqlmForm">임차의뢰관리</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="searchBasis">건축데이터</a>
                        </li>                        
                        <li class="nav-item">
                            <a class="nav-link" href="wareSatistics">물류창고현황</a>
                        </li>                        
    <!--                          
                        <li class="nav-item">
                            <a class="nav-link" href="callPubAPI">건축데이터(실시간 단건)</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="boardList">test</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="gridtest">GRID테스트</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="searchBrtitle">건축물대장</a>
                        </li>         
                            <a class="nav-link" href="register">창고등록</a>           
                        <li class="nav-item">
                            <a class="nav-link" href="titlepart">건축물대장</a>
                        </li>         
                        <li class="nav-item">
                            <a class="nav-link" href="history">History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="favorite">Favorite</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="guide">Guide</a>
                        </li>
	-->                        
                    </ul>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->

    <!-- Start go-back button -->
    <div style="position:fixed;bottom:10px;right:10px;">
	    <a href="#top_navi"><h1 style="margin:0px 0px 0px 0px;font-size:15px">⇧ 위로</h1></a>
    </div>
    <!-- End go-back button -->    


</body>

</html>