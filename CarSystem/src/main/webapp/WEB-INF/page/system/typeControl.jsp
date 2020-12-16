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
	$.ajax({
		url:"<%=request.getContextPath()%>/typeController",
		dataType:"json",
		success:function (obj){

	var myChart = echarts.init(document.getElementById('main'));
	option = {
			 title: {
			        text: '类型统计'
			    },
		    xAxis: {
		        type: 'category',
		        data: ['MPV', 'SUV', '皮卡', '轿车']
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: obj,
		        type: 'bar',
		        showBackground: true,
		        backgroundStyle: {
		            color: 'rgba(220, 220, 220, 0.8)'
		        }
		    }]
		};

myChart.setOption(option);
		}
	});

});

</script>
</head>
<body>
<div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>