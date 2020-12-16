<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts-4.7.0.js"></script>
<script type="text/javascript">
$(function(){
	var myChart = echarts.init(document.getElementById('main'));
	var brand = ${brand};
	option = {
			 title: {
			        text: '品牌统计'
			    },
		    xAxis: {
		        type: 'category',
		        data: brand
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: ${countbrand},
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};

myChart.setOption(option);
	});



</script>
</head>
<body>
<div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>