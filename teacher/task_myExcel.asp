<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=�ҵ����п�����Ϣ.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;����_GB2312&quot;;">�� �� �� �� �� Ϣ ��</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">����ID</span></td>
    <td><span style="font-weight: bold">ָ����ʦ</span></td>
    <td><span style="font-weight: bold">��ʦID</span></td>
    <td><span style="font-weight: bold">��������</span></td>
    <td><span style="font-weight: bold">�����Ѷ�</span></td>
	<td><span style="font-weight: bold">���ⷽ��</span></td>
	 <td><span style="font-weight: bold">��ѡ����</span></td>
     <td><span style="font-weight: bold">����Ҫ��</span></td>
     <td><span style="font-weight: bold">��ȷѡ��</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from select_cursor sel,teacher_inf tea where sel.tea_id = tea.tea_id and sel.Tea_id='"&session("user_no")&"'"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td><div align="center"><%=rs("sel_id")%></div></td>
    <td><div align="center"><%=rs("tea_name")%></div></td>
    <td x:str><div align="center"><%=rs("sel.tea_id")%></div></td>
    <td><div align="center"><%=rs(2)%></div></td>
    <td><div align="center"><%=rs(3)%></div></td>
    <td><div align="center"><%=rs(4)%></div></td>
	<td><div align="center"><%=rs(5)%></div></td>
    <td><div align="center"><%=rs(6)%></div></td>
    <td><div align="center"><%=rs(7)%></div></td>
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