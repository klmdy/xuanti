<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>专业列表</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该信息吗？"))
		window.location = "speciality_add1.asp?Action=del&ID="+ID ;
	}
</script>
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>专业设置：添加，修改专业信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="speciality_add1.asp?Result=Add" onClick='changeAdminFlag("添加专业")'>添加专业</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="speciality_list1.asp" onClick='changeAdminFlag("专业列表")'>查看所有专业</a></td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ID</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>专业编号</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>专业名称</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>所属系别</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>修改</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>删除</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql="Select * from speciality,department where speciality.D_no=department.D_no order by Sp_id asc"
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
    <td><%=rsobj("speciality.ID")%></td>
    <td><%=rsobj("Sp_id")%></td>
    <td><%=rsobj("Sp_name")%></td>
    <td><%=rsobj("D_name")%></td>
    <td><a href='speciality_add1.asp?Result=Modify&ID=<%=rsobj("speciality.ID")%>' onClick='changeAdminFlag("修改系别")'><font color='#330099'>修改</font></a></td>
    <td><a href="javascript:DoEmpty(<%=rsobj("speciality.ID")%>);" onClick='changeAdminFlag("删除系别")'><font color='#330099'>删除</font></a></td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="" style="line-height: 23px; ">
  <div align="center">每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　<br>目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px"  />
　
  <%
			if page <> 1 then
			response.Write"<a href=speciality_list1.asp?txtpage=1>　第一页　</a>"
			response.Write"<a href=speciality_list1.asp?txtpage="& (page-1)&">　上一页　</a>"
			end if 
			if page<>rsobj.pagecount then
			response.Write"<a href=speciality_list1.asp?txtpage="& (page+1)&">　下一页　</a>"
			response.Write"<a href=speciality_list1.asp?txtpage="& rsobj.pagecount&">　最末页　</a>"
			end if
			'关闭链接
			rsobj.close
			set rsobj=nothing
			cnobj.close
			set cnobj=nothing
		%>
  </div>
</form>
<br>
<input type="button" class="button" onclick="location.href='bnuzitc1.asp'" value=" 返 回 " style="WIDTH: 60; align:center; ">
</center>
</body>
</html>
