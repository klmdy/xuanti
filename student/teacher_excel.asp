<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=所有教师信息.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;楷体_GB2312&quot;;">教 师 信 息 表</span></td>
    <td>　</td>
    <td>　</td>
    <td>　</td>
    <td>　</td>
    <td>　</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">教师编号</span></td>
    <td><span style="font-weight: bold">教研室</span></td>
    <td><span style="font-weight: bold">教师姓名</span></td>
    <td><span style="font-weight: bold">教师职称</span></td>
    <td><span style="font-weight: bold">电话号码</span></td>
	<td><span style="font-weight: bold">手机号码</span></td>
	 <td><span style="font-weight: bold">限带人数</span></td>
     <td><span style="font-weight: bold">Email</span></td>
     <td><span style="font-weight: bold">教师简介</span></td>
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
    <td x:str><div align="center"><%=rs("zc_id")%></div></td>
    <td x:str><div align="center"><%=rs("tea_phone")%></div></td>
    <td><div align="center"><%=rs("tea_m_pone")%></div></td>
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