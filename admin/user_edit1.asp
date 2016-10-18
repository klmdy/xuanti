<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
<script language="javascript" type="text/javascript"> 
	function ybx_add()
		{ 
			if (document.editForm.user_no.value.length == 0) { 
			alert("用户名不能为空!");
			document.editForm.user_no.focus();
			return false;
			}
			if (document.editForm.user_name.value.length == 0) { 
			alert("姓名不能为空!");
			document.editForm.user_name.focus();
			return false;
			}
			
			
		if (document.editForm.user_pass.value.length == 0) { 
			alert("密码不能为空!");
			document.editForm.user_pass.focus();
			return false;
			}
	
	if (document.editForm.user_pass.value != document.editForm.user_pass1.value) { 
			alert("两次密码输入不一致!");
			document.editForm.user_pass1.focus();
			return false;
			}

			return true;
		}
</script>
<title>修改个人信息</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
td{
    line-height: 25px;
  }
</style>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>修改个人信息</strong></font></td>
  </tr>
</table>
  <center>	
  
  
<%

'Action=addnew
	if request("Action") = "SaveEdit" then
		user_pass = request.form("user_pass")
		user_pass1 = request.form("user_pass1")
		        
		if user_pass = user_pass1 then
			set rs = server.createobject("adodb.recordset")
			sql="select * from user_table where user_no='"&request("ID")&"'"
			'response.Write(sql)
			rs.open sql,conn,1,3
			'rs("user_no")=trim(request.form("user_no"))
			'rs("user_name")=trim(request.form("user_name"))
			rs("user_pass")=trim(md5(request.form("user_pass")))		
			rs.update
			rs.close
			set rs = nothing
			'response.Write("密码修改成功，请返回……")
			'response.Redirect("user_edit.asp?ID="&request("ID"))
			'response.Redirect("bnuzitc.asp")
			response.Write("<script>alert('修改成功！请返回……');history.back()</script>")	


		end if
		response.Write("<script>alert('两次输入密码不一致！请返回……');history.back()</script>")
	end if
	
%>

<%
		
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from user_table where user_no='"&request("ID")&"'"	

	'response.Write(sql)
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="user_edit.asp?Action=SaveEdit&ID=<%=rs("user_no")%>"  onsubmit="return ybx_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

    	<tr>
        <td height="20" align="right">　</td>
        <td><div align="left"></div></td>
      </tr>
      <!-- <tr>
        <td width="20" height="20" align="right">　</td>
        <td><div align="left"><font color="#FF0000"><b>修改密码</b></font></div></td>
      </tr> -->
      <tr>
        <td height="20" align="right"><font color="#0000FF"><b>登录</b></font><b><font color="#0000FF">用户名：<br><br></font></b></td>
        <td><div align="left">
          <input name="user_no" type="text" class="textfield" id="user_no" style="WIDTH: 120;" value="<%=rs("user_no")%>" size="15" <%response.write ("readonly")%>>
          &nbsp;*<br>(不能重复，不能修改)</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#0000FF">姓名：</font></b></td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" value="<%=rs("user_name")%>" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><font color="#0000FF"><b>请</b></font><b><font color="#0000FF">输入密码：<br><br></font></b></td>
        <td><div align="left">
            <input name="user_pass" type="text" class="textfield" id="user_pass" style="WIDTH: 120;" value="" size="20"/>
          &nbsp;* <font color="#FF0000"><br>(请输入新密码) </font> </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#0000FF">请再次输入密码：<br><br></font></b></td>
        <td><div align="left">
            <input name="user_pass1" type="text" class="textfield" id="user_pass1" style="WIDTH: 120;" value="" size="20" /> 
			&nbsp;* <font color="#FF0000"><br>(请将密码再输入一遍)</font></div></td>
      </tr>     
      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" 修 改 " style="WIDTH: 60;" >        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
        </div></td>
      </tr>

      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
        <input type="button" class="button" onClick="javascript :history.back(-1);" value=" 返 回 " style="WIDTH: 60; margin-left: 40px; ">
        </div></td>
        </tr>

      <tr>
        <td height="20" align="right">　</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table>
	
	</td>
  </tr>
  </form>
</table>

</td>
  </tr>
  </form>
  <%

	rs.close
	set rs = nothing
	
%>
</center>
</body>
</html>
