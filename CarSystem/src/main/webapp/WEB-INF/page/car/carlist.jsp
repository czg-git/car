<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
	$("#qx").click(function(){
		$(".cks").prop("checked",true);
	});
	$("#qbx").click(function(){
		$(".cks").prop("checked",false);
	});
	$("#fx").click(function(){
		$(".cks").each(function(){
			$(this).prop("checked",!$(this).prop("checked"));
		});
	
	});
	
	$("#plsc").click(function(){
		
		 var ids=$(".cks:checked").map(function(){return $(this).val();}).get().join();
		 console.log(ids);
		   $.ajax({
				url:"<%=request.getContextPath()%>/deleteCar",
				data:{ids:ids},
				type:"post",
				dataType:"json",
				success:function(res){
					if(res){
						alert("删除成功");
						window.location.reload();
					}
				}
			}); 
	});
	$(".update").click(function(){
		var id = $(this).prev().val();
		console.log(id);
		location.href="<%=request.getContextPath()%>/toUpdateCar?id="+id;
	});
	var last=${page.isLastPage}
	var first=${page.isFirstPage}
	if(last){
		$("#next").attr("disabled","disabled");
	};
	if(first){
		$("#pre").attr("disabled","disabled");
	}
	$(".paystatus[value=${paystatus }]").prop("checked",true);
	$("#type [value=${type }]").prop("selected",true);
	
});
function page(p){
	var carbrand=$("#carbrand").val();
	var card=$("#card").val();
	var name=$("#name").val();
	var type=$("#type").val();
	var startdate=$("#startdate").val();
	var enddate=$("#enddate").val();
	var phone=$("#phone").val();
	if($(".paystatus:checked").val()==1||$(".paystatus:checked").val()==2){
		var paystatus =$(".paystatus:checked").val();
	}else{
		var paystatus =0;
	}
	location.href = "<%=request.getContextPath()%>/list?scurrentPage="+p+"&carbrand="+carbrand+"&card="+card+"&name="+name+"&type="+type+"&startdate="+startdate+"&enddate="+enddate+"&phone="+phone+"&paystatus="+paystatus;
}
//清空
function resetBtn(){
$("#carbrand").val("");
$("#card").val("");
$("#name").val("");
$("#type").val("");
$("#startdate").val("");
$("#enddate").val("");
$("#phone").val("");
$(".paystatus").prop("checked",false);
}
</script>
</head>
<body>
<div align="center">
	<table>
	<form action="<%=request.getContextPath()%>/list" method="post">
		<tr>
			<td colspan="15"><input type="text" placeholder="通过车辆型号查询" name="carbrand" id="carbrand" value="${carbrand}"/>
				<input type="text" placeholder="通过车牌号查询" name="card" id="card"value="${card}"/> 
				<input type="text" placeholder="通过车主姓名查询" name="name" id="name"value="${name}"/> 
				<select name="type" style="width: 177px; height: 21px"id="type">
					<option value="">---请选择车辆类型---</option>
					<option value="摩托车">摩托车</option>
					<option value="轿车">轿车</option>
					<option value="SUV">SUV</option>
					<option value="皮卡">皮卡</option>
					<option value="MPV">MPV</option>
			</select></td>
			<td rowspan="2"><input type="submit" value="查询" id="btn" style="background-color:#008CBA;border-radius: 4px "/></td>
			<td rowspan="2"><input type="button" value="清空" id="res" onclick="resetBtn()"style="background-color:#008CBA;border-radius: 4px "/></td>
		</tr>
		<tr>
			<td colspan="15">
				 <input type="date" name="startdate"style="width: 172px; height: 17px" id="startdate"value="${startdate}"/> 
				 <input type="date"name="enddate" style="width: 172px; height: 17px" id="enddate"value="${enddate}"/>
				 <input type="text" placeholder="通过联系方式查询" name="phone" id="phone"value="${phone}"/> 
				 <input type="radio" value="1"  name="paystatus"class="paystatus"/>已付款  
				 <input type="radio" value="2"  name="paystatus"class="paystatus"/>未付款 
				 </td>
		</tr>
		</form>
		<tr><td>
				<input type="checkbox" id="ck"/>
			 	</td>
			 	<td>图片</td>
				<td>编号</td>
				<td>车型</td>
				<td>类型</td>
				<td>车牌号</td>
				<td>公里数</td>
				<td>配件</td>
				<td>工时费</td>
				<td>零件费</td>
				<td>总费用</td>
				<td>维修时间</td>
				<td>车主名</td>
				<td>车主联系方式</td>
				<td>付款方式</td>
				<td>备注</td>
			</tr>
			<c:forEach items="${clist}" var="c">
				<tr>
					<td>
					<input type="checkbox" class="cks" value="${c.id}"/>
				 	</td>
				 	<td><img style ="width: 50px;height: 50px"alt="图片损坏" src="${c.imageUrl}"/></td>
					<td>${c.id}</td>
					<td>${c.carbrand}</td>
					<td>${c.type}</td>
					<td>${c.card}</td>
					<td>${c.km}</td>
					<td>${c.parts.pname}</td> 
					<td>${c.timemoney}</td>
					<td>${c.partmoney}</td>
					<td>${c.allmoney}</td>
					<td>${c.date}</td>
					<td>${c.name}</td> 
					<td>${c.phone}</td>
					<td>
					${c.paystatus}
					</td>
					<td>${c.note}</td>
					<td>
					<input type="hidden" value="${c.id }" class="h" />
					<input type="button" value="修改" class="update"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10" rowspan="5">
				<input type ="button" value="全选" id="qx" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="全不选" id="qbx" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="反选" id="fx" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="批量删除" id="plsc" style="background-color:#008CBA;border-radius: 4px "/>
				</td>
			</tr>
			<tr>
			    <td colspan="10"rowspan="5">
				<input type ="button" value="首页" onclick="page(1)" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="上一页" onclick="page(${page.prePage})" id="pre"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="下一页" onclick="page(${page.nextPage})" id="next" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="尾页" onclick="page(${page.pages})" style="background-color:#008CBA;border-radius: 4px "/>
				</td>
			</tr>
		</table>
		</div>
</body>
</html>
