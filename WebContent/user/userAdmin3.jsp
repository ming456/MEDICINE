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
					<option value="sno">订单号</option>
					<option value="mno">药名</option>
					<option value="count">数量</option>
					<option value="mname">商品</option>
					<option value="unitprice">单价</option>
					<option value="money">金额</option>
					<option value="cno">顾客编号</option>
					<option value="stime">销售时间</option>
				</select> 关键字：<input type="text" name="value" id="keyword" value="" /> <input
					type="submit" id="find" value="查询" />

			</div>
		</form>
		<table border="1">
			<tr>
				<th class="back">
				<th>订单号</th>
				<th>药名</th>
				<th>数量</th>
				<th>商品</th>
				<th>单价</th>
				<th>金额</th>
				<th>顾客编号</th>
				<th>经办人编号</th>
				<th>销售时间</th>
			</tr>
			<%
				StringBuffer sb = (StringBuffer) session.getAttribute("search");
				out.print(sb.toString());
			%>
		</table>
		<center>
			<p align="center">
				<a href="../printing/Print3.jsp" target="main">打印链接</a>
			</p>
		</center>
	</div>

</body>
</html>
