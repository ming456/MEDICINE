<%@page contentType="text/html" pageEncoding="GBK"
	import="java.sql.*,java.util.*,java.lang.*,henu.utils.*"%>
<%!int CountPage = 0;
	int CurrPage = 1;
	int PageSize = 5;
	int CountRow = 0;%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>利用 SQL 语句实现分页</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/styles.css">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
	<body>
	    <table width="1024" height="612" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg.jpg">
          <tr>
            <td width="331" height="182">&nbsp;</td>
            <td width="594">&nbsp;</td>
            <td width="99">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
			  <table width="558" border="0" cellpadding="0" cellspacing="0"
				bordercolor="#FFFFFF" bordercolordark="#999999"
				bordercolorlight="#FFFFFF">
				<tr>
					<td colspan="2">
						<table width="542" height="50" border="1" cellpadding="1" cellspacing="1"
							bordercolor="#FFFFFF"
							bordercolorlight="#FFFFFF" bordercolordark="#999999" bgcolor="#CFE0F2">
							<tr>
								<td height="30" nowrap bgcolor="#CDE0F1">
									<span class="style3">药品编号</span>								</td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3">药品名称</span>								</td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3">服用方法</span>								</td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3">功效</span>								</td>
							    </td>
							</tr>
							<!--获取表记录-->
							<%
								String StrPage = request.getParameter("Page");
								if (StrPage == null) {			//判断当页面的值为空时
									CurrPage = 1;				//赋值为1
								} else {
									CurrPage = Integer.parseInt(StrPage);		//如果不为空则获取该值
								}
								String SQL = "Select * From medicine";		//定义查询语句
								ResultSet Rs = DbcpPool.executeQuery(SQL);		//执行查询语句
								Rs.last();										//获取查询结果集
								int i = 0;										//定义数字变量
								CountRow = Rs.getRow();							//获取查询结果集的行数
								CountPage = (CountRow / PageSize);				//计算将数据分成几页
								if (CountRow % PageSize > 0)					//判断如果页数大于0
									CountPage++;								//则增加该值
								Integer n = (CurrPage - 1) * 5 + 1;				//定义变量上一页的结束值
								String sqlp = "select * from medicine order by mno desc limit ?,?";
								Rs = DbcpPool.selectStatic1(sqlp,CurrPage);				//执行查询语句

								while (Rs.next()) {								//循环输出查询结果
							%><tr>
								<td height="20" nowrap bgcolor="#CDE0F1">
									<span class="style3"><%=Rs.getString("mno")%></span>
							  </td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3"><%=Rs.getString("mname")%></span>
							  </td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3"><%=Rs.getString("mmode")%></span>
							  </td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3"><%=Rs.getString("mefficacy")%></span>
							  </td>
							</tr>
							<%
								}
								DbcpPool.close();	
							%>
					  </table>
					</td>
				</tr>
				<tr>

					<td width="251" height="30" class="style3">
						[<%=CurrPage%>/<%=CountPage%>] 每页5条 共<%=CountRow%>条记录<%=(CurrPage - 1) * 5 + 1%></td>
					<td width="260" class="style3">
						<div align="right">
							<%
								if (CurrPage > 1) {
							%>
							<a href="index.jsp?Page=<%=CurrPage - 1%>">上一页</a>
							<%
								}
							%>
							<%
								if (CurrPage < CountPage) {
							%>
							<a href="../display/index.jsp?Page=<%=CurrPage + 1%>">下一页</a>
							<%
								}
							%>
							<a href="../display/index.jsp?Page=<%=CountPage%>">最后一页</a>
						</div>
				  </td>
				</tr>
			</table>
		</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
	</body>
</html>
