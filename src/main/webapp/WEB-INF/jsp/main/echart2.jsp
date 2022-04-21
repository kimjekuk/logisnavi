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
        <script src="js/echarts.min.js"></script>
        <style></style>
    </head>
    <body>
        <jsp:include page="inc_header.jsp" flush="true"/>
        <div class="container">
            <h5 class="pt-4 mb-4" style="color:#004080;margin-bottom:20px;text-align:center;">
                <strong>창고통계정보</strong>
            </h5>
            <div class="panel panel-warnning">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" ">
                            <tbody>
                                <tr>
                                    <td>
                                        <div id="main1" style="width: 300px; height: 300px;margin: auto; "></div>
                                    </td>
                                    <td>
                                        <div id="myChart" style="width:100%; max-width:300px; height:300px;margin: auto; "></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="mapchart_div" style="width: 300px; height: 300px;margin: auto; "></div>
                                    </td>
                                    <td>
                                        <div id="geochart-colors" style="width: 300px; height: 300px;margin: auto; "></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--  
            	    <div id="gant_chart" style="width:100%; height:100%;margin: auto; "></div>
            	    -->
        </div>
        <br><br><br>
        <jsp:include page="inc_footer.jsp" flush="true"/>
        <script type="text/javascript">
            // DOM을 준비하고 echart 객체를 만듭니다.
            var myChart = echarts.init(document.getElementById('main1'));
            // 차트 속성과 데이터를 지정합니다.
            var option = {
                title: {
                    text: 'ECharts entry example'
                },
                tooltip: {},
                legend: {
                    data: ['Sales']
                },
                xAxis: {
                    data: [
                        "shirt",
                        "cardign",
                        "chiffon shirt",
                        "pants",
                        "heels",
                        "socks"
                    ]
                },
                yAxis: {},
                series: [
                    {
                        name: 'Sales',
                        type: 'bar',
                        data: [
                            5,
                            20,
                            36,
                            10,
                            10,
                            20
                        ]
                    }
                ]
            };
            // 위에서 설정한 속성을 차트에 반영합니다.
            myChart.setOption(option);
        </script>
    </body>
</html>