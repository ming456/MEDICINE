<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>药品信息添加</title>
<link rel="stylesheet" href="../css/add.css" />
<script type="text/javascript" src="../js/check1.js"></script>

</head>
<body>
	<form id="userForm" name="user" method="post"
		action="/Test7.2/U?stype=add">
		<table>
			<tr>
				<td>编 号</td>
				<td><input name="mno" type="text" id="txtmno"
					onBlur="return checkForm1()"></input></td>
				<td><span id="tips_mno">*编号由1-6个数字组成</span></td>
			</tr>
			<tr>
				<td>药 名</td>
				<td><input name="mname" type="text" id="txtmname"
					onBlur="return checkForm1()"></input></td>
				<td><span id="tips_mname">*药名由2-10位字符组成</span></td>
			</tr>
			<tr>
				<td>服用方法</td>
				<td><input name="mmode" type="radio" value="内服"
					onClick="return checkmmode()" />内服 <input name="mmode" type="radio"
					value="外用" onClick="return checkmmode()" />外用</td>
				<td><span id="tips_mmode">* 请选择服用方法</span></td>
			</tr>
			<tr>
				<td>功效</td>
				<td><textarea name="mefficacy" cols="40" rows="5" id="txtmefficacy"
						onBlur="return checkForm1()"></textarea></td>
				<td><span id="tips_mefficacy">* 限100字以内</span></td>
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