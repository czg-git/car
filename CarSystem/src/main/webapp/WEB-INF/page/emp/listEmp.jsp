<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
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
				url:"<%=request.getContextPath()%>/deleteEmp",
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
		location.href="<%=request.getContextPath()%>/toUpdateEmp?id="+id;
	});
	var last=${epage.isLastPage}
	var first=${epage.isFirstPage}
	if(last){
		$("#next").attr("disabled","disabled");
	};
	if(first){
		$("#pre").attr("disabled","disabled");
	}
});
function page(p){
	var ename=$("#ename").val();
	var job=$("#job").val();
	var phone=$("#phone").val();
	location.href = "<%=request.getContextPath()%>/PageEmp?scurrentPage="+p+"&ename="+ename+"&job="+job+"&phone="+phone;
}

function resetBtn(){
	$("#ename").val("");
	$("#job").val("");
	$("#phone").val("");
	}
</script>
</head>
<body>
<div align="center">
	<table>
	<tr>
	<form action="<%=request.getContextPath()%>/PageEmp" method="post">
		<tr>
			<td colspan="15"><input type="text" placeholder="通过员工名查询" name="ename" id="ename" value="${ename}"/>
				<input type="text" placeholder="通过职业查询" name="job" id="job"value="${job}"/> 
				<input type="text" placeholder="通过联系方式查询" name="phone" id="phone"value="${phone}"/> 
			</td>
			<td rowspan="2"><input type="submit" value="查询" id="btn" style="background-color:#008CBA;border-radius: 4px "/></td>
			<td rowspan="2"><input type="button" value="清空" id="res" onclick="resetBtn()"style="background-color:#008CBA;border-radius: 4px "/></td>
		</tr>
		</form>
	</tr>
			<tr><td>
				<input type="checkbox" id="ck"/>
			 	</td>
				<td>编号</td>
				<td>姓名</td>
				<td>职业</td>
				<td>联系方式</td>
				
			</tr>
			<c:forEach items="${elist}" var="e">
				<tr>
					<td>
					<input type="checkbox" class="cks" value="${e.eid}"/>
				 	</td>
					<td>${e.eid}</td>
					<td>${e.ename}</td>
					<td>${e.job}</td>
					<td>${e.phone}</td>
					<td>
					<input type="hidden" value="${e.eid }" class="h" />
					<input type="button" value="修改" class="update"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="10" rowspan="2">
				<input type ="button" value="全选" id="qx"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="全不选" id="qbx"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="反选" id="fx"style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="批量删除" id="plsc"style="background-color:#008CBA;border-radius: 4px "/>
				</td>
			</tr>
			<tr style="display: inline-block; margin-left: 20px">
			    <td colspan="10">
				<input type ="button" value="首页" onclick="page(1)" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="上一页" onclick="page(${epage.prePage})" id="pre" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="下一页" onclick="page(${epage.nextPage})" id="next" style="background-color:#008CBA;border-radius: 4px "/>
				<input type ="button" value="尾页" onclick="page(${epage.pages})" style="background-color:#008CBA;border-radius: 4px "/>
				</td>
			</tr>
		</table>
		</div>
</body>
</html>