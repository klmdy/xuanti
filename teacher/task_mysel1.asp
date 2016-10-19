<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>选题确认</title></head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该信息吗？"))
		window.location = "task_tadd1.asp?Action=del&ID="+ID ;
	}
</script>

<style>
body
{
width: 100%;
}

</style>
<body scroll="no" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0"align="absmiddle">我所发布的选题列表</font></td>
  </tr>
</table>
  <center>
  	<form id="form1" name="form1" method="post" action="">
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td bgcolor="#8DB5E9" align="center"><font color="#800000"><strong>ID</strong></font></td>
      <td bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>选题名称</strong></font></td>
      <td bgcolor="#8DB5E9" align="center"><strong>
		<font color="#800000">选题年级</font></strong></td>
      <td bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>选题难度</strong></font></td>
      <td bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>可选人数</strong></font></td>
		 <td bgcolor="#8DB5E9" align="center">
		<font color="#800000"><strong>已选人数</strong></font></td>
      <td  bgcolor="#8DB5E9" align="center" width="40px">
		<font color="#800000"><strong>选题人名单</strong></font></td>
      <td bgcolor="#8DB5E9" align="center" width="auto">
		<font color="#800000"><strong>系主任审核</strong></font></td>
       <td bgcolor="#8DB5E9" align="center" width="auto">
		<font color="#800000"><strong>查看与修改</strong></font></td>
        <td bgcolor="#8DB5E9" align="center" width="auto">
		<font color="#800000"><strong>删除(谨慎使用)</strong></font></td>
    </tr>
  <%
		set rsobj=server.CreateObject("adodb.recordset")
		sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id and sel.Tea_id='"&session("user_no")&"'"
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '分页输出 条/页
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
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("Sel_id")%></td>
    <td><p align="left"><%=rsobj("Sel_name")%></p></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><p align="center"><%=rsobj("Sel_nu")%></font></p></td>
    <td><p align="center"><%=rsobj("sel_flag")%></font></p></td>

    <td width="400"><p align="left">	
	<%
			set rs1=server.createobject("adodb.recordset")    
			sql="select * from sel_record " 
			rs1.open sql,Conn,1,3
		%>
        <% do while not rs1.eof %>
        <%
          if rs1("Sel_id")=  rsobj("Sel_id")  then 
          %>          
        <%=rs1("St_name")%>|         
       <% end if%>
        <%
				rs1.movenext
				loop
			
			%>
			<%
				 rs1.close
				set rs1 = nothing				
			%>
			</p>
		</td>
    <td width="65"><% if rsobj("check")=false then%>
      <font color="#FF0000">?w</font> <%else%>
    <font color="#0000FF">√</font>
    <% end if%>  	
    </td>
   <td width="78" >
	<p align="center"><font color="#FFFFFF"><strong><a href="task_tadd1.asp?Result=Modify&amp;ID=<%=rsobj("Sel_id")%>&amp;txtpage=<%=page%>"
	onClick='changeAdminFlag("修改课题")'><font color='#0000FF'>查看详情</font></a></strong></font></td>
        <td width="117">
		<p align="center"><font color="#FFFFFF"><strong><a href="javascript:DoEmpty(<%=rsobj("Sel_id")%>);" onclick="return confirm('是否确定删除?提醒：一旦点击确定，信息将全部删除')">
	<font color='#0000FF'>删除</font></a></strong></font></td>

  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
</form>
<form method="get" action="">
  <div align="center">每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height: 15px;" />
　
  <%
		if page <> 1 then
		response.Write"<a href=task_list.asp?txtpage=1>　第一页　</a>"
		response.Write"<a href=task_list.asp?txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=task_list.asp?txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=task_list.asp?txtpage="& rsobj.pagecount&">　最末页　</a>"
		end if
		'关闭链接
		rsobj.close
		set rsobj=nothing
		cnobj.close
		set cnobj=nothing
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
