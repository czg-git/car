<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
var id = ${empid};
console.log(id);
$(function(){
		
	$.ajax({
		url:"<%=request.getContextPath()%>/queryByEid",
		data:{id:id},
		type:"post",
		dataType:"json",
		success:function(res){
			console.log(res);
			$(".ename").val(res.ename);
			$(".job").val(res.job);
			$(".phone").val(res.phone);
		}
	});
	$("#btn").click(function(){
		var eid = ${empid};
		var ename = $(".ename").val();
		var job = $(".job").val();
		var phone = $(".phone").val();
		 $.ajax({
			url:"<%=request.getContextPath()%>/updateEmp",
			//$("#form").serialize()
			data:{eid:eid,ename:ename,job:job,phone:phone},
			type:"post",
			dataType:"json",
			success:function(obj){
				console.log(obj);
			if(obj){
				location.href ="<%=request.getContextPath()%>/PageEmp";
			}else{
				alert("修改失败");
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
<input type="button" value="修改" id="btn"/><br>
</form>
</div>
</body>
</html>