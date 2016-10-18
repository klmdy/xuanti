<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题列表</title>
<style type="text/css">
<!--
.STYLE2 {color: #666666}
-->
</style>
</head>


<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>学生选题情况：查看所有已选题同学</strong></font></td>
  </tr>
  <tr>
    <td align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        方向：
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
      </form>
	
	
    </td>    
  </tr>
</table>
  <center>  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td nowrap="nowrap" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>学号</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>姓名</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>选题ID</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>选题名称</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>指导老师</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><strong><font color="#FFFFFF">选题方向</font></strong></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>选题难度</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>详情</strong></font></td>
      <td nowrap bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>状态</strong></font></td>
    </tr>
  <%
  		wh = ""
		Sel_cour=request.QueryString("Sel_cour")
		Sel_cour2=trim(request.form("Sel_cour"))
		Sel_level=request.QueryString("Sel_level")
		Sel_level2=trim(request.form("Sel_level"))
		tea_name=request.QueryString("tea_name")
		tea_name2=trim(request.form("tea_name"))
		keyword=trim(request.form("keyword"))
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
			wh = wh&" and Sel_name like '%"&keyword&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		'sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id and sel_flag=True "&wh&" order by Sel_id asc"
		sql = "select * from select_true selt,select_cursor sel,teacher_inf tea,student_info stu where selt.Tea_id=tea.Tea_id and  selt.St_number=stu.St_number and selt.sel_flag=false and selt.sel_id=sel.sel_id "&wh&" order by selt.St_number asc"
		'sql="select * from student_info"
		'response.Write(sql)
		rsobj.open sql,conn ,1,1
		
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=30 '分页输出 条/页
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount
		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>没有任何记录！！</strong>"
		response.End()
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td><%=rsobj("selt.St_number")%></td>
    <td><%=rsobj("St_name")%></td>
    <td><%=rsobj("sel.Sel_id")%></td>
    <td><%=rsobj("Sel_name")%></td>
    <td><%=rsobj("Tea_name")%></td>
    <td><%=rsobj("Sel_cour")%></td>
    <td><%=rsobj("Sel_level")%></td>
    <td><a href="task_add.asp?Result=Modify&ID=<%=rsobj("sel.Sel_id")%>&txtpage=<%=page%>"
	onClick='changeAdminFlag("修改课题")'><font color='#330099'>查看详情</font></a></td>
    <td>
	
	<%
		if rsobj("selt.sel_flag")=false then
	%>
	<span class="STYLE2">待确选</span>
	<%else%>
	<span class="STYLE2">已确选</span>
	<% end if %>	</td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center">每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
　
  <%
		if page <> 1 then
		response.Write"<a href=?txtpage=1>　第一页　</a>"
		response.Write"<a href=?txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=?txtpage="& rsobj.pagecount&">　最末页　</a>"
		end if
		'关闭链接
		rsobj.close
		set rsobj=nothing
		cnobj.close
		set cnobj=nothing
	%>
  </div>
</form>
</center>
</body>
</html>
