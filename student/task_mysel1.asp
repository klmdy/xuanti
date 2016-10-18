<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" src="../js/Admin.js"></script>

<title>添加修改课题</title>
<style>
	.Ja{
		margin: 5px;
	}
</style>
</head>

<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->

<script language=JavaScript>

	function DoEmpty()

	{

		window.location = "bnuzitc1.asp" ;

	}

</script>



<body background="../Images/SysLeft_bg.gif">
  <div style="background-color:#6298E1;padding:5px;">
	 <font color="FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>个人中心：查看选题</strong></font>
  </div>

  
	<div align="center" style="background-color:#EBF2F9;border:1px solid #6298E1;padding:10px;">
	  <b><font color="#FF0000">大家在选题的时候，请事先最好与指导老师进行沟通后进行选题！</font>
	</div>
  
  <br />	

	<center>	
	  <font color="#008000"><marquee width="100%" height="20">选题流程：①填写个人信息-&gt;②浏览选题,与指导教师协商选择自己感兴趣的选题-&gt;③等待审批-&gt;④经过审批通过后,在老师指导下完成毕业设计,并及时提交相关文档</marquee></font>
	</center>

  <%

	set rs1=server.CreateObject("adodb.recordset")

	sql = "select * from student_info where St_number='"&session("user_no")&"'"

	rs1.open sql,conn,1,1

	if rs1("allow_flag") = false then

	response.redirect  "task_list1.asp"	

  %>

  <%

  end if

  %>
  <%

	set rs1=server.CreateObject("adodb.recordset")

	sql = "select * from student_info where St_number='"&session("user_no")&"'"

	rs1.open sql,conn,1,1

	if rs1("select_flag") = false then

  %>

  
  	<center><h3>你还没有选题,现在<a href="task_list1.asp"><font color='#ff0000'>开始选题</font></a></h3></center>
  

  <%

	else

	set rs4=server.CreateObject("adodb.recordset")

	sql4="select * from sel_record where St_number='"&session("user_no")&"'"

	rs4.open sql4,conn,1,1


	set rs2=server.CreateObject("adodb.recordset")

	sql2="select * from select_cursor where sel_id = "&rs4("Sel_id")

	rs2.open sql2,conn,1,1



	set rs3=server.CreateObject("adodb.recordset")

	sql3="select * from teacher_inf where Tea_id = '"&rs2("Tea_id")&"'"

	rs3.open sql3,conn,1,1



	set rs5=server.CreateObject("adodb.recordset")

	sql5="select * from sel_record where sel_id = "&rs4("Sel_id")

	rs5.open sql5,conn,1,1

  %>

	<div id="bg" style="background:#D9E9FF;border:1px solid #6298E1;">
	  <div class="Ja" align="center">
	  	<b><font color="#800000">你的选题已经得到审批,选题情况以及小组成员如下：</font></b>
	  </div>
  
  	<div id="fbody" style="width:75%;margin:0 auto;">
	  <div class="Ja" align="left">
	  	<b><font color="#0000FF">指导老师：</font></b><%=rs3("Tea_name")%>      
	  </div>
  
	  <div class="Ja" align="left">
	  	<b><font color="#0000FF">小组组员：</font></b><br />
	    <%do while not rs5.eof%>
	    <span><%=rs5("St_name")%></span>，
	    <%
			rs5.movenext

			loop

			rs5.close

			set rs5 = nothing
	    %>
	  </div>
  
	  <div class="Ja" align="left">
		<b><font color="#0000FF">课题名称：</font></b><%=rs2("Sel_name")%>
	  </div>
  
	  <div class="Ja" align="left">
		<b><font color="#0000FF">难度系数：</font></b><%=rs2("Sel_level")%>
	  </div>

	  <div class="Ja" align="left">
		<b><font color="#0000FF">课题内容：</font></b>
	  </div>
	</div>

	
	  <div class="Ja" style="width:100%;">
	  	<center>
		  <textarea name="Sel_con" cols="40" rows="8" class="textfield" id="Sel_con" <%response.write ("readonly")%>><%=rs2("Sel_con")%></textarea>
		</center>
	  </div>
  	

  	
	  <div class="Ja" align="center">
	  	<form name="editForm" method="post" action="">
		<input name="submitSaveEdit3" type="button" class="button"  id="submitSaveEdit3" value=" 返 回 " onclick="javascript:DoEmpty()">
		</form>
	  </div>
  	</div>

  <%

	rs2.close

	set rs2 = nothing

	rs1.close

	set rs1 = nothing

	rs4.close

	set rs4 = nothing



	end if



  %>
</body>
</html>
<%

	Action=request.QueryString("Action")

	if Action = "del" then

		sql="delete from select_true where Sel_id='"&request("sel_id")&"'"

		response.Write(sql)

		conn.Execute(sql)

		set rs = server.createobject("adodb.recordset")

		sql1 = "select * from select_cursor where Sel_id="&request("sel_id")

		response.Write(sql1)

		rs.open sql1,conn,1,3

		rs("sel_flag")=false

		rs.update

		rs.close

		set rs=nothing

		conn.close

		set conn=nothing

		response.Redirect("task_mysel1.asp")

	end if

%>