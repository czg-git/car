<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
var id = ${partsid};
console.log(id);
$(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/listEmp",
		data:{},
		type:"post",
		async: false,
		dataType:"json",
		success:function(obj){
			for(var i in obj){
				$("#eid").append("<option value ="+obj[i].eid+" >"+obj[i].ename+"</option>");
			}
		}
	});
		
	$.ajax({
		url:"<%=request.getContextPath()%>/queryByPid",
		data:{id:id},
		type:"post",
		dataType:"json",
		success:function(res){
			console.log(res);
			$(".pname").val(res.pname);
			$(".inprice").val(res.inprice);
			$(".outprice").val(res.outprice);
			$(".dealers").val(res.dealers);
			$(".phone").val(res.phone);
			$(".indate").val(res.indate);
			$(".num").val(res.num);
			$(".type").val(res.type);
			$(".note").val(res.note);
			$("#eid").val(res.eid);
		}
	});
	$("#btn").click(function(){
		var pid = ${partsid};
		var pname = $(".pname").val();
		var inprice = $(".inprice").val();
		var outprice = $(".outprice").val();
		var dealers = $(".dealers").val();
		var phone = $(".phone").val();
		var indate = $(".indate").val();
		var num = $(".num").val();
		var type = $(".type").val();
		var note = $(".note").val();
		var eid = $("#eid").val();
		 $.ajax({
			url:"<%=request.getContextPath()%>/updateParts",
			//$("#form").serialize()
			data:{pid:pid,pname:pname,inprice:inprice,outprice:outprice,dealers:dealers,phone:phone,indate:indate,num:num,type:type,note:note,eid:eid},
			type:"post",
			dataType:"json",
			success:function(obj){
				console.log(obj);
			if(obj){
				location.href ="<%=request.getContextPath()%>/PageParts";
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
<input type="button" value="修改" id="btn"/><br>
</form>
</div>
</body>
</html>