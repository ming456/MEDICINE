<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>入库员查经办人</title>
<link rel="stylesheet" href="../css/admin.css" />
<script src="../js/jquery2.js" type="text/javascript"></script>
<script src="../js/menu1.js" type="text/javascript"></script>
</head>

<body>
	<div>
		<form action="/Test7.2/U?stype=find1" method="post">
			<div id="search">
				查找方式：<select name="column">
					<option value="ano">编号</option>
					<option value="aname">姓名</option>
					<option value="asex">性别</option>
					<option value="aphone">电话</option>
					<option value="aremark">备注</option>
				</select> 关键字：<input type="text" name="value" id="keyword" value="" /> <input
					type="submit" id="find" value="查询" />

			</div>
		</form>
		<table border="1">
			<tr>
				<th class="back">
				<th>编号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>电话</th>
				<th>备注</th>
			</tr>
			<%
				StringBuffer sb = (StringBuffer) session.getAttribute("search");
				out.print(sb.toString());
			%>
		</table>
		<center>
			<p align="center">
				<a href="../printing/Print2.jsp" target="main">打印链接</a>
			</p>
		</center>
	</div>

</body>
</html>
