<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>�����б�</title></head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->


<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "task_add.asp?Action=nocheck&ID="+ID&txtpage=<%=page%> ;
		
		
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѡ�������ӣ��޸�ѡ����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="task_list.asp">
        <p>��ѡ���꼶��<select name="Sel_cour" id="Sel_cour">
			<option value="">��ѡ��</option>
         <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Sel_cour from select_cursor group by Sel_cour"    
			rs.open sql,Conn,1,1
		%>
              <%do while not rs.eof%>
              <option value="<%=rs("Sel_cour")%>"><%=rs("Sel_cour")%></option>
              <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
    ���Ѷȣ�
          <select name="Sel_level" id="sel2">
			<option value="">��ѡ��</option>
         <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Sel_level from select_cursor group by Sel_level"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Sel_level")%>"><%=rs("Sel_level")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
		  
	ָ����ʦ��
          <select name="tea_name" id="tea_name" >
		  <option value="">��ѡ��</option>
            <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select Tea_id,Tea_name from teacher_inf order by Tea_name asc"    
			rs.open sql,Conn,1,1
		%>
            <%do while not rs.eof%>
            <option value="<%=rs("Tea_id")%>"><%=rs("Tea_name")%></option>
            <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
          </select>
���ؼ��֣�
	<input name="keyword" type="text" id="keyword" size="12" />
	��
	<input type="submit" name="Submit" value=" �� �� " />
	��<a href="task_list.asp" onclick='changeAdminFlag(&quot;ϵͳ����&quot;)'>�鿴����ѡ��</a> |&nbsp;</font><a href="task_excel.asp" onclick='changeAdminFlag(&quot;�������п�����Ϣ&quot;)'>����ѡ����Ϣ(Excel��)</a>
	            </p>
	</form>	
    </td>    
  </tr>
</table>

  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap bgcolor="#8DB5E9" align="center"><font color="#800000"><strong>ID</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ѡ������</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center"><strong>
		<font color="#800000">����꼶</font></strong></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ѡ���Ѷ�</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ָ����ʦ</strong></font></td>     
      <td nowrap bgcolor="#8DB5E9" align="center">
		<strong><font color="#800000">�ܹ���ѡ����</strong></font></td>
		<td nowrap bgcolor="#8DB5E9"  align="center">
		<strong><font color="#800000">Ŀǰ��ѡ����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>ѡ������</strong></font></td>
      <td nowrap bgcolor="#8DB5E9" width="120" align="center">
		<font color="#800000"><strong>���</strong></font></td>
     
    </tr>
  <%
  		wh = ""
		Sel_cour=request.QueryString("Sel_cour")
		Sel_cour2=request("Sel_cour")
		Sel_level=request.QueryString("Sel_level")
		Sel_level2=request("Sel_level")
		tea_name=request.QueryString("tea_name")
		tea_name2=request("tea_name")
		keyword=request("keyword")
		if Sel_cour <> "" then
			wh = wh&" and Sel_cour = "&"'"&Sel_cour&"' "
		end if
		if Sel_cour2 <> "" then
			wh = wh&" and Sel_cour = "&"'"&Sel_cour2&"' "
		end if
		
		if Sel_level <> "" then
			wh = wh&" and Sel_level = "&"'"&Sel_level&"' "
		end if
		if Sel_level2 <> "" then
			wh = wh&" and Sel_level = "&"'"&Sel_level2&"' "
		end if
				
		if tea_name <> "" then
			wh = wh&" and sel.Tea_id = "&"'"&tea_name&"' "
		end if
		if tea_name2 <> "" then
			wh = wh&" and sel.Tea_id = "&"'"&tea_name2&"' "
		end if
		
		if keyword <> "" then
			wh = wh&" and ( Sel_con like '%"&keyword&"%' or Sel_name like '%"&keyword&"%' ) "
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor sel,teacher_inf tea,speciality sp where sp.sp_id=sel.sp_id and sel.check = true and sel.Tea_id=tea.Tea_id "&wh&" order by Sel_id asc"
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '��ҳ��� ��/ҳ
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
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("Sel_id")%></td>
    <td><p align=left><%=rsobj("Sel_name")%></p></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><%=rsobj("Tea_name")%></td>
    
    <td >
	
	<p align="center"><%=rsobj("Sel_nu")%></font>
		</td>
		<td >
	
	<p align="center"><%=rsobj("sel_flag")%></font>
		</td>

    <td><p align="left"><%=rsobj("Sel_con")%></p></td>
    <td width="120">
	<% if rsobj("check")=false then%>
	<a href="?Result=check&ID=<%=rsobj("Sel_id")%>&txtpage=<%=page%>"
	onClick='changeAdminFlag("��˿���")'><font color='#330099'>�����</font></a>
	<%else%>
	�����ͨ��	
	<a href="?Result=nocheck&ID=<%=rsobj("Sel_id")%>&txtpage=<%=page%>"	 onclick="return confirm('���ȷ�������Ѿ����ͨ���ĸÿ�����?')"><font color='#FF0000'>�ɳ���</font></a>
	
	<% end if%>
	</td>
   
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
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage=1>����һҳ��</a>"
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=task_list.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
		end if
		'�ر�����
		rsobj.close
		set rsobj=nothing
	%>
	
  </div>
</form>
</center>

<%
Action=request.QueryString("Result")
if Action = "check" then
	set rs = server.createobject("adodb.recordset")
	sql="select * from select_cursor where Sel_id="&request("ID")
	response.Write(sql)
	rs.open sql,conn,1,3
		rs("check")=true
		rs.update
		rs.close
		set rs = nothing
		response.Redirect("task_list.asp?txtpage="&request("txtpage"))
end if
%>
<%
Action=request.QueryString("Result")
if Action = "nocheck" then
	set rs = server.createobject("adodb.recordset")
	sql="select * from select_cursor where Sel_id="&request("ID")
	response.Write(sql)
	rs.open sql,conn,1,3
		rs("check")=false
		rs.update
		rs.close
		set rs = nothing
		response.Redirect("task_list.asp?txtpage="&request("txtpage"))
end if
%>
</body>
</html>
