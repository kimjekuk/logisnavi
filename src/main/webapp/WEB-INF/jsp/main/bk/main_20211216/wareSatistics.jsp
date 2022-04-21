<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>

<head>
    <title>IamLogis Warehouse Information Center</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

	<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
	<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
	
	<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>	
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
	<script src="js/logisnavi.js"></script>    
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    
	<script>
	</script>
	<style>	
		table, th, td {
		  border: 1px solid grey;
		  border-collapse: collapse;
		}
		th, td {
		  text-align: center;
		}
	</style>	
	
</head>



<body>
 
 <a href="index.html">Home</a><br><br>
 <hr>
   *********** 물류창고 통계조회 *********** 
 <hr>
	
<br>	
    <div id="chart_div" style="width: 900px; height: 500px;"></div>
	<div id="myChart" style="width:100%; max-width:600px; height:500px;"></div>   
    <div id="mapchart_div" style="width: 900px; height: 500px;"></div>
    <div id="geochart-colors" style="width: 900px; height: 500px;"></div>
    
<script>
google.charts.load('current', {'packages':['corechart', 'geochart'], 'mapsApiKey': 'AIzaSyAHLWrmRb2zN6UfEbyhf8X5bTFRu9FQ75w'});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	//-----------------------------------------------------------------	  
	var data1 = google.visualization.arrayToDataTable([
	  ['Contry', 'Mhl'],
	  ['Italy',54.8],
	  ['France',48.6],
	  ['Spain',44.4],
	  ['USA',23.9],
	  ['Argentina',14.5]
	]);
	
	var options1 = {
	  title:'World Wide Wine Production',
	  is3D:true
	};
	
	var chart1 = new google.visualization.PieChart(document.getElementById('myChart'));
	  chart1.draw(data1, options1);

	//-----------------------------------------------------------------	  

     // Some raw data (not necessarily accurate)
     var data2 = google.visualization.arrayToDataTable([
       ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
       ['2004/05',  165,      938,         522,             998,           450,      614.6],
       ['2005/06',  135,      1120,        599,             1268,          288,      682],
       ['2006/07',  157,      1167,        587,             807,           397,      623],
       ['2007/08',  139,      1110,        615,             968,           215,      609.4],
       ['2008/09',  136,      691,         629,             1026,          366,      569.6]
     ]);	  

     var options2 = {
             title : 'Monthly Coffee Production by Country',
             vAxis: {title: 'Cups'},
             hAxis: {title: 'Month'},
             seriesType: 'bars',
             series: {5: {type: 'line'}}
           };

     var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div'));
     chart2.draw(data2, options2);	 	  
     
     
 	//-----------------------------------------------------------------	  

     // Some raw data (not necessarily accurate)
     var data2 = google.visualization.arrayToDataTable([
       ['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
       ['2004/05',  165,      938,         522,             998,           450,      614.6],
       ['2005/06',  135,      1120,        599,             1268,          288,      682],
       ['2006/07',  157,      1167,        587,             807,           397,      623],
       ['2007/08',  139,      1110,        615,             968,           215,      609.4],
       ['2008/09',  136,      691,         629,             1026,          366,      569.6]
     ]);	  

     var options2 = {
             title : 'Monthly Coffee Production by Country',
             vAxis: {title: 'Cups'},
             hAxis: {title: 'Month'},
             seriesType: 'bars',
             series: {5: {type: 'line'}}
           };

     var chart2 = new google.visualization.ComboChart(document.getElementById('chart_div'));
     chart2.draw(data2, options2);
     
  	//-----------------------------------------------------------------	  
     var data3 = google.visualization.arrayToDataTable([
         ['City',   'Population', 'Area'],
         ['Seoul',      2761477,    1285.31],
         ['Busan',     1324110,    181.76],
         ['Daegu',    959574,     117.27],
         ['Daejeon',     907563,     130.17],
         ['Gwangju',   655875,     158.9],
         ['Incheon',     607906,     243.60],
         ['Ulsan',   380181,     140.7],
         ['Jeju',  371282,     102.41],
         ['Sejong', 67370,      213.44],
         ['Gangwon',     52192,      43.43],
         ['Gyeonggi',  38262,      11]
       ]);

       var options3 = {
         region: 'KR',
//         displayMode: 'markers',
//         displayMode: 'markers',
         displayMode: 'markers',
         colorAxis: {colors: ['green', 'blue']}
       };

       var chart3 = new google.visualization.GeoChart(document.getElementById('mapchart_div'));
       chart3.draw(data3, options3);
       
     	//-----------------------------------------------------------------	  
       var data4 = google.visualization.arrayToDataTable([
           ['City',   'Latitude'],
           ['Seoul', 36], ['Busan', -8], ['Incheon', 6], ['Jeju', -24]
         ]);

       var options4 = {
    	          region: 'KR', // Africa
    	          colorAxis: {colors: ['#00853f', 'black', '#e31b23']},
    	          backgroundColor: '#81d4fa',
    	          datalessRegionColor: '#f8bbd0',
    	          defaultColor: '#f5f5f5',
    	        };

       var chart4 = new google.visualization.GeoChart(document.getElementById('geochart-colors'));
       chart4.draw(data4, options4);     
	  
}
</script>
	
</body>
</html>