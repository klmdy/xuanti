<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>添加修改课题</title>
</head>
<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty()
	{
		window.location = "SysCome.asp" ;
	}
</script>

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>个人中心：查看选题</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
	<b>
	<font color="#FF0000">
	大家在选题的时候，请事先最好与指导老师进行沟通后进行选题！</font><br>	
	</td>    
  </tr>
</table>
<font color="#008000">
	<marquee width="574" height="20">选题流程：①填写个人信息-&gt;②浏览选题,与指导教师协商选择自己感兴趣的选题-&gt;③等待审批-&gt;④经过审批通过后,在老师指导下完成毕业设计,并及时提交
	相关文档</marquee></font>
  <center>
  
     <%
	set rs1=server.CreateObject("adodb.recordset")
	sql = "select * from student_info where St_number='"&session("user_no")&"'"
	rs1.open sql,conn,1,1
	if rs1("allow_flag") = false then
	    response.redirect  "task_list.asp"	
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

    <p>　</p>
    <p>　</p>
    <p>&nbsp;    </p>
    <h3>你还没有选题,现在<a href="task_list.asp"><font color='#ff0000'>开始选题</font></a></h3>   
    
  
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

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">　</td>
        <td><div align="left"><b><font color="#800000">你的选题已经得到审批,选题情况以及小组成员如下：</font></b></div></td>
      </tr>
      <tr>
        <td height="24" align="right"><b><font color="#0000FF">指导老师：</font></b></td>
        <td><div align="left">
            <%=rs3("Tea_name")%>        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#0000FF">小组组员：</font></b></td>
        <td><div align="left">
             <%do while not rs5.eof%>
              <option value="<%=rs5("St_name")%>"><%=rs5("St_name")%></option>
              <%
				rs5.movenext
				loop
				rs5.close
				set rs5 = nothing
			%>       
            
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#0000FF">课题名称：</font></b></td>
        <td><div align="left">
           <%=rs2("Sel_name")%>
        </div></td>
      </tr>         
      <tr>
        <td height="16" align="right"><b><font color="#0000FF">难度系数：</font></b></td>
        <td><div align="left">
           <%=rs2("Sel_level")%>
        </div></td>
      </tr>   
      <tr>
        <td height="20" align="right" valign="top"><b><font color="#0000FF">课题内容：</font></b></td>
        <td><div align="left">
            <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" <%response.write ("readonly")%>><%=rs2("Sel_con")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
  <form name="editForm" method="post" action="">
            <input name="submitSaveEdit3" type="button" class="button"  id="submitSaveEdit3" value=" 返回首页 " style="WIDTH: 60;" onclick="javascript:DoEmpty()">
  </form>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">　</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
</table>

</td>
  </tr>
  <%
	rs2.close
	set rs2 = nothing
	rs1.close
	set rs1 = nothing
  	rs4.close
	set rs4 = nothing
	
end if

%>
</center>
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
		response.Redirect("task_mysel.asp")
	end if
%>