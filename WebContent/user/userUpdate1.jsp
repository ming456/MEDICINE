<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="henu.utils.DbcpPool,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顾客信息修改</title>
<link rel="stylesheet" href="../css/add.css" />
<script type="text/javascript" src="../js/check.js"></script>

</head>
<%
	//获取查询字符串中参数name的值
	String cname=new String(request.getParameter("name").getBytes("ISO-8859-1"));
	//定义SQL语句
	String sql = "SELECT * FROM client WHERE cname='" + cname + "'";
	ResultSet rs = DbcpPool.executeQuery(sql);
	String cno = "", csex = "", caddress = "", cphone = "", csymptom = "", mno = "", ano = "", cdate = "", cremark = "";
	int cage = 0;
	while (rs.next()) {
		csex = rs.getString("csex");
		caddress = rs.getString("caddress");
		cphone = rs.getString("cphone");
		csymptom = rs.getString("csymptom");
		mno = rs.getString("mno");
		ano = rs.getString("ano");
		cdate = rs.getString("cdate");
		cremark = rs.getString("cremark");
		cno = rs.getString("cno");
	}
	DbcpPool.close();
%>

<body>
	<form id="userForm" name="user" method="post"
		action="/Test7.2/U?stype=update1">
		<table>
			<tr>
				<td>编 号</td>
				<td><input name="cno" type="text" id="txtcno"
					onBlur="return checkForm()" value="<%=cno%>"></input></td>
				<td><span id="tips_cno">*编号由1-6个数字组成</span></td>
			</tr>
			<tr>
				<td>顾 客 名</td>
				<td><input name="cname" type="text" id="txtUser"
					onBlur="return checkForm()" value="<%=cname%>"></input></td>
				<td><span id="tips_cname">* 顾客名由2-4位字符组成</span></td>
			</tr>
			<tr>
				<td>性&nbsp;&nbsp;别</td>
				<td><input name="csex" type="radio" value="男"
					onClick="return checkcsex()" />男 <input name="csex" type="radio"
					value="女" onClick="return checkcsex()" />女</td>
				<td><span id="tips_csex">* 请选择你的性别</span></td>
			</tr>

			<tr>
				<td>年&nbsp;&nbsp;龄</td>
				<td><input name="cage" type="text" id="txtcage"
					onBlur="return checkForm()" value="<%=cage%>"></input></td>
				<td><span id="tips_cage">* 由1-3位数字组成</span></td>
			</tr>
			<tr>
				<td>住&nbsp;&nbsp;址</td>
				<td><input name="caddress" type="text" id="txtaddress"
					onBlur="return checkForm()" value="<%=caddress%>" /></td>
				<td><span id="tips_address">* 请输入你的住址</span></td>
			</tr>

			<tr>
				<td>电&nbsp;&nbsp;话</td>
				<td><input name="cphone" type="text" id="txtphone"
					onBlur="return checkForm()" value="<%=cphone%>" /></td>
				<td><span id="tips_phone">* 请输入电话号码</span></td>
			</tr>
			<tr>
				<td>经办人</td>
				<td><input name="ano" type="text" id="txtano"
					onBlur="return checkForm()" /></td>
				<td><span id="tips_ano">* 请输入你的药品经办人</span></td>
			</tr>
			<tr>
				<td>症状</td>
				<td><textarea name="csymptom" cols="40" rows="5"
						id="txtcsymptom" onBlur="return checkForm()" value="<%=csymptom%>"></textarea></td>
				<td><span id="tips_csymptom">* 限100字以内</span></td>
			</tr>
			<tr>
				<td>已购药品</td>
				<td><textarea name="mno" cols="40" rows="5" id="txtmno"
						onBlur="return checkForm()" value="<%=mno%>"></textarea></td>
				<td><span id="tips_mno">* 限100字以内</span></td>
			</tr>

			<tr>
				<td>备注</td>
				<td><textarea name="cremark" cols="40" rows="5" id="txtcremark"
						onBlur="return checkForm()" value="<%=cremark%>"></textarea></td>
				<td><span id="tips_cremark">* 限100字以内</span></td>
			</tr>
			<tr>
				<td>录入日期</td>
				<td><input name="cdate" type="date" id="txtdate"
					onBlur="return checkForm()" value="<%=cdate%>" /></td>
				<td><span id="tips_date">* 请选择你的录入日期</span></td>
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