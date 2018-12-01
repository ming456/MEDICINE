<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="henu.utils.DbcpPool,java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>经办人信息修改</title>
<link rel="stylesheet" href="../css/add.css" />
<script type="text/javascript" src="../js/check2.js"></script>

</head>
<%
//获取查询字符串中参数name的值
String aname=new String(request.getParameter("name").getBytes("ISO-8859-1"));
//定义SQL语句
String sql = "SELECT * FROM agency WHERE aname='" + aname + "'";
ResultSet rs = DbcpPool.executeQuery(sql);
String ano = "", asex = "",aphone="",aremark="";
while (rs.next()) {
	ano = rs.getString("ano");
	asex = rs.getString("asex");
	aremark=rs.getString("aremark");
}
DbcpPool.close();
%>


<body>
	<form id="userForm" name="user" method="post"
		action="/Test7.2/U?stype=update2">
		<table>
			<tr>
				<td>编 号</td>
				<td><input name="ano" type="text" id="txtano"
					onBlur="return checkForm2()" value="<%=ano%>"></input></td>
				<td><span id="tips_ano">*编号由1-6个数字组成</span></td>
			</tr>
			<tr>
				<td>姓 名</td>
				<td><input name="aname" type="text" id="txtaname"
					onBlur="return checkForm2()" value="<%=aname%>"></input></td>
				<td><span id="tips_aname">*姓名由2-4位字符组成</span></td>
			</tr>
			<tr>
				<td>性&nbps;&nbps;别</td>
				<td><input name="asex" type="radio" value="男"
					onClick="return checkasex()" />男<input name="asex" type="radio"
					value="女" onClick="return checkasex()" />女</td>
				<td><span id="tips_asex">*请选择性别</span></td>
			</tr>
			<tr>
				<td>电 话</td>
				<td><input name="aphone" type="text" id="txtaphone"
					onBlur="return checkForm2()" value="<%=aphone%>"></input></td>
				<td><span id="tips_aphone">*请输入手机号码</span></td>
			</tr>
			<tr>
				<td>备 注</td>
				<td><textarea name="aremark" cols="40" rows="5" id="txtaremark"
						onBlur="return checkForm2()" value="<%=aremark%>"></textarea></td>
				<td><span id="tips_aremark">* 限100字以内</span></td>
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