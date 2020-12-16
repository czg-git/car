<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	</head>
	<frameset rows="15%,*">
		<frame src="<%=request.getContextPath()%>/top" name="top"/>
		<frameset cols="20%,*">
			<frame src="<%=request.getContextPath()%>/left" name="left"/>
			<frame src="<%=request.getContextPath()%>/right" name="right" noresize="noresize"/>
		</frameset>
	</frameset>
	
</html>