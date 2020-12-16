<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){	
	$("#btn").click(function(){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/addEmp",
			data:$("#form").serialize(),
			type:"post",
			dataType:"json",
			success:function(res){
				console.log(res);
				if(res){
					alert("添加成功");
					window.location.reload();
				}
				
			}
		   
		});
	});
});
</script>
</head>
<body>
<div align="center">
<form id="form">
姓名：<input type="text" name = "ename" class="ename"/><br>
职业：<input type="text" name = "job" class="job"/><br>
联系方式：<input type="text" name = "phone" class="phone"/><br>
<input type="button" value="添加" id="btn"/><br>
</form>	
</div>
</body>
</html>