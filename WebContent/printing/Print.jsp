<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,henu.utils.*"%>
<%
String title="药品报表";
String type = request.getParameter("column");
String keyword = request.getParameter("value");
String sqlSearch = "SELECT * FROM medicine";
if (keyword != null) {
sqlSearch = "SELECT * FROM medicine WHERE " + type + " LIKE '%"
			+ keyword + "%'";
}
DbcpPool c =new DbcpPool();
ResultSet rs=c.executeQuery(sqlSearch);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>利用Excel打印药品报表</title>
<link href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/Excel.js"></script>
</head>
<body>
<center>
<table width="643"  border="0" align="center" cellpadding="0" cellspacing="0" class="tab_border">
  <center>
  <tr>
  <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="45%">&nbsp;</td>
        <td width="100%">
          <form action="/Test7.2/U?stype=find" method="post">
	<div id="search">
		查找方式：<select name="column">
			<option value="mno">编号</option>
			<option value="mname">名称</option>
			<option value="mmode">服用方法</option>
			<option value="mefficacy">功效</option>
		</select>
		关键字：<input type="text" name="value" id="keyword" value="" />
		      <input type="submit"  id="find" value="查询" /> 
	</div>
	</td>
	</form>
        </td>
      </tr>
  </tr>
  <tr>
    <td width="4%">&nbsp;</td>
    <td width="96%" align="left"><table width="643" border="0" cellspacing="1" bgcolor="#000000" id="pay">
      <tr>
        <td width="37" height="27" align="center" bgcolor="#efefef">编号</td>
        <td width="152" align="center" bgcolor="#efefef">名称</td>
        <td width="106" align="center" bgcolor="#efefef">服用方法</td>
        <td width="85" align="center" bgcolor="#efefef">功效</td>
      </tr>
      <% 
  String mno="";
  String mname="";
  String mmode="";
  String mefficacy="";
  try{
    while(rs.next()){
    	mno=rs.getString(1);
		mname=rs.getString(2);
		mmode=rs.getString(3);
		mefficacy=rs.getString(4);
	%>
      <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=mno%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=mname%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=mmode%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=mefficacy%></td>
      </tr>
       
      <%
    }
  }catch(Exception e){
    System.out.println(e.getMessage());
  }
  %>
    </table>
        <input type="hidden"  id="" value="<%=mname%>"/> 
        <p align="center"><a href="../printing/df.jsp" >打印</a></p>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
      </table></td>
  </tr>
  </center>
</table>
</center>
</body>
</html>
