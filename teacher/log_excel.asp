<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=������־��¼.xls"
	response.contentType = "application/vnd.ms-excel;charset=gb2312"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="3"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;����_GB2312&quot;;">������־��¼</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">��־���</span></td>
    <td><span style="font-weight: bold">�û����</span></td>
    <td><span style="font-weight: bold">��������</span></td>
    <td><span style="font-weight: bold">����ʱ��</span></td>
    <td><span style="font-weight: bold">����IP</span></td>
	<td><span style="font-weight: bold">�û���</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from rz_table where user_id='"&session("user_no")&"' order by note_id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td x:str><div align="center"><%=rs("note_id")%></div></td>
    <td x:str><div align="center"><%=rs("user_id")%></div></td>
    <td><div align="center"><%=rs("option0")%></div></td>
    <td><div align="center"><%=rs("op_time")%></div></td>
    <td><div align="center"><%=rs("login_ip")%></div></td>
    <td><div align="center"><%=rs("user_name")%></div></td>
  </tr>
<%
	rs.movenext
	loop
	end if
	rs.close
	conn.close
%>
</table>
</body>
</html>