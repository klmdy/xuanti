<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>专业列表</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该信息吗？"))
		window.location = "user_add.asp?Action=del&ID="+ID ;
	}
//	function refresh() {//v1.0
//		window.open('') ;
//	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>管理员管理：添加，修改管理员信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        　管理员类型：
        <select name="u_type" id="u_type" >
		<option value="">请选择</option>
        <option value="4">管理员</option>
        	<option value="1">系主任</option>
      </select>
    　管理员编号：
    <input name="user_no" type="text" id="user_no" size="12" />
	　管理员名：
	<input name="user_name" type="text" id="user_name" size="12" />
	　
	<input type="submit" name="Submit" value=" 搜 索 " />
	　<a href="user_list.asp" onclick='changeAdminFlag(&quot;系统管理员&quot;)'>查看所有管理员</a>
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>管理员编码</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>管理员类型</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>管理员名</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>修改</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>删除</strong></font></td>
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
		rsobj.pagesize=15 '分页输出 条/页
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>没有任何记录！！</strong>"
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("user_no")%></td>
    <td><%=rsobj("u_type")%></td>
    <td><%=rsobj("user_name")%></td>
    <td><a href='user_add.asp?Result=Modify&ID=<%=rsobj("u.ID")%>' onClick='changeAdminFlag("修改管理员")'><font color='#330099'>修改</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("u.ID")%>);"><font color='#330099'>删除</font></a></td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center">每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
　
  <%
			if page <> 1 then
			response.Write"<a href=user_list.asp?txtpage=1>　第一页　</a>"
			response.Write"<a href=user_list.asp?txtpage="& (page-1)&">　上一页　</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=user_list.asp?txtpage="& (page+1)&">　下一页　</a>"
			response.Write"<a href=user_list.asp?txtpage="& rsobj.pagecount&">　最末页　</a>"
			end if
			'关闭链接
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
'		rsobj.pagesize=15 '分页输出 条/页
'		if page < 1 then page = 1
'		if page > rsobj.pagecount then page = rsobj.pagecount
'		if rsobj.eof = false then
'		rsobj.absolutepage = page
'		else
'		response.Write"<strong>没有任何记录！！</strong>"
'		response.End()
'		end if
'		for i=1 to rsobj.pagesize
'		if rsobj.eof then exit for
	%>