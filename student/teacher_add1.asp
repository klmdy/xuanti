<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" src="../js/Admin.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 


<title>查看教师</title>
<style>
  .Ja{
    margin: 5px;
  }
</style>
</head>





<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->



<body background="../Images/SysLeft_bg.gif">

  <div style="background-color:#6298E1;padding:5px;">
    <font color="blue"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>教师管理：添加，修改教师信息</strong></font>
  </div>

  <center>
  <div style="background-color:#EBF2F9;border:1px solid #6298E1;padding:10px;">
    <font color="#0000FF"></font><a href="teacher_list1.asp" onClick='changeAdminFlag("系统管理员")'>查看所有教师</a>   
  </div>
</center>

  <center>
  <%
  	set rs=server.CreateObject("adodb.recordset")

  	sql="select * from teacher_inf where Tea_id="&"'"&request("ID")&"'"

  	'response.Write(sql)

  	rs.open sql,conn,1,1
  %>

  <form name="editForm" method="post" action="?Action=SaveEdit">
  <div class="Ja">教师编号：
    <input name="Tea_id" type="text" class="textfield" id="Tea_id" style="WIDTH: 120;" value="<%=rs("Tea_id")%>" size="15" <%response.write ("readonly")%>/>&#12288;&#12288;
  </div>

  <div class="Ja">教师姓名：
    <input name="Tea_name" type="text" class="textfield" id="Tea_name" style="WIDTH: 120;" value="<%=rs("Tea_name")%>" size="15" <%response.write ("readonly")%>/>&#12288;&#12288;
  </div>

  <div class="Ja">教研室：
    <select name="res_id" id="res_id" <%response.write ("readonly")%>>
    <%    
				set rs1=server.createobject("adodb.recordset")    

				sql="select * from res_table "    

				rs1.open sql,Conn,1,3
		%>
    <%do while not rs1.eof%>

      <option value="<%=rs1("res_id")%>"

					<% if rs1("res_id")=rs("res_id") then response.Write("selected='selected'") end if%>

					><%=rs1("res_name")%></option>

    <%
				rs1.movenext

				loop
		%>

    </select>&#12288;&#12288;&#12288;&#12288;&#12288;
  </div>

  <div class="Ja">限带人数：
    <input name="St_number" type="text" id="St_number" value="<%=rs("St_number")%>" size="5" <%response.write ("readonly")%>/><font color="red">*最多不超过10个</font>
    <div class="Ja"></div>
  </div>

  <div class="Ja">电话号码：
    <input name="Tea_phone" type="text" class="textfield" id="Tea_phone" style="WIDTH: 120;" value="<%=rs("Tea_phone")%>" size="15" <%response.write ("readonly")%>/>&#12288;&#12288;
  </div>

  <div class="Ja">手机号码：
    <input name="Tea_m_pone" type="text" class="textfield" id="Tea_m_pone" style="WIDTH: 120;" value="<%=rs("Tea_m_pone")%>" size="15" <%response.write ("readonly")%>/>&#12288;&#12288;
  </div>

  <div class="Ja">教师邮箱：
    <input name="Tea_email" type="text" class="textfield" id="Tea_email" value="<%=rs("Tea_email")%>" size="15" <%response.write ("readonly")%>/>&#12288;&#12288;
  </div>

  <div class="Ja">教师职称：

    <select name="Zc_id" id="select2">

      <%    

				set rs1=server.createobject("adodb.recordset")    

				sql="select * from zc_table "    

				rs1.open sql,Conn,1,3

			%>

      <%do while not rs1.eof%>

      <option value="<%=rs1("zc_id")%>"

				<% if rs1("zc_id")=rs("zc_id") then response.Write("selected='selected'") end if%>

			><%=rs1("zc_name")%></option>

      <%

				rs1.movenext

				loop

			%>
    </select>&#12288;&#12288;&#12288;&#12288;
  </div>

  <div>教师简介：&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
  <div class="Ja">
    <textarea name="Tea_intru" cols="28" rows="5" class="textfield" id="Tea_intru" <%response.write ("readonly")%>><%=rs("Tea_intru")%></textarea>
  </div>

  <div class="Ja">
    <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value="  确 定 " style="WIDTH: 60;">&#12288;&#12288;
    <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />&#12288;&#12288;
    <input type="button" class="button" id="back" style="width:60px;"/>
  </div>
  <br />
  <br />
  <br />
</form>

  <%

  	rs1.close

  	set rs1 = nothing

  	rs.close

  	set rs = nothing

  %>

</center>

</body>
<script>
  function JachinId(x){
    return document.getElementById(x);
  }

  JachinId('back').value = "返回";
  JachinId('back').onclick = function () {
    window.location.href='teacher_list1.asp';
  }
</script>
</html>

<%

	Action=request.QueryString("Action")

	if Action = "SaveEdit" then

		response.Redirect("teacher_list1.asp")

	end if

%>