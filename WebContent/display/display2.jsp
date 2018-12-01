<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*,henu.bean.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>经办人分页显示</title>
</head>
<body>
<%Class.forName("com.mysql.jdbc.Driver");   //加载JDBC驱动
String URL = "jdbc:mysql://localhost:3306/medidb";
String USER="root";
String PASSWORD="0823112013";
Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);   //数据库连接对象
Statement stmt=conn.createStatement();    //SQL语句对象
String sql="select * from agency";   //创建SQL语句
ResultSet rs=stmt.executeQuery(sql);   //执行SQL语句并取得结果集
rs.last(); //将记录指针移动到数据表的最后
int page_count=rs.getRow(); //获取总共的数据数目
int page_size=3;
int Countpage=page_count/page_size; //每次显示两笔纪录
int page_all=(page_count%page_size==0)?(page_count/page_size):(page_count/page_size+1); //计算总共可以显示的页数
int show_page=1;
int page_pos;
String show=request.getParameter("to_page");
if(show==null)
	show="1";    //如果未得到数据则默认为显示第1页的数据
show_page=Integer.parseInt(show);  //将String型数据转换换Int型数据
if(show_page>page_all||show_page<1)  //如果获得的数据超出了显示的范围则默认显示第1页的数据
show_page=1;
%>
<table border width=60%>
<caption>经办人信息</caption>
	<tr>
		<th>编号</th>
		<th>姓名</th>
		<th>性别</th>
		<th>电话</th>
		<th>备注</th>
	</tr>
	<% 
	page_pos=page_size*(show_page-1)+1; //计算需要显示页的第1个数据在数据表中的位置
	rs.absolute(page_pos);  //将记录指针移动到需要显示页的第1个数据
	for(int i=1;i<=page_size;i++)  //从该显示页第1个数据往下显示数据
	{
	%>
	<tr align=center>
		<td><%=rs.getString("ano")%></td>
		<td><%=rs.getString("aname")%></td>
		<td><%=rs.getString("asex")%></td>
		<td><%=rs.getString("aphone")%></td>
		<td><%=rs.getString("aremark")%></td>
	</tr>
	<%
		rs.next();
	}%>
</table>
<table>
<tr>   <!-- 将显示分页数以to_page参数传递给自己 -->
<td>[<%=show_page%>/<%=Countpage%>] 每页显示<%=page_size%>条数据</td>
<%
if(show_page!=1) //如果到了第1页，则在网页上不显示"第一页"和"前一页"的超链接
{%>
<td><a href=../display/display.jsp?to_page=1>第一页</a></td>
<td><a href=../display/display.jsp?to_page=<%=show_page-1%>>前一页</a></td>
<%}
if(show_page!=page_all) //如果到了最后一页，则在网页上不显示"后一页"和"最后一页"的超链接
{%>
<td><a href=../display/display.jsp?to_page=<%=show_page+1%>>后一页</a></td>
<td><a href=../display/display.jsp?to_page=<%=page_all%>>最后一页</a></td>
<%
}
%>
</tr>
</table>
<%rs.close();   //关闭结果集
stmt.close();   //关闭SQL语句对象 
conn.close();   //关闭数据库  
%>   
</body>
</html>