<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>用户信息添加</title>
<link rel="stylesheet" href="../css/add.css" />
<script type="text/javascript" src="../js/check1.js"></script>

</head>
<body>
	<form id="userForm" name="user" method="post"
		action="/Test7.2/U?stype=add3">
		<table>
		    <tr>
				<td>编号</td>
				<td><input name="uno" type="text" id="txtmname"
					onBlur="return checkForm1()"></input></td>
				<td><span id="tips_uno">*请输入编号</span></td>
			</tr>
			<tr>
				<td>用 户 名</td>
				<td><input name="username" type="text" id="txtmname"
					onBlur="return checkForm1()"></input></td>
				<td><span id="tips_mname">*用户名名由2-10位字符组成</span></td>
			</tr>
			<tr>
				<td>密&nbsp;码</td>
				<td>
				<input type="password" name="password"/>
				</td>
				<td><span id="tips_mmode">* 请填入密码</span></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="submit" value="提交" /> <input type="reset" name="reset"
					value="重置" /></td>
			</tr>
		</table>
	</form>
</body>
</html>