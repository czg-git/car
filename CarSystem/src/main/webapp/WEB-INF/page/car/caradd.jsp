<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
$(function (){
	$.ajax({
		url:"<%=request.getContextPath()%>/listParts",
		dataType:"json",
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
	
	$("#btn").click(function (){
		var form = new FormData(document.getElementById("form"));
		$.ajax({
			url:"<%=request.getContextPath()%>/addCar",
			type:"post",
			dataType:"json",
			data:form,
			processData:false,
            contentType:false,
			success:function (obj){
				if(obj){
					alert("录入成功");
					location.reload();
				}
			}
		})
	});
});
</script>
</head>
<body>
<form id="form">
<table>
				<tr style="display: inline-block;">
					<td>
						<input type="file" name="image"><br>
					</td>
					<td>
						<input type="text" placeholder="车辆型号" name="carbrand"/>
					</td>
					<td>
						<input type="text" placeholder="车牌号" name="card"/>
					</td>
					<td>
						<input type="text" placeholder="公里数" name="km"/>
					</td>
					<td>
						<input type="text" placeholder="车主姓名" name="name"/>
					</td>
					<td>
						<input type="text" placeholder="联系方式" name="phone"/>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<textarea placeholder="备注信息" name="note" rows="20" cols="125"></textarea>
					</td>
				</tr>
				<tr style="display: inline-block;">
					<td>
						<select name="pid" id="pid">
							<option>---请选择零件---</option>
						</select>
						<select name="type">
							<option>---请选择类型---</option>
							<option>摩托车</option>
							<option>轿车</option>
							<option>SUV</option>
							<option>皮卡</option>
							<option>MPV</option>
						</select>
					</td>
					<td>
						<input type="text" placeholder="工时费"  name="timemoney"/>
					</td>
					<td align="center">
						总费用:<span id="allmoney"></span>元
						<input type="hidden" name="allmoney"/>
						<input type="hidden" name="partmoney"/>
					</td>
					<td colspan="2" align="right">
						是否付款 : 
						<input type="radio" value="2" name="paystatus"/>未付款
						<input type="radio" value="1" name="paystatus"/>已付款
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<input type="button" value="录入" id="btn"/>
					</td>
				</tr>
			</table>			
</form>	
</body>
</html>