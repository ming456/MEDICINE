<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>经办人查顾客</title>
<link rel="stylesheet" href="../css/admin.css" />
<script src="../js/jquery2.js" type="text/javascript"></script>
<script src="../js/menu1.js" type="text/javascript"></script>
</head>

<body>
	<div>
		<form action="/Test7.2/U?stype=find4" method="post">
			<div id="search">
				查找方式：<select name="column">
					<option value="cno">编号</option>
					<option value="cname">姓名</option>
					<option value="csex">性别</option>
					<option value="cage">年龄</option>
					<option value="caddress">住址</option>
					<option value="cphone">电话</option>
					<option value="csymptom">症状</option>
					<option value="mno">已购药品</option>
					<option value="ano">经办人</option>
					<option value="cdate">录入日期</option>
					<option value="cremark">备注</option>
				</select> 关键字：<input type="text" name="value" id="keyword" value="" /> <input
					type="submit" id="find" value="查询" /> &nbsp;&nbsp; <a
					href="userAdd2.jsp" target="main">添加经办人信息</a>
			</div>
		</form>
		<table border="1">
			<tr>
				<th class="back">
				<th>编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>住址</th>
				<th>电话</th>
				<th>症状</th>
				<th>已购药品</th>
				<th>经办人</th>
				<th>录入日期</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
			<%
				StringBuffer sb = (StringBuffer) session.getAttribute("search");
				out.print(sb.toString());
			%>
		</table>
		<center>
			<p align="center">
				<a href="../printing/Print1.jsp" target="main">打印链接</a>
			</p>
		</center>
	</div>
</body>
</html>
