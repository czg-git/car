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
	$.ajax({
		url:"<%=request.getContextPath()%>/listEmp",
		data:{},
		type:"post",
		dataType:"json",
		success:function(obj){
			for(var i in obj){
				$("#eid").append("<option value ="+obj[i].eid+" >"+obj[i].ename+"</option>");
			}
		}
	});
		
	$("#btn").click(function(){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/addParts",
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
零件名：<input type="text" name = "pname" class="pname"/><br>
进口价：<input type="text" name = "inprice" class="inprice"/><br>
出口价：<input type="text" name = "outprice" class="outprice"/><br>
交易商：<input type="text" name = "dealers" class="dealers"/><br>
联系方式：<input type="text" name = "phone" class="phone"/><br>
进口时间：<input type="text" name = "indate" class="indate"/><br>
数量：<input type="text" name = "num" class="num"/><br>
类型：<input type="text" name = "type" class="type"/><br>
备注：<input type="text" name = "note" class="note"/><br>
员工：<select name="eid" id="eid">
</select><br>
<input type="button" value="添加" id="btn"/><br>
</form>
</div>
</body>
</html>