<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
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

<body  scroll="no" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24"  ><font color="#FFFF00"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle"><b>��ʦ�ϴ���Ӧѧ�������ڼ�顢ָ����¼��
	��ҵ�������ĵ�</b></font></td>
  </tr>
  </table>
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td width="1%"  bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ѧ��</strong></font></td>
      <td width="7%"  bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>����</strong></font></td>
		<td width="4%" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>�ϴ�</strong></font></td>
		<td width="4%" bgcolor="#8DB5E9" align="center">
<font color="#800000"><strong>����</strong></font></td>
	   <td width="4%"  bgcolor="#8DB5E9" align="center">
 <font color="#800000"><strong>����</strong></font></td>
   
      <td width="15%"  bgcolor="#8DB5E9" align="center">
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
	 <td align="center"><a href="../fileload/FileUploadTeacher.asp?ID=<%=rsobj("selt.St_number")%>">�ϴ������ĵ�</a></td>
	 <td align="center"><a href="file_download.asp?ID=<%=rsobj("selt.St_number")%>">���ظ����ĵ�</a></td>
	 <td align="center"><a href="msg_add1.asp?ID=<%=rsobj("selt.St_number")%>">��������</a></td>
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

 <button onclick="selectSysLeft()">�� ��</button>
</center>
</body>

<script>
function selectSysLeft() {
    var devies = navigator.userAgent.toLowerCase();
             var ipad = devies.match(/ipad/i) == "ipad";
             var iphone = devies.match(/iphone os/i) == "iphone os";
             var midp = devies.match(/midp/i) == "midp";
             var uc7 = devies.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
             var uc = devies.match(/ucweb/i) == "ucweb";
             var android = devies.match(/android/i) == "android";
             var wince = devies.match(/windows ce/i) == "windows ce";
             var winphone = devies.match(/windows mobile/i) == "windows mobile";
             if (ipad || iphone || midp || uc7 || uc || android || wince || winphone) {
                 window.location.href="./SysLeft1.asp";
             } else {
                 window.location.href="./bnuzitc.asp";
             }
}
</script>
</html>
