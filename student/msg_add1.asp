<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" src="../js/Admin.js"></script>
<style>
	.Ja{
		margin:10px;
	}
</style>
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

<title>查看教师</title>

</head>



<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->

<body background="../Images/SysLeft_bg.gif">
<br/>
  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">
	<center>
    <p><font color="#008000" size="3px;"><b>请给自己的指导教师反馈信息或者寻求帮助</b></font></p>
    <p><font color="#FF0000">如果还没有指导老师，将不能使用此项功能</font></p>
    <center>

	<center>
	<div class="Ja" >学生学号：
      <input name="user_id" type="text" class="textfield" id="user_id" value="<%=session("user_no")%>" size="10" <%response.write ("readonly")%>/>
    </div>
    </center>

	
	<div class="Ja" ><center>学生姓名：
      <input name="user_name" type="text" class="textfield" id="user_name" value="<%=session("user_name")%>" size="10" <%response.write ("readonly")%>/>
    </div>
    </center>

    <center>
    <div class="Ja" >指导老师：
      <select name="student_number" id="student_name">		  
        <%    

			set rs1=server.createobject("adodb.recordset")    

			sql="select * from select_true sel  where sel.St_number='"&session("user_no")&"'" 

			rs1.open sql,Conn,1,3	

		%>

        <% do while not rs1.eof %>           

        <%

   			set rs=server.createobject("adodb.recordset")    

			sql="select * from teacher_inf  where Tea_id='"&rs1("Tea_id")&"'" 

			rs.open sql,Conn,1,3			

			do while not rs.eof

		%> 

	  <option value="<%=rs1("Tea_id")%>"><%=rs("Tea_name")%></option>
		<%

			rs.movenext

				loop	

		%>
        <%

			rs1.movenext

			loop

		%>				

      </select> &#12288;
        <%

      		rs1.close

			set rs1 = nothing

		%>

	</div>
	</center>

	<center>留言内容：&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;
	<div class="Ja" >
        <textarea name="content" cols="40" rows="8" class="textfield" id="content" ></textarea>
    </div>
    </center>

	<center>
	<div class="Ja" >
        <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit3" value=" 提 交 " />&#12288;
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " />&#12288;
        <input type="button" class="button" id="back" />
    </div>
	</center>
  </form>
</body>
<script>
  JachinId('back').value = "返回";
  JachinId('back').onclick = function () {
    window.location.href="bnuzitc1.asp";
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

		rs("user_id")=trim(request.form("student_number"))

		rs("user_name")=trim(request.form("user_id"))

		'rs("visible")=cint(request.form("student_number"))

		rs("visible")= 1  

		rs("content")=memo

		rs.update

		rs.close

		set rs = nothing

		conn.close

		set conn=nothing

		response.Redirect("msg_list1.asp")

	end if

%>