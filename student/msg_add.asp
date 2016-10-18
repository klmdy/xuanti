<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
<title>查看教师</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<body>

    <br/>
	
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">
      <tr>
        <td height="20" align="right" colspan="2">
		<p align="center"><font color="#008000"><b>请给自己的指导教师反馈信息或者寻求帮助（</font><font color="#FF0000">如果还没有指导老师，将不能使用此项功能</font><font color="#008000">）</font></b></td>
      </tr>
      <tr>
        <td height="20" align="right">学生学号：</td>
        <td><div align="left">
            <input name="user_id" type="text" class="textfield" id="user_id" style="WIDTH: 120;" value="<%=session("user_no")%>" size="19" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">学生姓名：</td>
        <td><div align="left">
            <input name="user_name" type="text" class="textfield" id="user_name" style="WIDTH: 120;" value="<%=session("user_name")%>" size="19" <%response.write ("readonly")%>/>
            
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">指导老师：</td>
        <td><div align="left">                                   
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
      </select> <%
      rs1.close
				set rs1 = nothing
			%>
 </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">留言内容：</td>
        <td><div align="left">
            <textarea name="content" cols="60" rows="8" class="textfield" id="content" style="WIDTH: 580;" ></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
            <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit3" value=" 提 交 " style="WIDTH: 60;" />
        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />
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
</body>
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
		response.Redirect("msg_list.asp")
	end if
%>