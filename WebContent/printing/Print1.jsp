<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,henu.utils.*"%>
<%
String title="顾客报表";
String type = request.getParameter("column");
String keyword = request.getParameter("value");
String sqlSearch = "SELECT * FROM client";
if (keyword != null) {
sqlSearch = "SELECT * FROM client WHERE " + type + " LIKE '%"
			+ keyword + "%'";
}
DbcpPool c =new DbcpPool();
ResultSet rs=c.executeQuery(sqlSearch);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>利用Excel打印顾客报表</title>
<link href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/Excel1.js"></script>
</head>
<body>
<center>
<table width="643"  border="0" align="center" cellpadding="0" cellspacing="0" class="tab_border">
  <tr>
  <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="45%">&nbsp;</td>
        <td width="100%">
          <form action="/Test7.2/U?stype=find" method="post">
	<div id="search">
		查找方式：<select name="column">
			<option value="cno">编号</option>
			<option value="cname">姓名</option>
			<option value="csex">性别</option>
			<option value="cage">年龄</option>
			<option value="caddress">住址</option>
			<option value="cphone">电话</option>
			<option value="csymptom">症状</option>
			<option value="mno">已购药品</option>
			<option value="ano">经办人</option>
			<option value="cdate">录入日期</option>
			<option value="cremark">备注</option>
		</select>
		关键字：<input type="text" name="value" id="keyword" value="" />
		      <input type="submit"  id="find" value="查询" />  
	</div>
	</form>
        </td>
      </tr>
     </center>
    </table>
  </tr>
  <tr>
    <td width="4%">&nbsp;</td>
    <td width="96%" align="left">
    
    <table width="643" border="0" cellspacing="1" bgcolor="#000000" id="pay">
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
      <%
  String cno="";
  String cname="";
  String csex="";
  int cage=0;
  String caddress="";
  String cphone="";
  String csymptom="";
  String mno="";
  String ano="";
  String cdate="";
  String cremark="";
  try{
    while(rs.next()){
    	cno=rs.getString(1);
    	cname=rs.getString(2);
    	csex=rs.getString(3);
    	cage=rs.getInt(4);
    	caddress=rs.getString(5);
    	cphone=rs.getString(6);
    	csymptom=rs.getString(7);
    	mno=rs.getString(8);
    	ano=rs.getString(9);
    	cdate=rs.getString(10);
    	cremark=rs.getString(11);
	%>
      <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=cno%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=cname%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=csex%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=cage%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=caddress%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=cphone%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=csymptom%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=mno%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=ano%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=cdate%></td>
         <td align="center" bgcolor="#FFFFFF">&nbsp;<%=cremark%></td>
      </tr>
      <%
    }
  }catch(Exception e){
    System.out.println(e.getMessage());
  }
  %>
    </table>
         <input type="hidden"  id="cname" value="<%=cname%>"/> 
        <p align="center"><a href="../printing/df1.jsp">打印</a></p>
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
