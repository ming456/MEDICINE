<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,henu.utils.*"%>
<%
String title="经办人报表";
String type = request.getParameter("column");
String keyword = request.getParameter("value");
String sqlSearch = "SELECT * FROM agency";
if (keyword != null) {
sqlSearch = "SELECT * FROM agency WHERE " + type + " LIKE '%"
			+ keyword + "%'";
}
DbcpPool c =new DbcpPool();
ResultSet rs=c.executeQuery(sqlSearch);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>利用Excel打印经办人报表</title>
<link href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/Excel2.js"></script>
</head>
<body>
<center>
<table width="643"  border="0" align="center" cellpadding="0" cellspacing="0" class="tab_border">
  <tr>
  <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="45%">&nbsp;</td>
        <td width="100%">
          <form action="/Test7.2/U?stype=find2" method="post">
	<div id="search">
		查找方式：<select name="column">
			<option value="ano">编号</option>
			<option value="aname">姓名</option>
			<option value="asex">性别</option>
			<option value="aphone">电话</option>
			<option value="aremark">备注</option>
		</select>
		关键字：<input type="text" name="value" id="keyword" value="" />
		      <input type="submit"  id="find" value="查询" />
	</div>
	</form>
        </td>
      </tr>
    </table>
  </tr>
  <tr>
    <td width="4%">&nbsp;</td>
    <td width="96%" align="left"><table width="643" border="0" cellspacing="1" bgcolor="#000000" id="pay">
      <tr>
        <td width="37" height="27" align="center" bgcolor="#efefef">编号</td>
        <td width="85" align="center" bgcolor="#efefef">姓名</td>
        <td width="85" align="center" bgcolor="#efefef">性别</td>
        <td width="85" align="center" bgcolor="#efefef">电话</td>
          <td width="152" align="center" bgcolor="#efefef">备注</td>
      </tr>
      <%
  String ano="";
  String aname="";
  String asex="";
  String aphone="";
  String aremark="";
  try{
    while(rs.next()){
    	ano=rs.getString(1);
		aname=rs.getString(2);
		asex=rs.getString(3);
		aphone=rs.getString(4);
		aremark=rs.getString(5);
	%>
      <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=ano%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=aname%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=asex%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=aphone%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=aremark%></td>
      </tr>
      <%
    }
  }catch(Exception e){
    System.out.println(e.getMessage());
  }
  %>
    </table>
         <input type="hidden"  id="aname" value="<%=aname%>"/> 
        <p align="center"><a href="../printing/df2.jsp">打印</a></p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
      </table></td>
  </tr>
</table>
</center>
</body>
</html>
