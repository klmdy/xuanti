
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
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td colspan="7"><span style="font-family: &quot;楷体_GB2312&quot;; font-size: large; color: #000066; font-weight: bold">未选题学生列表</span></td>
  </tr>
  <tr align="center">
    <td><span style="font-weight: bold">序列</span></td>
    <td><span style="font-weight: bold">姓名</span></td>
    <td><span style="font-weight: bold">学号</span></td>
    <td><span style="font-weight: bold">专业</span></td>
    <td><span style="font-weight: bold">班级</span></td>
     <td><span style="font-weight: bold">手机号码</span></td>
	 <td><span style="font-weight: bold">QQ号码</span></td>
     <td><span style="font-weight: bold">E-mail</span></td>
  </tr>
<%
	dim i
	i = 1
	set rs=server.createobject("adodb.recordset")
	sql="select * from student_info order by St_number asc"
	sql="Select * from Student_info st,speciality sp where st.Sp_id=sp.Sp_id and st.St_number not in(select St_number from select_true) order by st.St_number asc"
	rs.open sql,conn,1,1
	if not rs.eof then
	do while not rs.eof
%>
  <tr>
    <td><div align="center"><%=i%></div></td>
    <td><div align="center"><%=rs("St_name")%></div></td>
    <td x:str><div align="center"><%=rs("St_number")%></div></td>
    <td><div align="center"><%=rs("Sp_name")%></div></td>
    <td><div align="center">'<%=rs("St_class")%></div></td>
    <td x:str><div align="center"><%=rs("St_m_phone")%></div></td>
	<td><div align="center"><%=rs("St_qq")%></div></td>
    <td><div align="center"><%=rs("St_email")%></div></td>
  </tr>
<%
	rs.movenext
	i = i + 1
	loop
	end if
	rs.close
	conn.close
%>
</table>
</body>
</html>