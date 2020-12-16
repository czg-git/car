<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.ztree.all.js"></script>
<script type="text/javascript">
	var setting ={
		data:{
			simpleData:{
				enable:true,
				idKey:"id",
				pIdKey:"pid",
				rootPTd:0
			}
		},
		callback: {
			onClick: zTreeOnClick
		} 
	};
	 function zTreeOnClick(event, treeId, treeNode) {
	    $(".curSelectedNode").attr("target","right");
	};

	$.ajax({
		url:"<%=request.getContextPath()%>/menuList",
		dataType:"json",
		
		success:function(res){
			zTreeObj = $.fn.zTree.init($("#tree"), setting, res);
		}
	});
</script>
</head>
<body>
<ul id="tree" class="ztree"></ul>
</body>
</html>