<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=0.5, user-scalable=yes" /> 

<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>

<title>课题列表</title>

</head>



<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->





<script language=JavaScript>

	function DoEmpty(ID)

	{

		if (confirm("真的要删除该信息吗？"))

		window.location = "task_add1.asp?Action=del&ID="+ID ;

	}

</script>

<body>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">

  <tr>

    <td height="24" nowrap>

	<p align="center"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle"><strong>选题信息</strong></font></td>

  </tr>

  <tr>

    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">

	

	<form id="form1" name="form1" method="post" action="task_list1.asp">

        <p>方向：

		

		

            <select name="Sel_cour" id="Sel_cour">

			<option value="">请选择</option>

         <%    

			set rs=server.createobject("adodb.recordset")    

			sql="select Sel_cour from select_cursor group by Sel_cour"    

			rs.open sql,Conn,1,1

		%>

              <%do while not rs.eof%>

              <option value="<%=rs("Sel_cour")%>"><%=rs("Sel_cour")%></option>

              <%

				rs.movenext

				loop

				rs.close

				set rs = nothing

			%>

          </select>  

		  

		  

    　难度：

          <select name="Sel_level" id="sel2">

			<option value="">请选择</option>

         <%    

			set rs=server.createobject("adodb.recordset")    

			sql="select Sel_level from select_cursor group by Sel_level"    

			rs.open sql,Conn,1,1

		%>

            <%do while not rs.eof%>

            <option value="<%=rs("Sel_level")%>"><%=rs("Sel_level")%></option>

            <%

				rs.movenext

				loop

				rs.close

				set rs = nothing

			%>

          </select>

		  

	指导老师：

          <select name="tea_name" id="tea_name" >

		  <option value="">请选择</option>

            <%    

			set rs=server.createobject("adodb.recordset")    

			sql="select Tea_id,Tea_name from teacher_inf order by Tea_name asc"    

			rs.open sql,Conn,1,1

		%>

            <%do while not rs.eof%>

            <option value="<%=rs("Tea_id")%>"><%=rs("Tea_name")%></option>

            <%

				rs.movenext

				loop

				rs.close

				set rs = nothing

			%>

          </select>

　关键字：

	<input name="keyword" type="text" id="keyword" size="12" />

	　

	<input type="submit" name="Submit" value=" 检 索 " />

	　</p>

          <p>

		  <a href="task_list1.asp" onclick='changeAdminFlag(&quot;系统课题&quot;)'>查看所有选题</a>

	            </p>

	</form>

    </td>    

  </tr>

</table>

<br />





 <%  

   set rsp=server.CreateObject("adodb.recordset")

	sql="select * from student_info where St_number='"&session("user_no")&"'"

	rsp.open sql,conn,1,3
	

   if  rsp("allow_flag") = true  then  

      response.redirect "task_mysel1.asp"%>

   <%else%>

  <center>

  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">

    <tr>

      <td nowrap bgcolor="#8DB5E9" align="center"><font color="#800000"><strong>ID</strong></font></td>

      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">

		<font color="#800000"><strong>选题名称</strong></font></td>

      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">

		<font color="#800000"><strong>选题方向</strong></font></td>

      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">

		<font color="#800000"><strong>选题难度</strong></font></td>

      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center">

		<font color="#800000"><strong>指导老师</strong></font></td>

      <td nowrap bgcolor="#8DB5E9" align="center"><strong><font color="#800000">主要内容</font></strong></td>

      <td nowrap bgcolor="#8DB5E9" align="center" width="127">

		<font color="#800000"><strong>选题情况</strong></font></td>

      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center"><strong>

		<font color="#800000">开始选题</font></strong></td>

    </tr>

  <%

  		wh = ""

		Sel_cour=request.QueryString("Sel_cour")

		Sel_cour2=request("Sel_cour")

		Sel_level=request.QueryString("Sel_level")

		Sel_level2=request("Sel_level")

		tea_name=request.QueryString("tea_name")

		tea_name2=request("tea_name")

		keyword=request("keyword")

		if Sel_cour <> "" then

			wh = wh&" and Sel_cour = "&"'"&Sel_cour&"' "

		end if

		if Sel_cour2 <> "" then

			wh = wh&" and Sel_cour = "&"'"&Sel_cour2&"' "

		end if

		
		if Sel_level <> "" then

			wh = wh&" and Sel_level = "&"'"&Sel_level&"' "

		end if

		if Sel_level2 <> "" then

			wh = wh&" and Sel_level = "&"'"&Sel_level2&"' "

		end if

				
		if tea_name <> "" then

			wh = wh&" and sel.Tea_id = "&"'"&tea_name&"' "

		end if

		if tea_name2 <> "" then

			wh = wh&" and sel.Tea_id = "&"'"&tea_name2&"' "

		end if

		if keyword <> "" then

			wh = wh&" and ( Sel_con like '%"&keyword&"%' or Sel_name like '%"&keyword&"%' ) "

		end if

		set rsobj=server.CreateObject("adodb.recordset")

		sql = "select * from select_cursor sel,teacher_inf tea,speciality sp where sp.sp_id=sel.sp_id and sel.check = true and sel.Tea_id=tea.Tea_id "&wh&" order by Sel_id asc"

		rsobj.open sql,conn ,1,1

		page=cint(request.QueryString("txtpage"))

		rsobj.pagesize=30 '分页输出 条/页

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

  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">

    <td><%=rsobj("Sel_id")%></td>

    <td><%=rsobj("Sel_name")%></td>

    <td><%=rsobj("Sel_cour")%></td>

    <td><%=rsobj("Sel_level")%></td>

    <td><%=rsobj("Tea_name")%></td>

    <td><p align=left><%=rsobj("Sel_con")%></p></td>

    <td width="127">

	<% if rsobj("sel_flag") < rsobj("Sel_nu")  then%>课题可选人数:<%=rsobj("Sel_nu")%>

<br>目前已选人数:<%=rsobj("sel_flag")%>

	</td>

  <td width="102">

   <%  

   set rsp=server.CreateObject("adodb.recordset")

	sql="select * from student_info where St_number='"&session("user_no")&"'"

	rsp.open sql,conn,1,3

	

   if  rsp("select_flag") = false  then %>

   <a href='task_add1.asp?Result=Modify&ID=<%=rsobj("Sel_id")%>&teachername=<%=rsobj("Tea_name")%>' onClick='changeAdminFlag("开始选题")'><b><font color="#0000FF">

	选择此题</font></b></a>

	

	



	<%else%>



	<font color="#FF0000"><b>你已经选题，正在等待批复！</b></font>

	<% end if

	       rsp.close

			set rsp = nothing %>



	

    	</td>

	<%else%>

	<font color="#FF0000"><b>该课题人数已经选满</b></font>

	</td>

    <td>

    </td>

  	<% end if%>	

    </tr>

  <%

	rsobj.movenext

	next

  %>

</table><br /><br />
    <input type="button" class="button" id="back" />
<br /><br />

<form method="get" action="">

  <div align="center">每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:

    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />

　

  <%

		if page <> 1 then

		response.Write"<a href=task_list1.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage=1>　第一页　</a>"

		response.Write"<a href=task_list1.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page-1)&">　上一页　</a>"

		end if 

		if page<>rsobj.pagecount then

		response.Write"<a href=task_list1.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page+1)&">　下一页　</a>"

		response.Write"<a href=task_list1.asp?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& rsobj.pagecount&">　最末页　</a>"

		end if

		'关闭链接

		rsobj.close

		set rsobj=nothing

	%>

	

  </div>

</form>

</center>



<%

Action=request.QueryString("Result")

if Action = "check" then

	set rs = server.createobject("adodb.recordset")

	sql="select * from select_cursor where Sel_id="&request("ID")

	response.Write(sql)

	rs.open sql,conn,1,3

		rs("check")=true

		rs.update

		rs.close

		set rs = nothing

		response.Redirect("task_list1.asp?txtpage="&request("txtpage"))

end if

%>

</body>
<script>
  JachinId('back').value = "返回";
  JachinId('back').onclick = function () {
    window.location.href="bnuzitc1.asp";
  }
</script>

</html>
<% end if %>