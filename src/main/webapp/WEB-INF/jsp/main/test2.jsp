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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://use.fontawesome.com/926fe18a63.js"></script>
      
<script>        
	$('document').ready(function() {
	   var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	   var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	 
	
		 // 시/도 선택 박스 초기화
		 $("select[name^=sido]").each(function() {
			  $selsido = $(this);
			  $.each(eval(area0), function() {
			   $selsido.append("<option value='"+this+"'>"+this+"</option>");
			  });
			  $selsido.next().append("<option value=''>구/군 선택</option>");
		 });
		
		 // 시/도 선택시 구/군 설정
		 $("select[name^=sido]").change(function() {
			  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
			  var $gugun = $(this).next(); // 선택영역 군구 객체
			  $("option",$gugun).remove(); // 구군 초기화
			
			  if(area == "area0")
			   $gugun.append("<option value=''>구/군 선택</option>");
			  else {
			   $.each(eval(area), function() {
			    $gugun.append("<option value='"+this+"'>"+this+"</option>");
			   });
			  }
		 });
	
	});
</script>                
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
                background-color: #fff !important;
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
                background-color: #fff;
                border: 1px solid grey;
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
            .chart li {
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
                grid-column: 1 / 2;
                background-color: #588BAE;
            }
            .chart ul .chart-li-two-a {
                grid-column: 2 / 2;
                background-color: #0080FF;
            }
            .chart ul .chart-li-two-b {
                grid-column: 2 / 4;
                background-color: #4682B4;
            }
            .chart ul .chart-li-three {
                grid-column: 3 / 5;
                background-color: #57A0D3;
            }
            .chart ul .chart-li-four {
                grid-column: 3 / 9;
                background-color: #0E4D92;
            }
            .chart ul .chart-li-five {
                grid-column: 7 / 10;
                background-color: #4F97A3;
            }
            .chart ul .chart-li-six {
                grid-column: 10 / 12;
                background-color: #73C2FB;
            }
            .chart ul .chart-li-seven {
                grid-column: 1 / 3;
                background-color: #0080FF;
            }
        </style>
    </head>
    <body>
        <jsp:include page="inc_header.jsp" flush="true"/>
        
<br>

<select name="sido1" id="sido1"></select>
<select name="gugun1" id="gugun1"></select>
<br>

<select name="sido2" id="sido2"></select>
<select name="gugun2" id="gugun2"></select>

<br>        
        <div class="container">
            <h5 class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;">
                <strong>현황관리</strong>
            </h5>
            <div class="row">
                <div class="col-md-12"></div>
            </div>
            <div class="chart">
                <div class="chart-row chart-period">
                    <div class="chart-row-item">창고</div>
                    <span>22'01</span>
                    <span>22'02</span>
                    <span>22'03</span>
                    <span>22'04</span>
                    <span>22'05</span>
                    <span>22'06</span>
                    <span>22'07</span>
                    <span>22'08</span>
                    <span>22'09</span>
                    <span>22'10</span>
                    <span>22'11</span>
                    <span>22'12</span>
                </div>
                <div class="chart-row chart-lines">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
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
                <div class="col-md-12"></div>
            </div>
            <div class="chart">
                <ul class="chart-row-bars">
                    <li class="chart-li-seven">임대</li>
                    <li class="chart-li-seven">임대</li>
                    <li class="chart-li-seven">임대</li>
                    <li class="chart-li-seven">임대</li>
                </ul>
            </div>
        </div>
        <br>
        
        
<section class="py-20 bg-light overflow-hidden">
  <div class="container">
    <div class="p-8 p-lg-20 bg-white">
      <h2 class="mb-8 mb-md-20">Your cart</h2>
      <div class="row align-items-center">
        <div class="col-12 col-xl-8 mb-8 mb-xl-0">
          <div class="d-none d-lg-flex row">
            <div class="col-12 col-lg-6">
              <h4 class="mb-6 text-secondary" style="font-size: 16px;">Description</h4>
            </div>
            <div class="col-12 col-lg-2">
              <h4 class="mb-6 text-secondary" style="font-size: 16px;">Price</h4>
            </div>
            <div class="col-12 col-lg-2 text-center">
              <h4 class="mb-6 text-secondary" style="font-size: 16px;">Quantity</h4>
            </div>
            <div class="col-12 col-lg-2 text-end">
              <h4 class="mb-6 text-secondary" style="font-size: 16px;">Subtotal</h4>
            </div>
          </div>
          <div class="mb-12 py-6 border-top border-bottom">
            <div class="row align-items-center mb-6 mb-md-3">
              <div class="col-12 col-md-8 col-lg-6 mb-6 mb-md-0">
                <div class="row align-items-center">
                  <div class="col-12 col-md-4 mb-3">
                    <div class="d-flex align-items-center justify-content-center bg-light" style="width: 96px; height: 128px;">
                      <img class="img-fluid" style="object-fit: contain;" src="yofte-assets/images/waterbottle.png" alt="">
                    </div>
                  </div>
                  <div class="col-8">
                    <h3 class="mb-2 lead fw-bold">BRILE water filter carafe</h3>
                    <p class="mb-0 text-secondary">Maecenas 0.7 commodo sit</p>
                  </div>
                </div>
              </div>
              <div class="d-none d-lg-block col-lg-2">
                <p class="mb-0 lead fw-bold text-info">$29.89</p>
                <span class="small text-secondary text-decoration-line-through">$33.69</span>
              </div>
              <div class="col-auto col-md-2">
                <div class="d-inline-flex align-items-center px-4 fw-bold text-secondary border rounded-2">
                  <button class="btn px-0 py-2">
                    <svg width="12" height="2" viewbox="0 0 12 2" fill="none" xmlns="http://www.w3.org/2000/svg"><g opacity="0.35"><rect x="12" width="2" height="12" transform="rotate(90 12 0)" fill="currentColor"></rect></g></svg>
                  </button>
                  <input class="form-control px-2 py-4 text-center text-md-end border-0" style="width: 48px;" type="number" placeholder="1">
                  <button class="btn px-0 py-2">
                    <svg width="12" height="12" viewbox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg"><g opacity="0.35"><rect x="5" width="2" height="12" fill="currentColor"></rect><rect x="12" y="5" width="2" height="12" transform="rotate(90 12 5)" fill="currentColor"></rect></g></svg>
                  </button>
                </div>
              </div>
              <div class="col-auto col-md-2 text-end">
                <p class="lead fw-bold text-info">$29.89</p>
              </div>
            </div>
            <div class="row align-items-center">
              <div class="col-12 col-md-8 col-lg-6 mb-6 mb-md-0">
                <div class="row align-items-center">
                  <div class="col-12 col-md-4 mb-3">
                    <div class="d-flex align-items-center justify-content-center bg-light" style="width: 96px; height: 128px;">
                      <img class="img-fluid" style="object-fit: contain;" src="yofte-assets/images/basketball.png" alt="">
                    </div>
                  </div>
                  <div class="col-8">
                    <h3 class="mb-2 lead fw-bold">Nike basketball ball</h3>
                    <p class="mb-0 text-secondary">Maecenas 0.7 commodo sit</p>
                  </div>
                </div>
              </div>
              <div class="d-none d-lg-block col-lg-2">
                <p class="mb-0 lead fw-bold text-info">$29.89</p>
                <span class="small text-secondary text-decoration-line-through">$33.69</span>
              </div>
              <div class="col-auto col-md-2">
                <div class="d-inline-flex align-items-center px-4 fw-bold text-secondary border rounded-2">
                  <button class="btn px-0 py-2">
                    <svg width="12" height="2" viewbox="0 0 12 2" fill="none" xmlns="http://www.w3.org/2000/svg"><g opacity="0.35"><rect x="12" width="2" height="12" transform="rotate(90 12 0)" fill="currentColor"></rect></g></svg>
                  </button>
                  <input class="form-control px-2 py-4 text-center text-md-end border-0" style="width: 48px;" type="number" placeholder="1">
                  <button class="btn px-0 py-2">
                    <svg width="12" height="12" viewbox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg"><g opacity="0.35"><rect x="5" width="2" height="12" fill="currentColor"></rect><rect x="12" y="5" width="2" height="12" transform="rotate(90 12 5)" fill="currentColor"></rect></g></svg>
                  </button>
                </div>
              </div>
              <div class="col-auto col-md-2 text-end">
                <p class="lead fw-bold text-info">$29.89</p>
              </div>
            </div>
          </div>
          <div class="d-flex flex-wrap flex-md-nowrap align-items-center mb-lg-n4">
            <span class="flex-shrink-0 me-12 mb-4 mb-lg-0 fw-bold">Apply discount code:</span>
            <input class="form-control me-6 mb-4 mb-lg-0 px-8 py-4 fw-bold border" type="text" placeholder="SUMMER30X">
            <a class="flex-shrink-0 btn btn-sm btn-dark" href="#">Apply</a>
          </div>
        </div>
        <div class="col-12 col-xl-4">
          <div class="p-6 p-md-12 bg-info">
            <h3 class="mb-6 text-white">Cart totals</h3>
            <div class="d-flex mb-8 align-items-center justify-content-between pb-5 border-bottom border-info-light">
              <span class="text-light">Subtotal</span>
              <span class="lead fw-bold text-white">$89.67</span>
            </div>
            <h4 class="mb-2 lead fw-bold text-white">Shipping</h4>
            <div class="d-flex mb-2 justify-content-between align-items-center">
              <span class="text-light">Next day</span>
              <span class="lead fw-bold text-white">$11.00</span>
            </div>
            <div class="d-flex mb-10 justify-content-between align-items-center">
              <span class="text-light">Shipping to United States</span>
              <span class="lead fw-bold text-white">-</span>
            </div>
            <div class="d-flex mb-10 justify-content-between align-items-center">
              <span class="lead fw-bold text-white">Order total</span>
              <span class="lead fw-bold text-white">$100.67</span>
            </div>
            <a class="btn btn-primary w-100 text-uppercase" href="#">Go to Checkout</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>        
        
        <jsp:include page="inc_footer.jsp" flush="true"/>
    </body>
</html>