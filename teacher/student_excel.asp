
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=所有学生信息.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="120%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="5"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;楷体_GB2312&quot;;">学 生 信 息 表</span></td>
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
    <td><span style="font-weight: bold">学号</span></td>
    <td><span style="font-weight: bold">专业ID</span></td>
    <td><span style="font-weight: bold">姓名</span></td>
    <td><span style="font-weight: bold">身份证号码</span></td>
    <td><span style="font-weight: bold">性别</span></td>
	<td><span style="font-weight: bold">年级</span></td>
	 <td><span style="font-weight: bold">班级</span></td>
     <td><span style="font-weight: bold">成绩排名</span></td>
     <td><span style="font-weight: bold">家庭住址</span></td>
     <td><span style="font-weight: bold">出生日期</span></td>
     <td><span style="font-weight: bold">来源</span></td>
     <td><span style="font-weight: bold">手机号码</span></td>
	 <td><span style="font-weight: bold">电话号码</span></td>
     <td><span style="font-weight: bold">QQ号码</span></td>
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