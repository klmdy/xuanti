<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>教师职称</title>
</head>
<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该教师职称吗？"))
		window.location = "zc_add.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>数据字典维护：添加，修改教师职称信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="zc_add.asp?Result=Add">添加教师职称</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="zc_table.asp" onClick='changeAdminFlag("系统管理员")'>查看所有教师职称</a></td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>教师职称编号</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>教师职称名称</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>修改</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>删除</strong></font></td>
    </tr>
  <%
				set rsobj=server.CreateObject("adodb.recordset")
				rsobj.open "select * from zc_table order by zc_id asc",conn ,1,1
				page=cint(request.QueryString("txtpage"))
				rsobj.pagesize=10 '分页输出 条/页
				if page < 1 then page = 1
				if page > rsobj.pagecount then page = rsobj.pagecount
				if rsobj.eof = false then
				rsobj.absolutepage = page
				else
				response.Write"<strong>没有任何记录！！</strong>"
				response.End()
				end if
				for i=1 to rsobj.pagesize
				if rsobj.eof then exit for
			%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("ID")%></td>
    <td><%=rsobj("zc_id")%></td>
    <td><%=rsobj("zc_name")%></td>
    <td><a href='zc_add.asp?Result=Modify&amp;ID=<%=rsobj("ID")%>' onClick='changeAdminFlag("修改教师职称")'><font color='#330099'>修改</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("ID")%>);" onClick='changeAdminFlag("删除教师职称")'><font color='#330099'>删除</font></a></td>
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
			response.Write"<a href=zc_table.asp?txtpage=1>　第一页　</a>"
			response.Write"<a href=zc_table.asp?txtpage="& (page-1)&">　上一页　</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=zc_table.asp?txtpage="& (page+1)&">　下一页　</a>"
			response.Write"<a href=zc_table.asp?txtpage="& rsobj.pagecount&">　最末页　</a>"
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
