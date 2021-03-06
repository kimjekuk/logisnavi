<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="ko">

<head>
    <title>IamLogis Warehouse Information Center</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="css/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/assets/css/templatemo.css">
    <link rel="stylesheet" href="css/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/assets/css/fontawesome.min.css">
<!-- -->
</head>
<body>
<jsp:include page="inc_header.jsp" flush="true"/>

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="css/assets/img/banner_img_01.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left align-self-center">
                                <h1 class="h1 text-success"><b>Find</b></h1><br>
                                <h3 class="h2">??????????????? ??????</h3>
                                <br>
                                <p>
                                   ??????, ??????, ??????, ????????? ?????? ?????????????????? ????????????, <br>
                                   ????????????????????? ???????????? ????????? ????????? ??? ????????????.<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="css/assets/img/banner_img_02.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1 text-success"><b>Location</b></h1><br>
                                <h3 class="h2">??????????????? ??????</h3>
                                <br>
                                <p>
									??????????????? ????????? ?????? ???????????????. <br>
									???????????? ????????? ????????? ???????????????, <br>
									????????? ??????????????? ????????? ??? ????????????.<br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="css/assets/img/banner_img_03.jpg" alt="">
                        </div>
                        <div class="col-lg-6 mb-0 d-flex align-items-center">
                            <div class="text-align-left">
                                <h1 class="h1 text-success"><b>Real Estate</b></h1><br>                            
                                <h3 class="h2">???????????? ??????</h3>
                                <br>
                                <p>
									????????? ?????????????????? ????????????, <br>
									????????? ????????????????????? ???????????? ????????????, <br>
									????????? ???????????? ??????????????? ????????? ????????? ??? ????????????<br>                                
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">Categories of The Warehouse</h1>
                <br>
                <p>
                    ???????????????????????? ???????????? ????????? ??????
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="css/assets/img/category_img_01.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="text-center mt-3 mb-3">????????????</h5>
                <!--  
                <p class="text-center"><a class="btn btn-success">Go Shop</a></p>
                -->
            </div>
            <div class="col-12 col-md-4 p-5 mt-3">
                <a href="#"><img src="css/assets/img/category_img_02.jpg" class="rounded-circle img-fluid border"></a>
                <h5 class="h5 text-center mt-3 mb-3">???????????????</h5>
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
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured  -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">HOT Warehouses</h1>
                    <p>
					 	?????????????????? ???????????? ??? ????????? ?????? ?????????
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="css/assets/img/feature_prod_01.jpg" class="card-img-top" alt="...">
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
                                <li class="text-muted text-right">?????????(??????) 24,000???</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">GREYBOX ??????????????????</a>
                            <p class="card-text">
                            <br>
                               <strong>?????????????????? ????????? ??????????????????</strong><br>
                               ????????????(??????,??????),????????????<br>
                               ??????1???/??????6???(?????? 6??????)<br>
                               ????????? 33,310 ???<br>
                            </p>
                            <p class="text-muted">Reviews (24)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="css/assets/img/feature_prod_02.jpg" class="card-img-top" alt="...">
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
                                <li class="text-muted text-right">?????????(??????) 48,000???</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">?????? ????????? ????????????</a>
                            <p class="card-text">
                            <br>
                               ????????????(??????)<br>
                               ??????3???/??????3???(?????? 6??????)<br>
                               ????????? 20,000 ???<br>
                            </p>
                            <p class="text-muted">Reviews (48)</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="css/assets/img/feature_prod_03.jpg" class="card-img-top" alt="...">
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
                                <li class="text-muted text-right">?????????(??????) 12,000???</li>
                            </ul>
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">?????? ????????? ????????????</a>
                            <p class="card-text">
                            <br>
                               ????????????(??????)<br>
                               ??????2???/??????4???(?????? 6??????)<br>
                               ????????? 25,000 ???<br>
                            </p>
                            <p class="text-muted">Reviews (74)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured -->

 <jsp:include page="inc_footer.jsp" flush="true"/>

</body>
</html>