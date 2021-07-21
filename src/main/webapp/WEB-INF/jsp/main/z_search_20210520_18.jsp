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

    <link rel="stylesheet" href="css/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/assets/css/templatemo.css">
    <link rel="stylesheet" href="css/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="css/assets/css/fontawesome.min.css">
    
    
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
    <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
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
                            <a class="nav-link" href="search">Search</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="history">History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="favorite">Favorite</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="mainlogin">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="guide">Guide</a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>
    <!-- Close Header -->

    <!-- Start Contact -->
    <div class="container py-5">
            <form class="col-md-9 m-auto" role="form" id="form1" name="form1"  method="post">
                <div class="row">
                <div class="form-group col-md-5 mb-3">
<!--                <label for="inputSearch3">명칭 및 위치</label> -->
                    <input type="text" class="form-control mt-2" name="searchKeyword" placeholder="명칭 및 위치"  
                    	value='<c:out value="${searchVO.searchKeyword}"/>' >
                </div>
                    <div class="form-group col-md-3 mb-3">
<!--                    <label for="inputSearch2">From</label> -->
	                    <select class="form-control mt-2" name="searchExt1" >
		                    <option value="0"> 하한선 없음 </option>
		                    <option value="100"> 100 평 </option>
		                    <option value="300"> 300 평 </option>
		                    <option value="500"> 500 평 </option>
		                    <option value="1000"> 1000 평 </option>
		                    <option value="2000"> 2000 평 </option>
		                    <option value="2000"> 3000 평 </option>
	                    </select>

<!--                    <label for="inputSearch3">To</label> -->
	                    <select class="form-control mt-2" name="searchExt2" >
		                    <option value="9999999"> 상한선 없음 </option>
		                    <option value="100"> 100 평 </option>
		                    <option value="300"> 300 평 </option>
		                    <option value="500"> 500 평 </option>
		                    <option value="1000"> 1000 평 </option>
		                    <option value="2000"> 2000 평 </option>
		                    <option value="2000"> 3000 평 </option>
	                    </select>
                    </div>

                    <div class="col text-end mt-2">
                        <button type="submit" class="btn btn-success btn-lg px-3" onclick="fn_formSubmit()">창고 찾기</button>
                    </div>
                </div>
            </form>
    </div>
    <!-- End Contact -->


    <!-- Start items -->
    <div class="container py-5">
	<!-- start warehouse items -->       
	
	
	
	
		<div>
			<table style="width: 762px; height: 186px;">
				<tbody>
					<tr>
						<td style="width: 138px;" rowspan="4">
						<img src="http://iamlogis.com/mallimg/2021/02/16/1613453884-67_N_150x120_100_7.jpg" width=200px heigth=200px>
						</td>
						<td style="width: 70px; text-align: left;">위치</td>
						<td style="width: 242px; text-align: left;">경기도 안양시 동안구 시민대로 260</td>
						<td style="width: 128px; text-align: right;" rowspan="4">
						즐겨찾기
						</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: left;">교통</td>
						<td style="width: 242px; text-align: left;">평촌IC 2km</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: left;">규모</td>
						<td style="width: 242px; text-align: left;">지상 10층</td>
					</tr>
					<tr>
						<td style="width: 70px; text-align: left;">준공일</td>
						<td style="width: 242px; text-align: left;">1995년 8월</td>
					</tr>
				</tbody>
			</table>
		</div>    
	<!-- end warehouse items -->       
	<br>	        
	<!-- start floor items -->       
		<div>
			<table align="center" width=100%>
			<thead align="center">
				<tr>
					<th>선택</th>
					<th>층</th>
					<th>면적</th>
					<th>용도</th>
					<th>임대료(월/평)</th>
					<th>평단가</th>
					<th>입주시기</th>
					<th>도면</th>
					<th>즐겨찾기</th>
				</tr>
			</thead>
			<tbody  align="center">
			<tr>
				<td>
					<input id='floor-45341-01704395' type='checkbox'>1F
				</td>
				<td>
					<a href="/industrial/property-113119086002/01704395">1-4층</a>
				</td>
				<td>
					2,742.22평
				</td>
				<td>
					창고
				</td>
				<td>
					미정
				</td>
				<td>
					미정
				</td>
				<td>
					2022년 1월
				</td>
				<td>
					<img alt="도면" data-src="https://image.cbre-propertysearch.jp/img/photo/0002/113119086002_0_ZA_01_00.jpg" />
				</td>
				<td>
					<i>grade</i>
				</td>
			</tr>
			</tbody>	
			</table>
		</div>        
	<!-- end floor items -->              
	</div>        
    <!--End items-->
    
    


    <div id="wrapper">

        <div id="page-wrapper">
            <div class="row">

                <!-- /.col-lg-12 -->
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
<c:if test="${name1 eq '홍길동'}">
    <c:out value="${str}" />
</c:if>

<c:set var="whcode_temp" value="" />
				<form role="form" id="form2" name="form2"  method="post" action="viewCheckedMap">
					<c:forEach var="listview" items="${listview}" varStatus="status">
						<div class="listBody">							
  							<c:out value="${status.index + 1}"/> 

<c:if test="${whcode_temp eq listview.whcode}">
  동일코드
</c:if>
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
<c:set var="whcode_temp" value="${listview.whcode}" />
							
						</div>
						<when>
					</c:forEach>	
				</form>	
				<br/>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
         

    </div>
    <!-- /#wrapper -->

    <!-- Start Footer -->
    <footer class="bg-dark" id="tempaltemo_footer">
        <div class="container">
            <div class="row">

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-success border-bottom pb-3 border-light logo">Iamlogis</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li>
                            <i class="fas fa-map-marker-alt fa-fw"></i>
                            경기도 안양시 동안구 시민대로 260, 1011호
                        </li>
                        <li>
                            <i class="fa fa-phone fa-fw"></i>
                            <a class="text-decoration-none" href="tel:1644-1804">1644-1804</a>
                        </li>
                        <li>
                            <i class="fa fa-envelope fa-fw"></i>
                            <a class="text-decoration-none" href="mailto:info@iamlogis.com">info@iamlogis.com</a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Service</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">창고 검색</a></li>
                        <li><a class="text-decoration-none" href="#">지도 검색</a></li>
                        <li><a class="text-decoration-none" href="#">임대 문의</a></li>
                        <li><a class="text-decoration-none" href="#">물류 컨설팅</a></li>
                        <li><a class="text-decoration-none" href="#">창고 시뮬레이션</a></li>
                    </ul>
                </div>

                <div class="col-md-4 pt-5">
                    <h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
                    <ul class="list-unstyled text-light footer-link-list">
                        <li><a class="text-decoration-none" href="#">Home</a></li>
                        <li><a class="text-decoration-none" href="#">About Us</a></li>
                        <li><a class="text-decoration-none" href="#">Locations</a></li>
                        <li><a class="text-decoration-none" href="#">FAQs</a></li>
                        <li><a class="text-decoration-none" href="#">Contact</a></li>
                    </ul>
                </div>

            </div>
            <div class="row text-light mb-4">
                <div class="col-12 mb-3">
                    <div class="w-100 my-3 border-top border-light"></div>
                </div> 
                <div class="col-auto">
                    <label class="sr-only" for="subscribeEmail">Email address</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address">
                        <div class="input-group-text btn-success text-light">Subscribe</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-100 bg-black py-3">
            <div class="container">
                <div class="row pt-2">
                    <div class="col-12">
                        <p class="text-left text-light">
                        <i>
                            Copyright &copy; 2021 IamLogis Corp. 
                            | Designed by <a rel="sponsored" href="https://iamlogis.com" target="_blank">iamlogis.com</a>
	                    </i>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </footer>
    <!-- End Footer -->

    <!-- Start Script -->
    <script src="js/assets/js/jquery-1.11.0.min.js"></script>
    <script src="js/assets/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/assets/js/bootstrap.bundle.min.js"></script>
    <script src="js/assets/js/templatemo.js"></script>
    <script src="js/assets/js/custom.js"></script>
    <!-- End Script -->
</body>

</html>