<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<link rel="stylesheet" href="../css/add.css" />
<script type="text/javascript" src="../js/check1.js"></script>

</head>
<body>
	<form id="userForm" name="user" method="post"
		action="/Test7.2/U?stype=add4">
		<table>
			<tr>
				<td>原&nbsp;密&nbsp;码</td>
				<td>
				<input type="password" name="passworded"/>
				</td>
				<td><span id="tips_mmode">* 请填入原密码</span></td>
			</tr>
			<tr>
				<td>新&nbsp;密&nbsp;码</td>
				<td>
				<input type="password" name="password"/>
				</td>
				<td><span id="tips_mmode">* 请填入新密码</span></td>
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