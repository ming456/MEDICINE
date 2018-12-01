<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");

%>
<frameset cols="*" rows="50, *" id="frame_main" border="0">
    <frame src="sub/top.jsp?username=<%=username%>" noresize="noresize" name="header">
    <frameset cols="181, *">
    	<frame src="sub/menu.html" name="left" noresize="noresize"/>
        <frameset rows="800,*" border="0">
        <frame src="welcome.jsp?username=<%=username%>" name="main" noresize="noresize">
        </frameset>
    </frameset>
</frameset>
<body>
</body>
</html>