<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>留言管理</title>
</head>
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
		if (confirm("真的要删除该信息吗"))
		window.location = "?Action=del&ID="+ID ;
	}
</script>

<style>
body{
width: 100%;
}
</style>
<body  scroll="no" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24"  ><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>留言管理：查看，管理留言</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center"    bgcolor="#EBF2F9">
		  <a href="msg_add.asp" onclick='changeAdminFlag("添加管理员")'>添加留言</a>
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">

    <tr>
      <td bgcolor="#8DB5E9"><strong><font color="#FFFFFF">信息</font></strong><font color="#FFFFFF"><strong>发送者</strong></font></td>
      <td bgcolor="#8DB5E9"><strong><font color="#FFFFFF">信息</font></strong><font color="#FFFFFF"><strong>接收者</strong></font></td>
      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>内容</strong></font></td>
      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>发信时间</strong></font></td>
      <td bgcolor="#8DB5E9" align="center"><font color="#FFFFFF"><strong>删除</strong></font></td>
    </tr>
 <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from message where user_id='"&session("user_no")&"' order by time desc "
		rsobj.open sql,conn ,1,1
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

	 <% if rsobj("visible")=0 then%>

  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">


         <%
   set rs=server.createobject("adodb.recordset")
			sql="select * from teacher_inf  where Tea_id='"&rsobj("user_id")&"'"
			rs.open sql,Conn,1,3
			do while not rs.eof
			%>
	<td><%=rs("Tea_name")%>老师</td>
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
			  <td><div align="left"><%=rsobj("content")%></div></td>
    <td><%=rsobj("time")%></td>
     <td><a href="javascript:DoEmpty(<%=rsobj("msgid")%>);" onClick='changeAdminFlag("删除课题")'><font color='#330099'>删除</font></a></td>

    </tr>

    <% else   %>
    <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">


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



   <%
   set rs=server.createobject("adodb.recordset")
			sql="select * from teacher_inf  where Tea_id='"&rsobj("user_id")&"'"
			rs.open sql,Conn,1,3
			do while not rs.eof
			%>
	<td><%=rs("Tea_name")%>老师</td>
			<%
			rs.movenext
				loop

			%>

        <td><div align="left"><%=rsobj("content")%></div></td>
    <td><%=rsobj("time")%></td>
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
			rs.close
		set rs=nothing
       	conn.close
       	set conn=nothing
	%>
  </div>


</form>
  <button onclick="selectSysLeft()">返 回</button>
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

