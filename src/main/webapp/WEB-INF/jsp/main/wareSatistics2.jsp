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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <style>
            div {
                border: solid red 0;
            }
        </style>
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
                                        <div id="chart_div" style="width: 300px; height: 300px;margin: auto; "></div>
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
        <script>
            google.charts.load('current', {
                'packages': [
                    'corechart', 'geochart', 'gantt'
                ],
                'mapsApiKey': 'AIzaSyAHLWrmRb2zN6UfEbyhf8X5bTFRu9FQ75w'
            });
            google.charts.setOnLoadCallback(drawChart);
            function daysToMilliseconds(days) {
                return days * 24 * 60 * 60 * 1000;
            }
            function drawChart() { // -----------------------------------------------------------------
                var data1 = google.visualization.arrayToDataTable([
                    [
                        'Contry', 'Mhl'
                    ],
                    [
                        'Italy', 54.8
                    ],
                    [
                        'France', 48.6
                    ],
                    [
                        'Spain', 44.4
                    ],
                    [
                        'USA', 23.9
                    ],
                    [
                        'Argentina', 14.5
                    ]
                ]);
                var options1 = {
                    title: 'World Wide Wine Production',
                    is3D: true
                };
                var chart1 = new google.visualization.PieChart(document.getElementById('myChart'));
                chart1.draw(data1, options1);
                // -----------------------------------------------------------------
                // Some raw data (not necessarily accurate)
                var data2 = google.visualization.arrayToDataTable([
                    [
                        'Month',
                        'Bolivia',
                        'Ecuador',
                        'Madagascar',
                        'Papua New Guinea',
                        'Rwanda',
                        'Average'
                    ],
                    [
                        '2004/05',
                        165,
                        938,
                        522,
                        998,
                        450,
                        614.6
                    ],
                    [
                        '2005/06',
                        135,
                        1120,
                        599,
                        1268,
                        288,
                        682
                    ],
                    [
                        '2006/07',
                        157,
                        1167,
                        587,
                        807,
                        397,
                        623
                    ],
                    [
                        '2007/08',
                        139,
                        1110,
                        615,
                        968,
                        215,
                        609.4
                    ],
                    [
                        '2008/09',
                        136,
                        691,
                        629,
                        1026,
                        366,
                        569.6
                    ]
                ]);
                var options2 = {
                    title: 'Monthly Coffee Production by Country',
                    vAxis: {
                        title: 'Cups'
                    },
                    hAxis: {
                        title: 'Month'
                    },
                    seriesType: 'bars',
                    series: {
                        5: {
                            type: 'line'
                        }
                    }
                };
                var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div'));
                chart2.draw(data2, options2);
                // -----------------------------------------------------------------
                // Some raw data (not necessarily accurate)
                var data2 = google.visualization.arrayToDataTable([
                    [
                        'Month',
                        'Bolivia',
                        'Ecuador',
                        'Madagascar',
                        'Papua New Guinea',
                        'Rwanda',
                        'Average'
                    ],
                    [
                        '2004/05',
                        165,
                        938,
                        522,
                        998,
                        450,
                        614.6
                    ],
                    [
                        '2005/06',
                        135,
                        1120,
                        599,
                        1268,
                        288,
                        682
                    ],
                    [
                        '2006/07',
                        157,
                        1167,
                        587,
                        807,
                        397,
                        623
                    ],
                    [
                        '2007/08',
                        139,
                        1110,
                        615,
                        968,
                        215,
                        609.4
                    ],
                    [
                        '2008/09',
                        136,
                        691,
                        629,
                        1026,
                        366,
                        569.6
                    ]
                ]);
                var options2 = {
                    title: 'Monthly Coffee Production by Country',
                    vAxis: {
                        title: 'Cups'
                    },
                    hAxis: {
                        title: 'Month'
                    },
                    seriesType: 'bars',
                    series: {
                        5: {
                            type: 'line'
                        }
                    }
                };
                var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div'));
                chart2.draw(data2, options2);
                // -----------------------------------------------------------------
                var data3 = google.visualization.arrayToDataTable([
                    [
                        'City', 'Population', 'Area'
                    ],
                    [
                        'Seoul', 2761477, 1285.31
                    ],
                    [
                        'Busan', 1324110, 181.76
                    ],
                    [
                        'Daegu', 959574, 117.27
                    ],
                    [
                        'Daejeon', 907563, 130.17
                    ],
                    [
                        'Gwangju', 655875, 158.9
                    ],
                    [
                        'Incheon', 607906, 243.60
                    ],
                    [
                        'Ulsan', 380181, 140.7
                    ],
                    [
                        'Jeju', 371282, 102.41
                    ],
                    [
                        'Sejong', 67370, 213.44
                    ],
                    [
                        'Gangwon', 52192, 43.43
                    ],
                    [
                        'Gyeonggi', 38262, 11
                    ]
                ]);
                var options3 = {
                    region: 'KR',
                    //         displayMode: 'markers',
                    //         displayMode: 'markers',
                    displayMode: 'markers',
                    colorAxis: {
                        colors: ['green', 'blue']
                    }
                };
                var chart3 = new google.visualization.GeoChart(document.getElementById('mapchart_div'));
                chart3.draw(data3, options3);
                // -----------------------------------------------------------------
                var data4 = google.visualization.arrayToDataTable([
                    [
                        'City', 'Latitude'
                    ],
                    [
                        'Seoul', 36
                    ],
                    [
                        'Busan', -8
                    ],
                    [
                        'Incheon', 6
                    ],
                    [
                        'Jeju', -24
                    ]
                ]);
                var options4 = {
                    region: 'KR', // Africa
                    colorAxis: {
                        colors: ['#00853f', 'black', '#e31b23']
                    },
                    backgroundColor: '#81d4fa',
                    datalessRegionColor: '#f8bbd0',
                    defaultColor: '#f5f5f5'
                };
                var chart4 = new google.visualization.GeoChart(document.getElementById('geochart-colors'));
                chart4.draw(data4, options4);
                // -----------------------------------------------------------------
                var data5 = new google.visualization.DataTable();
                data5.addColumn('string', 'Task ID');
                data5.addColumn('string', 'Task Name');
                data5.addColumn('date', 'Start Date');
                data5.addColumn('date', 'End Date');
                data5.addColumn('number', 'Duration');
                data5.addColumn('number', 'Percent Complete');
                data5.addColumn('string', 'Dependencies');
                data5.addRows([
                    [
                        'Research',
                        'Find sources',
                        new Date(2015, 0, 1),
                        new Date(2015, 0, 5),
                        null,
                        100,
                        null
                    ],
                    [
                        'Write',
                        'Write paper',
                        null,
                        new Date(2015, 0, 9),
                        daysToMilliseconds(3),
                        25,
                        'Research,Outline'
                    ],
                    [
                        'Cite',
                        'Create bibliography',
                        null,
                        new Date(2015, 0, 7),
                        daysToMilliseconds(1),
                        20,
                        'Research'
                    ],
                    [
                        'Complete',
                        'Hand in paper',
                        null,
                        new Date(2015, 0, 10),
                        daysToMilliseconds(1),
                        0,
                        'Cite,Write'
                    ],
                    [
                        'Outline',
                        'Outline paper',
                        null,
                        new Date(2015, 0, 6),
                        daysToMilliseconds(1),
                        100,
                        'Research'
                    ]
                ]);
                var options5 = {
                    height: 275
                };
                var chart5 = new google.visualization.Gantt(document.getElementById('gant_chart'));
                chart5.draw(data5, options5);
            }
        </script>
    </body>
</html>