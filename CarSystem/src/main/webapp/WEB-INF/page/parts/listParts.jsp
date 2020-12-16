<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				url:"<%=request.getContextPath()%>/deleteParts",
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
		location.href="<%=request.getContextPath()%>/toUpdateParts?id="+id;
	});
	var last=${cpage.isLastPage}
	var first=${cpage.isFirstPage}
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
	var pname=$("#pname").val();
	var inprice=$("#inprice").val();
	var outprice=$("#outprice").val();
	var dealers=$("#dealers").val();
	var phone=$("#phone").val();
	var indate=$("#indate").val();
	var num=$("#num").val();
	location.href = "<%=request.getContextPath()%>/PageParts?scurrentPage="+p+"&pname="+pname+"&inprice="+inprice+"&outprice="+outprice+"&dealers="+dealers+"&phone="+phone+"&indate="+indate+"&num="+num;
}
function resetBtn(){
	$("#pname").val("");
	$("#inprice").val("");
	$("#outprice").val("");
	$("#dealers").val("");
	$("#phone").val("");
	$("#indate").val("");
	$("#num").val("0");
	}
</script>
</head>
<div align="center">
<body>
	<table>
	<form action="<%=request.getContextPath()%>/PageParts" method="post">
		<tr>
			<td colspan="15"><input type="text" placeholder="通过零件名查询" name="pname" id="pname" value="${pname}"/>
				<input type="text" placeholder="通过进口价查询" name="inprice" id="inprice"value="${inprice}"/> 
				<input type="text" placeholder="通过出口价查询" name="outprice" id="outprice"value="${outprice}"/> 
				<input type="text" placeholder="通过供货商查询" name="dealers" id="dealers"value="${dealers}"/> 
			<td rowspan="2"><input type="submit" value="查询" id="btn" style="background-color:#008CBA;border-radius: 4px "/></td>
			<td rowspan="2"><input type="button" value="清空" id="res" onclick="resetBtn()"style="background-color:#008CBA;border-radius: 4px "/></td>
		</tr>
		<tr>
			<td colspan="15">
				 <input type="text" placeholder="通过联系方式查询" name="phone" id="phone"value="${phone}"/> 
				 <input type="date" name="indate"style="width: 172px; height: 17px" id="indate"value="${indate}"/> 
				 <input type="text" placeholder="通过数量查询" name="num" id="num"value="${num}"/>  
				 </td>
		</tr>
		</form>
			<tr><td>
				<input type="checkbox" id="ck"/>
			 	</td>
				<td>编号</td>
				<td>零件名</td>
				<td>进口价</td>
				<td>出口价</td>
				<td>交易商</td>
				<td>联系方式</td>
				<td>进口时间</td>
				<td>数量</td>
				<td>备注</td>
				<td>员工</td>
			</tr>
			<c:forEach items="${plist}" var="p">
				<tr>
					<td>
					<input type="checkbox" class="cks" value="${p.pid}"/>
				 	</td>
					<td>${p.pid}</td>
					<td>${p.pname}</td>
					<td>${p.inprice}</td>
					<td>${p.outprice}</td>
					<td>${p.dealers}</td>
					<td>${p.phone}</td>
					<td>${p.indate}</td> 
					<td>${p.num}</td>
					<td>${p.note}</td>
					<td>${p.emp.ename}</td>
					<td>
					<input type="hidden" value="${p.pid }" class="h" />
					<input type="button" value="修改" class="update"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10">
				<input type ="button" value="全选" id="qx"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="全不选" id="qbx"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="反选" id="fx"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="批量删除" id="plsc"style="background-color:#008CBA;border-radius: 4px "/>
				</td>
			</tr>
			<tr>
			    <td colspan="10">
				<input type ="button" value="首页" onclick="page(1)" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="上一页" onclick="page(${cpage.prePage})" id="pre" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="下一页" onclick="page(${cpage.nextPage})" id="next" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="尾页" onclick="page(${cpage.pages})" style="background-color:#008CBA;border-radius: 4px "/>
				</td>
			</tr>
		</table>
		</div>
</body>
</html>