<%@ page language="java" pageEncoding="UTF-8"
	import="java.sql.*,henu.utils.*"%>
<%@ page contentType="application/msexcel"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>outAgency</title>
<%
	response.setHeader("Content-disposition",
			"attachment; filename=test.xls");
%>
<%
	Class.forName("com.mysql.jdbc.Driver"); //加载JDBC驱动
	String URL = "jdbc:mysql://localhost:3306/medidb";
	String USER = "root";
	String PASSWORD = "0823112013";
	Connection conn = DriverManager.getConnection(URL, USER, PASSWORD); //数据库连接对象
	Statement stmt = conn.createStatement(); //SQL语句对象
	String sql = "select * from client"; //创建SQL语句
	ResultSet rs = stmt.executeQuery(sql); //执行SQL语句并取得结果集
%>
</head>
<body>
	<table align="left" border="2">
	<col width=72 span=2 style='width:54pt'>
    <caption>顾客</caption>
		<thead>
			<tr>
				<td width="37" height="27" align="center" bgcolor="#efefef">编号</td>
				<td width="37" align="center" bgcolor="#efefef">姓名</td>
				<td width="85" align="center" bgcolor="#efefef">性别</td>
				<td width="85" align="center" bgcolor="#efefef">年龄</td>
				<td width="74" align="center" bgcolor="#efefef">住址</td>
				<td width="80" align="center" bgcolor="#efefef">电话</td>
				<td width="152" align="center" bgcolor="#efefef">症状</td>
				<td width="152" align="center" bgcolor="#efefef">已购药品</td>
				<td width="87" align="center" bgcolor="#efefef">经办人</td>
				<td width="106" align="center" bgcolor="#efefef">录入日期</td>
				<td width="152" align="center" bgcolor="#efefef">备注</td>
			</tr>
		</thead>
		<tbody>

			<%
				//向后依次逐条取出数据
				while (rs.next()) {
			%>
			<tr height=19 style='height: 14.25pt'>
				<td height=19 width=72 style='height: 14.25pt; width: 54pt'><%=rs.getString(1)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(2)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(3)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(4)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(5)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(6)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(7)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(8)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(9)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(10)%></td>
				<td width=72 style='width: 54pt'><%=rs.getString(11)%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>