<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>רҵ�б�</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "user_add.asp?Action=del&ID="+ID ;
	}
//	function refresh() {//v1.0
//		window.open('') ;
//	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>����Ա������ӣ��޸Ĺ���Ա��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        ������Ա���ͣ�
        <select name="u_type" id="u_type" >
		<option value="">��ѡ��</option>
        <option value="4">����Ա</option>
        	<option value="1">ϵ����</option>
      </select>
    ������Ա��ţ�
    <input name="user_no" type="text" id="user_no" size="12" />
	������Ա����
	<input name="user_name" type="text" id="user_name" size="12" />
	��
	<input type="submit" name="Submit" value=" �� �� " />
	��<a href="user_list.asp" onclick='changeAdminFlag(&quot;ϵͳ����Ա&quot;)'>�鿴���й���Ա</a>
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>����Ա����</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>����Ա����</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>����Ա��</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>�޸�</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
    </tr>
 <%
  		wh = ""
		u_type=trim(request.form("u_type"))
		user_no=trim(request.form("user_no"))
		user_name=trim(request.form("user_name"))
		if u_type <> "" then
			wh = " and u.U_t_id = "&"'"&u_type&"' "
		end if
		if user_no <> "" then
			wh = wh&" and user_no like '%"&user_no&"%'"
		end if
		if user_name <> "" then
			wh = wh&" and user_name like '%"&user_name&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		sql="Select * from user_table u,user_type t where u.U_t_id=t.U_t_id "&wh&" order by user_no asc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=15 '��ҳ��� ��/ҳ
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>û���κμ�¼����</strong>"
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("user_no")%></td>
    <td><%=rsobj("u_type")%></td>
    <td><%=rsobj("user_name")%></td>
    <td><a href='user_add.asp?Result=Modify&ID=<%=rsobj("u.ID")%>' onClick='changeAdminFlag("�޸Ĺ���Ա")'><font color='#330099'>�޸�</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("u.ID")%>);"><font color='#330099'>ɾ��</font></a></td>
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
			response.Write"<a href=user_list.asp?txtpage=1>����һҳ��</a>"
			response.Write"<a href=user_list.asp?txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=user_list.asp?txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=user_list.asp?txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
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

  <%
 ' 		wh = ""
'		u_type=trim(request.form("u_type"))
'		user_no=trim(request.form("user_no"))
'		user_name=trim(request.form("user_name"))
'		if u_type <> "" then
'			wh = " and user_table.U_t_id = "&u_type&" "
'		end if
'		if user_no <> "" then
'			wh = wh&" and user_no = "&user_no&" "
'		end if
'		if user_name <> "" then
'			wh = wh&" and user_name = "&user_name&" "
'		end if
'		set rsobj=server.CreateObject("adodb.recordset")
'		sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
'		response.Write(sql)
''		rsobj.open "select * from speciality",conn ,1,1
'		rsobj.open sql,conn ,1,1
'		page=cint(request.QueryString("txtpage"))
'		rsobj.pagesize=15 '��ҳ��� ��/ҳ
'		if page < 1 then page = 1
'		if page > rsobj.pagecount then page = rsobj.pagecount
'		if rsobj.eof = false then
'		rsobj.absolutepage = page
'		else
'		response.Write"<strong>û���κμ�¼����</strong>"
'		response.End()
'		end if
'		for i=1 to rsobj.pagesize
'		if rsobj.eof then exit for
	%>