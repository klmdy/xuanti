<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题选择</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<body>

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
		    response.Redirect("task_list.asp")
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
						
       
		response.Redirect("task_list.asp")
		end if	
%>

<form id="form1" name="form1" method="post" action="task_add.asp">
<table width="54%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">


<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from select_cursor  where Sel_id="&request("ID")
	rs.open sql,conn,1,1

%>

  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">　</td>
        <td><div align="left">　</div></td>
      </tr>
     
      <tr>
        <td height="20" align="right">课题名称：</td>
        <td><div align="left">
        <%=rs("Sel_name")%>
        </div></td>
      </tr>
     
        <td height="20" align="right">课题难度：</td>
        <td><div align="left">
           <%=rs("Sel_level")%>
        </div></td>
      </tr>
      <tr>
        <td height="16" align="right">课题方向：</td>
        <td><div align="left">
           <%=rs("Sel_cour")%>
        </div></td>
      </tr>
      <tr>
        <td height="24" align="right">限选人数：</td>
        <td><div align="left">
           <%=rs("Sel_nu")%>
          	* </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">课题要求：</td>
        <td><div align="left">
            <%=rs("Sel_con")%>
        </div></td>
      </tr>
       <tr>
        <td height="20" align="right">指导老师：</td>
        <td><div align="left">
            <%=request("teachername")%>
        </div></td>
      </tr>
     
          
      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
            		  			
	<b>
            		  			
	<a href="task_add.asp?Result=Select&ID=<%=rs("Sel_id")%>&StudentID=<%=session("user_no")%>&TeacherID=<%=rs("Tea_id")%>">
	<font color="#0000FF">确定选题</font></a></b>

        </div></td>
      </tr>

      <tr>
        <td height="20" align="right">　</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>

</td>
  </tr>
  </form>
  <%
  	rs1.close
	set rs1 = nothing
	rs.close
	set rs = nothing

%>
</center>
</body>
</html>