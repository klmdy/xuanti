<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=0.5, user-scalable=yes" /> 

<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>

<title>课题选择</title>
<style>
  .Ja{
    margin: 5px;
    font-size: 30px;
    line-height: 50px;
  }
</style>
</head>



<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->

<body background="../Images/SysLeft_bg.gif">
  <center>
  <br/>
  <%

  '更新数据

  Result=request.QueryString("Result")

  	if Result = "Select" then

  	set rsp=server.CreateObject("adodb.recordset")

  	sql="select * from select_true where St_number='"&session("user_no")&"'"

  	

  	rsp.open sql,conn,1,3



  		if rsp.bof and rsp.eof then

           rsp.addnew

  		rsp("Sel_id") = request("ID")

  		rsp("St_number") = request("StudentID")

  		rsp("Tea_id") = request("TeacherID")

  		rsp.update

  		rsp.close

  		set rsp = nothing

  	else

  			response.Write("<script>alert('重复选题！请返回……');history.back()</script>")

  		    response.Redirect("task_list1.asp")

  		end if



  			

  	set rsp=server.CreateObject("adodb.recordset")

  	sql="select * from student_info where St_number='"&session("user_no")&"'"

  	rsp.open sql,conn,1,3

  		rsp("select_flag") = true

  		rsp.update		

  		rsp.close

  			set rsp = nothing

  			

  			

  	set rsp=server.CreateObject("adodb.recordset")

  	sql="select * from select_cursor  where Sel_id="&request("ID")	

  	rsp.open sql,conn,1,3

  	rsp("sel_flag") = rsp("sel_flag")+1

  	rsp.update		

  	rsp.close

  	set rsp = nothing



  			

  	set rsp=server.CreateObject("adodb.recordset")

  	sql="select * from sel_record where St_number='"&session("user_no")&"'"

  		rsp.open sql,conn,1,3	

  			if rsp.bof and rsp.eof then

  				rsp.addnew

  				rsp("St_number")=session("user_no")

  				rsp("Sel_id")=request("ID")

  				rsp("St_name")=session("studentname")

  				rsp.update

  				rsp.close

  				set rsp = nothing

  			end if	

  						

         

  		response.Redirect("task_list1.asp")

  		end if	

  %>



  <form id="form1" name="form1" method="post" action="task_add1.asp">

  <%

  	set rs=server.CreateObject("adodb.recordset")

  	sql="select * from select_cursor  where Sel_id="&request("ID")

  	rs.open sql,conn,1,1



  %>

    <div id="bd" align="center" style="width:85%;border:1px solid #6298E1;padding:10px;background-color:#EBF2F9">
      <div class="Ja" align="left">
        <font color="#0000FF">课题名称：</font><%=rs("Sel_name")%>
      </div>
      <div class="Ja" align="left">
        <font color="#0000FF">课题难度：</font><%=rs("Sel_level")%>
      </div>
      <div class="Ja" align="left">
        <font color="#0000FF">课题方向：</font><%=rs("Sel_cour")%>
      </div>

      <div class="Ja" align="left">
        <font color="#0000FF">限选人数：</font><%=rs("Sel_nu")%><font color="red">*</font>
      </div>

      <div class="Ja" align="left">
        <font color="#0000FF">课题要求：</font><%=rs("Sel_con")%>
      </div>
      
      <div class="Ja" align="left">
        <font color="#0000FF">指导老师：</font><%=request("teachername")%>
      </div>

      <br /><br />
      <div align="center">           		  		
        <b><a href="task_add1.asp?Result=Select&ID=<%=rs("Sel_id")%>&StudentID=<%=session("user_no")%>&TeacherID=<%=rs("Tea_id")%>"><font color="#0000FF" size="5px;">确定选题</font></a></b><br /><br /><br /><br />
        <input type="button" class="button" id="back" style="font-size:20px;"/>
      </div>
    </div>
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
  JachinId('back').value = " 返 回 ";
  JachinId('back').onclick = function () {
    window.location.href="task_list1.asp";
  }
</script>
</html>