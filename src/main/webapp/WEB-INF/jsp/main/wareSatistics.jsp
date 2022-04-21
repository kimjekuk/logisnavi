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
                                        <div id="spaceyears" style="width: 800px; height: 600px;margin: auto; "></div>
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
            var myChart = echarts.init(document.getElementById('spaceyears'));
            
            var app = {};
            

            var posList = [
              'left',
              'right',
              'top',
              'bottom',
              'inside',
              'insideTop',
              'insideLeft',
              'insideRight',
              'insideBottom',
              'insideTopLeft',
              'insideTopRight',
              'insideBottomLeft',
              'insideBottomRight'
            ];
            
            app.configParameters = {
            		  rotate: {
            		    min: -90,
            		    max: 90
            		  },
            		  align: {
            		    options: {
            		      left: 'left',
            		      center: 'center',
            		      right: 'right'
            		    }
            		  },
            		  verticalAlign: {
            		    options: {
            		      top: 'top',
            		      middle: 'middle',
            		      bottom: 'bottom'
            		    }
            		  },
            		  position: {
            		    options: posList.reduce(function (map, pos) {
            		      map[pos] = pos;
            		      return map;
            		    }, {})
            		  },
            		  distance: {
            		    min: 0,
            		    max: 100
            		  }
            		};
            		app.config = {
            		  rotate: 90,
            		  align: 'left',
            		  verticalAlign: 'middle',
            		  position: 'insideBottom',
            		  distance: 15,
            		  onChange: function () {
            		    const labelOption = {
            		      rotate: app.config.rotate,
            		      align: app.config.align,
            		      verticalAlign: app.config.verticalAlign,
            		      position: app.config.position,
            		      distance: app.config.distance
            		    };
            		    myChart.setOption({
            		      series: [
            		        {
            		          label: labelOption
            		        },
            		        {
            		          label: labelOption
            		        }
            		      ]
            		    });
            		  }
            		};            
            
            var labelOption = {
            		  show: true,
            		  position: app.config.position,
            		  distance: app.config.distance,
            		  align: app.config.align,
            		  verticalAlign: app.config.verticalAlign,
            		  rotate: app.config.rotate,
            		  //formatter: '{c}  {name|{a}}',
            		  fontSize: 12,
            		  rich: {
            		    name: {}
            		  }
            		};            
            
            // 차트 속성과 데이터를 지정합니다.
            var option = {
                    title: {
                        text: '년도별 창고면적 정보(평)'
                    },            		
            		  tooltip: {
            			    trigger: 'axis',
            			    axisPointer: {
            			      type: 'shadow'
            			    }
            			  },
            			  legend: {
            			    data: ['수도권', '비수도권']
            			  },
            			  toolbox: {
            			    show: true,
            			    orient: 'vertical',
            			    left: 'right',
            			    top: 'center',
            			    feature: {
//            			      mark: { show: true },
//            			      dataView: { show: true, readOnly: false },
            			      magicType: { show: true, type: ['line', 'bar', 'stack'] },
//            			      restore: { show: true },
//            			      saveAsImage: { show: true }
            			    }
            			  },
            			  xAxis: [
            			    {
            			      type: 'category',
            			      axisTick: { show: false },
            			      data: [
            			    	  '2010',
            			    	  '2011',
            			    	  '2012',
            			    	  '2013',
            			    	  '2014',
            			    	  '2015',
            			    	  '2016',
            			    	  '2017',
            			    	  '2018',
            			    	  '2019',
            			    	  '2020',
            			    	  '2021'
            			    	  ]
            			    }
            			  ],
            			  yAxis: [
            			    {
            			      type: 'value'
            			    }
            			  ],
            			  series: [
            			    {
            			      name: '수도권',
            			      type: 'line',
            			      barGap: 0,
            			      label: labelOption,
            			      emphasis: {
            			        focus: 'series'
            			      },
            			      data: [
            			    	  424817 
            			    	 ,240585 
            			    	 ,1089057 
            			    	 ,608376 
            			    	 ,794563 
            			    	 ,1191108 
            			    	 ,914675 
            			    	 ,1028595 
            			    	 ,2121283 
            			    	 ,2215577 
            			    	 ,1835588 
            			    	 ,1441994 
									]
            			    },
            			    {
            			      name: '비수도권',
            			      type: 'line',
            			      label: labelOption,
            			      emphasis: {
            			        focus: 'series'
            			      },
            			      data: [
            			    	   576017
            			    	  ,280229
            			    	  ,306044
            			    	  ,293788
            			    	  ,526435
            			    	  ,393233
            			    	  ,333375
            			    	  ,307053
            			    	  ,243346
            			    	  ,422579
            			    	  ,354471
            			    	  ,398641
            			    	  ]
            			    }
            			  ]
            };
            // 위에서 설정한 속성을 차트에 반영합니다.
            myChart.setOption(option);
        </script>
    </body>
</html>