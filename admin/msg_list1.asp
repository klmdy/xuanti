<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=0.5, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>留言管理</title></head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
	Action=request.QueryString("Action")
	if Action = "del" then
		sql = "delete from message where msgID="&request("ID")
		Conn.Execute(sql)
	end if
%>
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该信息吗？"))
		window.location = "?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap>
	<p align="center"><b><font color="#FF0000">毕业论文指导过程中的教师与学生阶段交互信息一览表<br>
	</font></b><font color="#FFFFFF">（通过该栏目可以查看和管理所有教师与学生的过程化指导信息</strong>）</font></td>
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>信息发送者</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center"><strong>
		<font color="#800000">信息接收者</font></strong></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>内容</strong></font></td>      
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center"><strong>
		<font color="#800000">留言时间</font></strong></td>
      <td nowrap bgcolor="#8DB5E9" align="center"><font color="#800000"><strong>删除</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from message order by time desc"
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=10 '分页输出 条/页
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
	
	 <% if rsobj("visible")=0 then%>
	
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <%   set rs=server.createobject("adodb.recordset")    
			sql="select * from teacher_inf  where Tea_id='"&rsobj("user_id")&"'" 
			rs.open sql,Conn,1,3			
			do while not rs.eof
			%> 
	<td><%=rs("Tea_name")%></td>
			<%
			rs.movenext
				loop
			%>          
    
	 <%
   set rs=server.createobject("adodb.recordset")    
			sql="select * from student_info  where St_number='"&rsobj("user_name")&"'" 
			rs.open sql,Conn,1,3			
			do while not rs.eof
			%> 
	<td><%=rs("St_name")%></td>
			<%
			rs.movenext
				loop
			
			%>
			<td><%=rsobj("content")%></td>
	  <td><%=rsobj("time")%></td>
	 
	  <td><a href="javascript:DoEmpty(<%=rsobj("msgid")%>);" onclick="return confirm('是否确定删除该条信息?')"><font color='#330099'>删除</font></a></td>
    </tr>
    
     <% else   %>

    
     <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <%   set rs=server.createobject("adodb.recordset")    
			sql="select * from teacher_inf  where Tea_id='"&rsobj("user_id")&"'" 
			rs.open sql,Conn,1,3			
			do while not rs.eof
			%> 
	<td><%=rs("Tea_name")%></td>
			<%
			rs.movenext
				loop
			%>          
   
	 <%
   set rs=server.createobject("adodb.recordset")    
			sql="select * from student_info  where St_number='"&rsobj("user_name")&"'" 
			rs.open sql,Conn,1,3			
			do while not rs.eof
			%> 
	<td><%=rs("St_name")%></td>
			<%
			rs.movenext
				loop
			
			%>
	  <td><%=rsobj("time")%></td>
	   <td><%=rsobj("content")%></td>
	 
	  <td><a href="javascript:DoEmpty(<%=rsobj("msgid")%>);" onClick='changeAdminFlag("删除课题")'><font color='#330099'>删除</font></a></td>
    </tr>
    <% end if  %>
    
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
		response.Write"<a href=?txtpage=1>　第一页　</a>"
		response.Write"<a href=?txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=?txtpage="& rsobj.pagecount&">　最末页　</a>"
		end if
		'关闭链接
		rsobj.close
		set rsobj=nothing
       	conn.close
       	set conn=nothing
	%>
  </div>
<br>
<input type="button" class="button" onclick="location.href='bnuzitc1.asp'" value=" 返 回 " style="WIDTH: 60; align:center; ">
</form>
</center>
</body>
</html>

