<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>�����б�</title>
<style type="text/css">
<!--
.STYLE2 {color: #666666}
-->
</style>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFF00"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle"><b>��ʦ�ϴ���Ӧѧ�������ڼ�顢ָ����¼��
	��ҵ�������ĵ�</b></font></td>
  </tr>
  </table>
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td width="6%" nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ѧ��</strong></font></td>
      <td width="6%" nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>����</strong></font></td>
		<td width="4%" nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>�ϴ�</strong></font></td>
		<td width="4%" nowrap="nowrap" bgcolor="#8DB5E9" align="center">
<font color="#800000"><strong>����</strong></font></td>
	   <td width="4%" nowrap="nowrap" bgcolor="#8DB5E9" align="center">
 <font color="#800000"><strong>����</strong></font></td>
   
      <td width="22%" nowrap bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ѡ������</strong></font></td>     
      
     
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_true selt,select_cursor sel,teacher_inf tea,student_info stu where selt.Tea_id=tea.Tea_id and  selt.St_number=stu.St_number and selt.sel_id=sel.sel_id and selt.Tea_id='"&session("user_no")&"' order by selt.Sel_id asc"
		'response.Write(sql)
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '��ҳ��� ��/ҳ
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>û���κμ�¼����</strong>"
		response.End()
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("selt.St_number")%></td>
    <td>
	<a href='student_add.asp?ID=<%=rsobj("stu.ID")%>' onClick='changeAdminFlag("�鿴ѧ����Ϣ")'><font color='#330099'><%=rsobj("St_name")%></font></a>
	</td>
	 <td align="center"><a href="../fileload/FileUploadTeacher.asp?ID=<%=rsobj("selt.St_number")%>" target="mainFrame">�ϴ������ĵ�</a></td>
	 <td align="center"><a href="file_download.asp?ID=<%=rsobj("selt.St_number")%>" target="mainFrame">���ظ����ĵ�</a></td>
	 <td align="center"><a href="msg_add1.asp?ID=<%=rsobj("selt.St_number")%>" target="mainFrame">��������</a></td>
    <td align="left"><%=rsobj("Sel_name")%></td>
       
    
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center">ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong> ��			��ҳ��: <strong><%=rsobj.pagecount%></strong> ��Ŀǰҳ��:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
��
  <%
		if page <> 1 then
		response.Write"<a href=?txtpage=1>����һҳ��</a>"
		response.Write"<a href=?txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
		end if
		'�ر�����
		rsobj.close
		set rsobj=nothing
		cnobj.close
		set cnobj=nothing
	%>
  </div>
</form>
</center>
</body>
</html>
