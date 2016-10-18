<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>修改网站标题</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>网站配置：修改网站标题</strong></font></td>
  </tr>
  <tr>
    <td height="203" width=100% align="center" nowrap  bgcolor="#EBF2F9"><h3>当前标题：<%=session("sysname")%></h3>
      <form id="form1" name="form1" method="post" action="?Action=SaveEdit">
        <strong>网站标题：</strong>
        <input name="sysname" type="text" id="sysname" style="width: 50%; "  value="<%=session("sysname")%>" />　
             <input type="submit" name="Submit" value=" 修 改 " />
    </form>      <p>　</p>
	<input type="button" class="button" onClick="javascript :history.back(-1);" value=" 返 回 " style="WIDTH: 60;">
    </td>    
  </tr>
</table>
<br />
</body>
</html>

<%
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from config"
		rs.open sql,conn,1,3
		rs("sysname")=request("sysname")
		rs.update
		session("sysname")=request("sysname")
		rs.close
		set rs = nothing
		response.Redirect("syscome.asp")
	end if
%>