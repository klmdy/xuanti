<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>发送指导意见</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.user_id.value.length == 0) { 
			alert("请输入编号!");
			document.editForm.user_id.focus();
			return false;
			}
			if (document.editForm.user_name.value.length == 0) { 
			alert("请输入姓名!");
			document.editForm.user_name.focus();
			return false;
			}
			if (document.editForm.content.value.length == 0) { 
			alert("请输入留言内容!");
			document.editForm.content.focus();
			return false;
			}
			return true;
		}
</script>
<style type="text/css">
body
{
 width: 100%;
 height: 100%;
}
</style>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body  scroll="no" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>请给学生提出建议</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="msg_add.asp" onClick='changeAdminFlag("添加管理员")'>添加留言</a><font color="#0000FF">&nbsp;</font></td>
  </tr>
</table>
    <br/>
	
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">
      <tr>
        <td width="120" height="20" align="right">　</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
            <td width="25%" height="25%" align="right">用户编号：</td>
        <td><div align="left">
            <input name="user_id" type="text" class="textfield" id="user_id" style="WIDTH: 120;" value="<%=session("user_no")%>" size="19" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="25%" align="right">用户姓名：</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" value="<%=session("user_name")%>" size="19" <%response.write ("readonly")%>/>
            
        </div></td>
      </tr>
      <tr>
        <td height="25%" align="right">针对学生：</td>
        <td><div align="left">                                   
             <select name="student_number" id="student_name">		  
        <%    
			set rs1=server.createobject("adodb.recordset")    
			sql="select * from select_true sel  where sel.Tea_id='"&session("user_no")&"'" 
			rs1.open sql,Conn,1,3	
		%>
        <% do while not rs1.eof %>           
         <%
   set rs=server.createobject("adodb.recordset")    
			sql="select * from student_info  where St_number='"&rs1("St_number")&"'" 
			rs.open sql,Conn,1,3			
			do while not rs.eof
			%> 
	 <option value="<%=rs1("St_number")%>"><%=rs("St_name")%></option>

			<%
			rs.movenext
				loop
			
			%>
		

   
        <%
				rs1.movenext
				loop
				%>				
      </select> <%
      rs1.close
				set rs1 = nothing
			%>
 </div></td>
      </tr>
      <tr>
        <td height="25%" align="right" valign="top">留言内容：</td>
        <td><div align="left">
            <textarea name="content" cols="30" rows="8" class="textfield" id="content" style="width: auto;" ></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="25%" align="right">　</td>
        <td valign="bottom">
        <div align="left">
            <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit3" value=" 提 交 " style="width: 25%;" />
            <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style=" width: 25%;" />
            <input name="back" type="button" class="button" value="返 回" style="width:25%;" onclick="selectSysLeft()"/>
        </div>

        </td>
      </tr>
      <tr>
        <td height="20" align="right">　</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
  </form>

</table>


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

<%
	Action=request.QueryString("Action")
	if Action = "addnew" then
	memo=server.HTMLEncode(request("content"))
	memo=replace(memo,vbcrlf,"<br>")
	memo=replace(memo," ","&nbsp;&nbsp;")
	memo=replace(memo,"'","''")
	set rs = server.createobject("adodb.recordset")
	sql="select * from message"
	rs.open sql,conn,1,3
		rs.addnew
		rs("user_id")=trim(request.form("user_id"))
		rs("user_name")=trim(request.form("student_number"))
		'rs("visible")=cint(request.form("student_number"))
		rs("visible")= 0  
		
		rs("content")=memo
		rs.update
		rs.close
		set rs = nothing
		conn.close
		set conn=nothing
		response.Redirect("msg_list1.asp")
	end if
%>