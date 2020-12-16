<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
		url:"<%=request.getContextPath()%>/partsController",
		dataType:"json",
		success:function (obj){
			console.log(obj);
				var myChart = echarts.init(document.getElementById('main'));

option = {
	    title: {
	        text: '配件监控',
	        left: 'center'
	    },
	    tooltip: {
	        trigger: 'item',
	        formatter: '{a} <br/>{b} : {c} ({d}%)'
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data: ['避震器', '发动机', '方向盘', '轮胎', '玻璃']
	    },
	    series: [
	        {
	            name: '访问来源',
	            type: 'pie',
	            radius: '55%',
	            center: ['50%', '60%'],
	            data: obj,
	            emphasis: {
	                itemStyle: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
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