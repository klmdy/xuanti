<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=���н�ʦ��Ϣ.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;����_GB2312&quot;;">�� ʦ �� Ϣ ��</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">��ʦ���</span></td>
    <td><span style="font-weight: bold">������</span></td>
    <td><span style="font-weight: bold">��ʦ����</span></td>
    <td><span style="font-weight: bold">��ʦְ��</span></td>
    <td><span style="font-weight: bold">�绰����</span></td>
	<td><span style="font-weight: bold">�ֻ�����</span></td>
	 <td><span style="font-weight: bold">�޴�����</span></td>
     <td><span style="font-weight: bold">Email</span></td>
     <td><span style="font-weight: bold">��ʦ���</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from teacher_inf"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td x:str><div align="center"><%=rs(1)%></div></td>
    <td x:str><div align="center"><%=rs(2)%></div></td>
    <td><div align="center"><%=rs(3)%></div></td>
    <td><div align="center"><%=rs("zc_id")%></div></td>
    <td><div align="center"><%=rs("tea_phone")%></div></td>
    <td x:str><div align="center"><%=rs("tea_m_pone")%></div></td>
	<td x:str><div align="center"><%=rs("st_number")%></div></td>
    <td><div align="center"><%=rs("tea_email")%></div></td>
    <td><div align="center"><%=rs("tea_intru")%></div></td>
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