<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
			#btn {
				width: 900px;
				height : 35px;
				background-color: #008CBA; /* BLUE */
			    border: none;
			    color: white;
			    padding: 5px 32px;
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size: 16px;
			}
		</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
var id = ${carid};
console.log(id);
$(function (){
	$.ajax({
		url:"<%=request.getContextPath()%>/listParts",
		dataType:"json",
		async: false,
		success:function (obj){
			for(var i in obj){
				$("#pid").append("<option value="+obj[i].pid+" class="+obj[i].pid+">"+obj[i].pname+"</option>");
				$("#pid").after("<input type='hidden' class="+obj[i].pid+" value="+obj[i].outprice+">");
			}
		}
	});
	//零件费
	$("#pid").change(function (){
		var timemoney = $("[name=timemoney]").val();
		timemoney = timemoney == '' ? 0 : timemoney;
		timemoney = Number(timemoney);
		var pid = $(this).val();
		var partmoney = $("[class="+pid+"]").last().val();
		partmoney = Number(partmoney);
		$("#allmoney").text(timemoney+partmoney);
		$("[name=allmoney]").val(timemoney+partmoney);
		$("[name=partmoney]").val(partmoney);
	});
	
	$("[name=timemoney]").change(function (){
		var timemoney = $("[name=timemoney]").val();
		timemoney = Number(timemoney);
		var pid = $("#pid").val();
		var partmoney = $("[class="+pid+"]").last().val();
		partmoney = Number(partmoney);
		$("#allmoney").text(timemoney+partmoney);
		$("[name=allmoney]").val(timemoney+partmoney);
	});
	
	//回显数据
	$.ajax({
		url:"<%=request.getContextPath()%>/queryById",
		data:{id:id},
		type:"post",
		dataType:"json",
		success:function(res){
			console.log(res);
			$(".carbrand").val(res.carbrand);
			$(".card").val(res.card);
			$(".km").val(res.km);
			$(".name").val(res.name);
			$(".phone").val(res.phone);
			$(".note").val(res.note);
			$("#pid").val(res.pid);
			$("#type").val(res.type);
			$(".timemoney").val(res.timemoney);
			$(".allmoney").val(res.allmoney);
			$(".paystatus[value="+res.paystatus+"]").prop("checked",true);
		}
	});
	
	 //修改
	$("#btn").click(function(){
		var form = new FormData(document.getElementById("form"));
		 $.ajax({
			url:"<%=request.getContextPath()%>/updateCar",
			//$("#form").serialize()
			data:form,
			type:"post",
			dataType:"json",
			processData:false,
            contentType:false,
			success:function(obj){
				console.log(obj);
			if(obj){
				location.href ="<%=request.getContextPath()%>/list";
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
<form id="form">
<table>
				<tr style="display: inline-block;">
					<td>
					<input type="hidden" value="${carid }" name ="id" class="id" />
					</td>
				
					<td>
						<input type="file" name="image" class="image"><br>
					</td>
					<td>
						<input type="text" placeholder="车辆型号" name="carbrand" class="carbrand"/>
					</td>
					<td>
						<input type="text" placeholder="车牌号" name="card" class="card"/>
					</td>
					<td>
						<input type="text" placeholder="公里数" name="km" class="km"/>
					</td>
					<td>
						<input type="text" placeholder="车主姓名" name="name" class="name"/>
					</td>
					<td>
						<input type="text" placeholder="联系方式" name="phone" class="phone"/>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<textarea placeholder="备注信息" name="note" rows="20" cols="125" class="note"></textarea>
					</td>
				</tr>
				<tr style="display: inline-block;">
					<td>
					零件号:
						<select name="pid" id ="pid">
						</select>
					</td>
					<td>
					类型:
						<select name="type" id ="type">
							<option>---请选择类型---</option>
							<option>摩托车</option>
							<option>轿车</option>
							<option>SUV</option>
							<option>皮卡</option>
							<option>MPV</option>
						</select>
					</td>
					<td>
						工时费:<input type="text" placeholder="工时费"  name="timemoney"class="timemoney"/>
					</td>
					<td>
						总费用:<input type="text" placeholder="总费用"  name="allmoney"class="allmoney"/>
					</td>
					<td colspan="2" align="right">
						是否付款 : 
						<input type="radio" value="2" name="paystatus" class="paystatus"/>未付款
						<input type="radio" value="1" name="paystatus" class="paystatus"/>已付款
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input type="button" value="修改" id="btn"/>
					</td>
				</tr>
			</table>			
</form>	
</body>
</html>