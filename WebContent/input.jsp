<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理人员登录</title>
</head>
<body>
<center>
<form action="/Test7.2/U?stype=login" method="post" name="form1">
<table>
<tr>
<td>姓名：</td>
<td><input type="text" name="username" /></td>
</tr>
<td>密码：</td>
<td>
<input type="password" name="password" />
</td>
<tr>
	<td><input type="submit" name="sumbit" value="登录"/></td>
	<td><input type="reset" name="reset" value="重置"/></td>
</tr>
</table>
</form>
</center>
</body>
</html>