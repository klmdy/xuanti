<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Response.Charset = "gb2312"
	Response.Buffer = True
	response.addheader "Content-Disposition", "attachment;filename=成绩表.xls"
	response.contentType = "application/vnd.ms-excel"
%>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<!--#include file="../inc/conn.asp"-->
<body>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="4"><span style="font-weight: bold; color: #000066; font-size: large; font-family: &quot;楷体_GB2312&quot;;">成绩表</span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">学号</span></td>
    <td><span style="font-weight: bold">姓名</span></td>
    <td><span style="font-weight: bold">年级</span></td>
    <td><span style="font-weight: bold">班级</span></td>
    <td><span style="font-weight: bold">论文成绩</span></td>
    <td><span style="font-weight: bold">等级</span></td>
    <td><span style="font-weight: bold">课题名称</span></td>
  </tr>
<%
	set rsobj=server.createobject("adodb.recordset")
	sql="Select * from sel_record sr,select_cursor sc,student_info si where sr.st_number=si.st_number and sr.sel_id=sc.sel_id order by sr.st_number asc"
	rsobj.open sql,conn,1,1
	if not rsobj.eof then
	do while not rsobj.eof
%>
  <tr>
    <td x:str><div align="center"><%=rsobj("sr.St_number")%></div></td>
    <td><div align="center"><%=rsobj("st_name")%></div></td>
    <td x:str><div align="center"><%=rsobj("si.st_grade")%></div></td>
    <td><div align="center"><%=rsobj("si.st_class")%></div></td>
    <td><div align="center"><%=rsobj("Sum_ach2")%></div></td>
    <td><div align="center"><%=rsobj("dj")%></div></td>
    <td><div align="center"><%=rsobj("sel_name")%></div></td>
  </tr>
<%
	rsobj.movenext
	loop
	end if
	rsobj.close
	conn.close
%>
</table>
</body>
</html>