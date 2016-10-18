<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=所有课题信息.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html>
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;楷体_GB2312&quot;;">课 题 信 息 表</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">课题ID</span></td>
    <td><span style="font-weight: bold">指导老师</span></td>
    <td><span style="font-weight: bold">老师ID</span></td>
    <td><span style="font-weight: bold">课题名称</span></td>
    <td><span style="font-weight: bold">课题难度</span></td>
	<td><span style="font-weight: bold">课题方向</span></td>
	 <td><span style="font-weight: bold">限选人数</span></td>
     <td><span style="font-weight: bold">课题要求</span></td>
     <td><span style="font-weight: bold">已确选？</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from select_cursor sel,teacher_inf tea where sel.tea_id = tea.tea_id"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td><%=rs("sel_id")%></td>
    <td><%=rs("tea_name")%></td>
    <td>'<%=rs("sel.tea_id")%></td>
    <td><%=rs(2)%></td>
    <td><%=rs(3)%></td>
    <td><%=rs(4)%></td>
	<td><%=rs(5)%></td>
    <td><%=rs(6)%></td>
    <td><%=rs(7)%></td>
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