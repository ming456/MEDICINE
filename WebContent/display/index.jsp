<%@page contentType="text/html" pageEncoding="GBK"
	import="java.sql.*,java.util.*,java.lang.*,henu.utils.*"%>
<%!int CountPage = 0;
	int CurrPage = 1;
	int PageSize = 5;
	int CountRow = 0;%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>���� SQL ���ʵ�ַ�ҳ</title>

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
									<span class="style3">ҩƷ���</span>								</td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3">ҩƷ����</span>								</td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3">���÷���</span>								</td>
								<td nowrap bgcolor="#CDE0F1">
									<span class="style3">��Ч</span>								</td>
							    </td>
							</tr>
							<!--��ȡ���¼-->
							<%
								String StrPage = request.getParameter("Page");
								if (StrPage == null) {			//�жϵ�ҳ���ֵΪ��ʱ
									CurrPage = 1;				//��ֵΪ1
								} else {
									CurrPage = Integer.parseInt(StrPage);		//�����Ϊ�����ȡ��ֵ
								}
								String SQL = "Select * From medicine";		//�����ѯ���
								ResultSet Rs = DbcpPool.executeQuery(SQL);		//ִ�в�ѯ���
								Rs.last();										//��ȡ��ѯ�����
								int i = 0;										//�������ֱ���
								CountRow = Rs.getRow();							//��ȡ��ѯ�����������
								CountPage = (CountRow / PageSize);				//���㽫���ݷֳɼ�ҳ
								if (CountRow % PageSize > 0)					//�ж����ҳ������0
									CountPage++;								//�����Ӹ�ֵ
								Integer n = (CurrPage - 1) * 5 + 1;				//���������һҳ�Ľ���ֵ
								String sqlp = "select * from medicine order by mno desc limit ?,?";
								Rs = DbcpPool.selectStatic1(sqlp,CurrPage);				//ִ�в�ѯ���

								while (Rs.next()) {								//ѭ�������ѯ���
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
						[<%=CurrPage%>/<%=CountPage%>] ÿҳ5�� ��<%=CountRow%>����¼<%=(CurrPage - 1) * 5 + 1%></td>
					<td width="260" class="style3">
						<div align="right">
							<%
								if (CurrPage > 1) {
							%>
							<a href="index.jsp?Page=<%=CurrPage - 1%>">��һҳ</a>
							<%
								}
							%>
							<%
								if (CurrPage < CountPage) {
							%>
							<a href="../display/index.jsp?Page=<%=CurrPage + 1%>">��һҳ</a>
							<%
								}
							%>
							<a href="../display/index.jsp?Page=<%=CountPage%>">���һҳ</a>
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
