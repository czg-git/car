<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function getTime(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	month = month < 10 ? "0" + month : month;
	var day = date.getDate()  < 10 ? "0" + date.getDate() : date.getDate();
	var hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	var min = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	var sec = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
	var time = year + "/" + month + "/" + day + " " + hour + ":" + min + ":" + sec;
	document.getElementById("time").innerText = time;
}
	setInterval(getTime,1000);
	function logout(){
		top.location.href="<%=request.getContextPath()%>/loginout";
	}
</script>
</head>
<body>
<h2>汽车管理系统</h2>
欢迎管理员${loginUser.username}登录
<span id="time"></span>
<input type="button" value="注销" onclick="logout()"/>
</body>
</html>