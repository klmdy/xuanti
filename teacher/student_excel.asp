
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=����ѧ����Ϣ.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="120%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="5"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;����_GB2312&quot;;">ѧ �� �� Ϣ ��</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">ѧ��</span></td>
    <td><span style="font-weight: bold">רҵID</span></td>
    <td><span style="font-weight: bold">����</span></td>
    <td><span style="font-weight: bold">���֤����</span></td>
    <td><span style="font-weight: bold">�Ա�</span></td>
	<td><span style="font-weight: bold">�꼶</span></td>
	 <td><span style="font-weight: bold">�༶</span></td>
     <td><span style="font-weight: bold">�ɼ�����</span></td>
     <td><span style="font-weight: bold">��ͥסַ</span></td>
     <td><span style="font-weight: bold">��������</span></td>
     <td><span style="font-weight: bold">��Դ</span></td>
     <td><span style="font-weight: bold">�ֻ�����</span></td>
	 <td><span style="font-weight: bold">�绰����</span></td>
     <td><span style="font-weight: bold">QQ����</span></td>
     <td><span style="font-weight: bold">Email</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from student_info order by St_number asc"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td x:str><div align="center"><%=rs(1)%></div></td>
    <td x:str><div align="center"><%=rs(2)%></div></td>
    <td><div align="center"><%=rs(3)%></div></td>
    <td x:str><div align="center"><%=rs(4)%></div></td>
    <td><div align="center"><%=rs(5)%></div></td>
    <td x:str><div align="center"><%=rs(6)%></div></td>
	<td x:str><div align="center"><%=rs(7)%></div></td>
    <td x:str><div align="center"><%=rs(8)%></div></td>
    <td><div align="center"><%=rs(9)%></div></td>
    <td><div align="center"><%=rs(10)%></div></td>
    <td><div align="center"><%=rs(11)%></div></td>
    <td x:str><div align="center"><%=rs(12)%></div></td>
	<td x:str><div align="center"><%=rs(13)%></div></td>
    <td x:str><div align="center"><%=rs(14)%></div></td>
    <td><div align="center"><%=rs(15)%></div></td>
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