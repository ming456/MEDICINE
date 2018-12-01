<%@ page language="java" contentType="application/vnd.ms-excel; charset=GB2312" %><%@ page import="java.sql.*"%> 
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%response.setHeader("Content-disposition","attachment;filename=medicine.xls"); %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="EX13-04.files/filelist.xml">
<link rel=Edit-Time-Data href="EX13-04.files/editdata.mso">
<link rel=OLE-Object-Data href="EX13-04.files/oledata.mso">
<style>
table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:����;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
</style>
</head>

<body link=blue vlink=purple>
<%Class.forName("com.mysql.jdbc.Driver");   //����JDBC����
String URL = "jdbc:mysql://localhost:3306/medidb";
String USER="root";
String PASSWORD="0823112013";
Connection conn = DriverManager.getConnection(URL,USER,PASSWORD);   //���ݿ����Ӷ���
Statement stmt=conn.createStatement();    //SQL������
String sql="select * from medicine";   //����SQL���
ResultSet rs=stmt.executeQuery(sql);   //ִ��SQL��䲢ȡ�ý����
%>
<table border="1">
 <col width=72 span=2 style='width:54pt'>
 <caption>ҩƷ</caption>
	<tr>
		<th>ҩ����</th>
		<th>ҩ��</th>
		<th>���÷���</th>
		<th>��Ч</th>
	</tr>
  <% //�����������ȡ������
while(rs.next()) {%>   
 <tr height=19 style='height:14.25pt'>
  <td height=19 width=72 style='height:14.25pt;width:54pt'><%=rs.getString(1)%></td>
  <td width=72 style='width:54pt'><%=rs.getString(2)%></td>
  <td width=72 style='width:54pt' ><%=rs.getString(3)%></td>
  <td width=72 style='width:54pt' ><%=rs.getString(4)%></td>
 </tr>
<%}%>
</table>
<%rs.close();   //�رս����
stmt.close();   //�ر�SQL������ 
conn.close();   //�ر����ݿ�  
%>  
</body>
</html>