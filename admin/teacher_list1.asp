<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>��ʦ�б�</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("���Ҫɾ������Ϣ��"))
		window.location = "teacher_add1.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>��ʦ������ӣ��޸Ľ�ʦ��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="" style="line-height: 23px; ">
        ����Ժϵ��
          <select name="res_name" id="res_name">
          <option value="">��ѡ��</option>
        <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select * from department " 
			rs.open sql,Conn,1,3
		%>
        <%do while not rs.eof%>
        <option value="<%=rs("D_name")%>"><%=rs("D_name")%></option>
        <%
			rs.movenext
			loop
		%>
      </select>
          <input type="submit" name="Submit" value=" �� �� " />
	<br><a href="teacher_add1.asp?Result=Add" onclick='changeAdminFlag(&quot;��ӹ���Ա&quot;)'>��ӽ�ʦ</a>
	<font color="#0000FF">|</font><a href="teacher_Padd.asp" onclick='changeAdminFlag(&quot;���������ʦ��Ϣ&quot;)'>���������ʦ��Ϣ</a>
	|</font><a href="teacher_excel.asp" onclick='changeAdminFlag(&quot;������Excel��&quot;)'>������ʦ��Ϣ��Excel��</a>
	<br><a href="teacher_list1.asp" onclick='changeAdminFlag(&quot;�鿴��ʦ�б�&quot;)'>�鿴���н�ʦ</a>
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>��ʦ����</strong></font></td>
      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>����Ժϵ</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>��ʦ��</strong></font></td>
      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>�޴�����</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ְ��</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>�绰</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>�޸�</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ɾ��</strong></font></td>
    </tr>
  <%
  		wh = ""
		res_name=request("res_name")
		if res_name <> "" then
			wh = " and D_name = "&"'"&res_name&"' "
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		'sql="Select * from teacher_inf "&wh
		sql ="select * from teacher_inf t,department res,zc_table zc where t.res_id=res.D_no and t.Zc_id=zc.Zc_id "&wh&" order by Tea_id asc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=25 '��ҳ��� ��/ҳ
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
    <td><%=rsobj("Tea_id")%></td>
    <td><%=rsobj("D_name")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("St_number")%></td>
    <td><%=rsobj("zc_name")%></td>
    <td><%=rsobj("Tea_m_pone")%></td>
    <td><a href='teacher_add1.asp?Result=Modify&ID=<%=rsobj("Tea_id")%>' onClick='changeAdminFlag("�޸Ľ�ʦ")'><font color='#330099'>�޸�</font></a></td>
    <td><a href="teacher_add1.asp?Action=del&ID=<%=rsobj("Tea_id")%>" onClick='changeAdminFlag("ɾ����ʦ")'><font color='#330099'>ɾ��</font></a></td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="" style="line-height: 23px; ">
  <div align="center">ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong> ��			��ҳ��: <strong><%=rsobj.pagecount%></strong> ��<br>Ŀǰҳ��:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
��
  <%
			if page <> 1 then
			response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage=1>����һҳ��</a>"
			response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage="& (page-1)&">����һҳ��</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage="& (page+1)&">����һҳ��</a>"
			response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
			end if
			'�ر�����
			rsobj.close
			set rsobj=nothing
			cnobj.close
			set cnobj=nothing
		%>
  </div>
</form>
<br>
<input type="button" class="button" onclick="location.href='bnuzitc1.asp'" value=" �� �� " style="WIDTH: 60; align:center; ">
</center>
</body>
</html>
