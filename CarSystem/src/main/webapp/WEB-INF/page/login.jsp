<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
      .mdiv{ 
    width:300px;  
    height:200px;  
    position:absolute;  
    left:50%;  
    top:50%;  
    margin:-100px 0 0 -150px;  
 } 
   </style>
</head>
<body>
${usernotfound}
<div align="center"><img style="width: 100%;height: 100%" alt="图片损坏" src="<%=request.getContextPath()%>/image/01.jpg">
<div class="mdiv" align="center">
	<form action="login" method="post" style="margin-top: 60px">
		<table>
			<tr>
				<td>账号:</td>
				<td><input type="text" name="username" style=" margin-left: 20px"/></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password" style=" margin-left: 20px"/></td>
			</tr>
			<tr>
				<td colspan="1"></td>
				<td><input type="submit" value="登录" style="margin-left: 80px"/></td>
			</tr>
		</table>
	</form>
</div>
</div>
</body>
</html>