<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,henu.utils.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="../css/leftmenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/menu1.js"></script>
</head>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String sql = "SELECT * FROM t_user WHERE username='"
			+ username + "' AND password = '" + password + "'";
	ResultSet rs = DbcpPool.executeQuery(sql);
	String qdu="";
	String add = "";
	String look = "";
	String baobiao = "";
	while(rs.next()){
	look = rs.getString("look");
	baobiao = rs.getString("baobiao");
	qdu = rs.getString("qdu");
	add = rs.getString("add");
	}
	out.print(look);
	out.print(baobiao);
	out.print(qdu);
	out.print(add);
	DbcpPool.close();
%>
<body>
	<table width="160" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="500" valign="top" background="../images/idnbg1.gif">
				<dl id="admin-mainnav">
					<dt>
						<img id="img_1" src="../images/angle.gif" /><a id="navdisplay"
							onFocus="this.blur()" href="javascript:void(null)">信息录入</A>
					</dt>
					<dd id="menu_1">
						<div id="nav">
							<A title="顾客信息添加" href="../user/userAdd1.jsp?power1=<%=add%>"
								target="main">添加用户</A> <A title="药品信息添加"
								href="../user/userAdd.jsp?power1=<%=add%>" target="main">添加药品</A>
							<A title="经办人信息添加" href="../user/userAdd2.jsp?power1=<%=add%>"
								target="main">添加经办人</A> 
						</div>
					</dd>
					<dt>
						<img id="img_1" src="../images/angle.gif" /><a id="navdisplay1"
							onFocus="this.blur()" href="javascript:void(null)">查询</A>
					</dt>
					<dd id="menu_1">
						<div id="nav1">
							<A title="药品查询" href="/Test7.2/U?stype=find?power2=<%=qdu%>"
								target="main">药品查询</A> <A title="顾客查询"
								href="/Test7.2/U?stype=find1?power2=<%=qdu%>" target="main">顾客查询</A>
							<A title="经办人查询" href="/Test7.2/U?stype=find2?power2=<%=qdu%>"
								target="main">经办人查询</A>
						</div>
					</dd>
					<dt>
						<img id="img_1" src="../images/angle.gif" /><a id="navdisplay2"
							onFocus="this.blur()" href="javascript:void(null)">浏览</A>
					</dt>
					<dd id="menu_1">
						<div id="nav2">
							<A title="药品浏览" href="/Test7.2/U?stype=find3&power3=<%=look%>"
								target="main">药品浏览</A> <A title="顾客浏览"
								href="/Test7.2/U?stype=find4&power3=<%=look%>" target="main">顾客浏览</A>
							<A title="经办人浏览" href="/Test7.2/U?stype=find5&power3=<%=look%>"
								target="main">经办人浏览</A> <A title="购物清单浏览"
								href="/Test7.2/U?stype=find6&power3=<%=look%>" target="main">清单浏览</A>
						</div>
					</dd>
					<dt>
						<img id="img_1" src="../images/angle.gif" /><a id="navdisplay3"
							onFocus="this.blur()" href="javascript:void(null)">数据报表</A>
					</dt>
					<dd id="menu_1">
						<div id="nav3">
							<A title="药品数据报表"
								href="/Test7.2/U?stype=Print&power4=<%=baobiao%>" target="main">药品数据报表</A>
							<A title="顾客数据报表"
								href="/Test7.2/U?stype=Print1&power4=<%=baobiao%>" target="main">顾客数据报表</A>
							<A title="经办人数据报表"
								href="/Test7.2/U?stype=Print2&power4=<%=baobiao%>" target="main">经办人数据报表</A>
							<A title="清单数据报表"
								href="/Test7.2/U?stype=Print3&power4=<%=baobiao%>" target="main">清单数据报表</A>
						</div>
					</dd>
					<dt>
						<img id="img_1" src="../images/angle.gif" /><a id="navdisplay11"
							onFocus="this.blur()" href="javascript:void(null)">用户管理</A>
					</dt>
					<dd id="menu_1">
						<div id="nav11">
							<A title="添加用户" href="../sys/add1.jsp" target="main">添加用户</A> <A
								title="修改密码" href="../sys/add2.jsp" target="main">修改密码</A>
						</div>
					</dd>
					<dt>
						<img id="img_1" src="../images/angle.gif" /><a id="navdisplay4"
							onFocus="this.blur()" href="javascript:void(null)">系统</A>
					</dt>
					<dd id="menu_1">
						<div id="nav4">
							<A title="帮助" href="../Help/help.jsp" target="main">帮助</A> <A
								title="帮助" href="../Help/help.jsp" target="main">功能说明</A>
						</div>
					</dd>
				</dl> <!--导航菜单结束 -->
			</td>
		</tr>
		<tr>
			<td height="7" background="images/close.png"></td>
		</tr>
	</table>
	<script type="text/javascript" src="../js/menu.js"></script>
	<script type="text/javascript" src="../js/menu2.js"></script>
</body>
</html>