<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>顾客或者销售员查药</title>
<link rel="stylesheet" href="../css/admin.css" />
<script src="../js/jquery2.js" type="text/javascript"></script>
<script src="../js/menu1.js" type="text/javascript"></script>
</head>

<body>
	<div>
		<form action="/Test7.2/U?stype=find" method="post">
			<div id="search">
				查找方式：<select name="column">
					<option value="mno">编号</option>
					<option value="mname">名称</option>
					<option value="mmode">服用方法</option>
					<option value="mefficacy">功效</option>
				</select> 关键字：<input type="text" name="value" id="keyword" value="" /> <input
					type="submit" id="find" value="查询" />
			</div>
		</form>
		<table border="1">
			<tr>
				<th class="back">
				<th>编号</th>
				<th>名称</th>
				<th>服用方法</th>
				<th>功 效</th>
				<th>操作</th>
			</tr>
			<%
				StringBuffer sb = (StringBuffer) session.getAttribute("search");
				out.print(sb.toString());
			%>
		</table>
		<center>
			<p align="center">
				<a href="../printing/Print.jsp" target="main">打印链接</a>
			</p>
		</center>
	</div>
</body>
</html>
