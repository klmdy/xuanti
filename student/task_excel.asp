<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=选题信息表.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<!--#include file="../inc/conn.asp"-->
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;??ì?_GB2312&quot;;">选 题 信 息 表</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">选题ID</span></td>
    <td><span style="font-weight: bold">指导老师</span></td>
    <td><span style="font-weight: bold">老师ID</span></td>
    <td><span style="font-weight: bold">选题名称</span></td>
    <td><span style="font-weight: bold">难度</span></td>
	<td><span style="font-weight: bold">选题方向</span></td>
	 <td><span style="font-weight: bold">限选人数</span></td>
     <td><span style="font-weight: bold">选题要求</span></td>
     <td><span style="font-weight: bold">已确选？</span></td>
  </tr>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from select_cursor sel,teacher_inf tea where sel.tea_id = tea.tea_id and check=true and sel.sp_id='"&session("sp_id")&"'"
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