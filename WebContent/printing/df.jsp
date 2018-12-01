<%@ page  language="java" pageEncoding="UTF-8" import="java.sql.*,henu.utils.*"%>
<%@ page contentType="application/msexcel" %>
<%
   response.setHeader("Content-disposition","attachment; filename=test.xls");
%>
<%Class.forName("com.mysql.jdbc.Driver");   //加载JDBC驱动
String URL = "jdbc:mysql://localhost:3306/medidb";
String USER="root";
String PASSWORD="0823112013";
Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);   //数据库连接对象
Statement stmt=conn.createStatement();    //SQL语句对象
String sql="select * from medicine";   //创建SQL语句
ResultSet rs=stmt.executeQuery(sql);   //执行SQL语句并取得结果集
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>   
 <head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>outAgency</title>
</head>
<body>
    <table align="left" border="2">
    <col width=72 span=2 style='width:54pt'>
    <caption>药品</caption>
	<thead>
	<tr>
		<td width="37" height="27" align="center" bgcolor="#efefef">编号</td>
        <td width="152" align="center" bgcolor="#efefef">名称</td>
        <td width="106" align="center" bgcolor="#efefef">服用方法</td>
        <td width="85" align="center" bgcolor="#efefef">功效</td>
	</tr>
	</thead>
	<tbody>

	 <% //向后依次逐条取出数据
while(rs.next()) {%>   
 <tr height=19 style='height:14.25pt'>
  <td height=19 width=72 style='height:14.25pt;width:54pt'><%=rs.getString(1)%></td>
  <td width=72 style='width:54pt'><%=rs.getString(2)%></td>
  <td width=72 style='width:54pt' ><%=rs.getString(3)%></td>
  <td width=72 style='width:54pt' ><%=rs.getString(4)%></td>
 </tr>
<%}%>
</tbody>
</table>
</body>
</html>