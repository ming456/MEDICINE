<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,henu.utils.*"%>
<%
String title="购物清单报表";
String type = request.getParameter("column");
String keyword = request.getParameter("value");
String sqlSearch = "SELECT * FROM shopping";
if (keyword != null) {
sqlSearch = "SELECT * FROM shopping WHERE " + type + " LIKE '%"
			+ keyword + "%'";
}
DbcpPool c =new DbcpPool();
ResultSet rs=c.executeQuery(sqlSearch);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>利用Excel打印购物清单报表</title>
<link href="css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="../js/Excel3.js"></script>
</head>
<body>
<center>
<table width="643"  border="0" align="center" cellpadding="0" cellspacing="0" class="tab_border">
  <tr>
  <table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="45%">&nbsp;</td>
        <td width="100%">
          <form action="/Test7.2/U?stype=find6" method="post">
	<div id="search">
		查找方式：<select name="column">
			<option value="sno">订单号</option>
					<option value="mno">药名</option>
					<option value="count">数量</option>
					<option value="mname">商品</option>
					<option value="unitprice">单价</option>
					<option value="money">金额</option>
					<option value="cno">顾客编号</option>
					<option value="stime">销售时间</option>
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
        <td width="37" height="27" align="center" bgcolor="#efefef">订单号</td>
        <td width="152" align="center" bgcolor="#efefef">药名</td>
        <td width="106" align="center" bgcolor="#efefef">数量</td>
        <td width="85" align="center" bgcolor="#efefef">药品</td>
        <td width="85" align="center" bgcolor="#efefef">单价</td>
        <td width="85" align="center" bgcolor="#efefef">金额</td>
		<td width="85" align="center" bgcolor="#efefef">顾客编号</td>
		<td width="85" align="center" bgcolor="#efefef">经办人编号</td>
		<td width="85" align="center" bgcolor="#efefef">销售时间</td>
      </tr>
      <%
  String sno="";
  String mno="";
  int count=0;
  String mname="";
  String unitprice="";
  String money="";
  String cno="";
  String ano="";
  String stime="";
  try{
    while(rs.next()){
    	sno=rs.getString(1);
		mno=rs.getString(2);
		count=rs.getInt(3);
		mname=rs.getString(4);
		unitprice=rs.getString(5);
		money=rs.getString(6);
		cno=rs.getString(7);
		ano=rs.getString(8);
		stime=rs.getString(9);
	%>
      <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=sno%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=mno%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=count%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=mname%></td>
         <td align="center" bgcolor="#FFFFFF">&nbsp;<%=unitprice%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=money%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=cno%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=ano%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=stime%></td>
      </tr>
      <%
    }
  }catch(Exception e){
    System.out.println(e.getMessage());
  }
  %>
    </table>
        <input type="hidden"  id="sno" value="<%=sno%>"/> 
        <p align="center"><a href="../printing/df3.jsp">打印</a></p>
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
