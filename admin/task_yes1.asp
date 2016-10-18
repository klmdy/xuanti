<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=0.5, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题列表</title>
<style type="text/css">
<!--
.STYLE2 {color: #666666}
.STYLE3 {color: #FF0000}
-->
</style>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;</font><font color="#FFFF00"><strong>学生选题情况：查看所有已选题同学</strong></font></td>
  </tr>
  <tr>
    <td align="center" nowrap  bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="task_yes1.asp" style="line-height: 23px; ">
        请选择年级：
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
　<br>关键字：
	<input name="keyword" type="text" id="keyword" size="12" />
	　
	<input type="submit" name="Submit" value=" 检 索 " />
      </form>
    </td>    
  </tr>
</table>
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td bgcolor="#8DB5E9" align="center" width="10%">
		<font color="#800000"><strong>学号</strong></font></td>
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center" width="5%">
		<font color="#800000"><strong>姓名</strong></font></td> 
		  <td bgcolor="#8DB5E9" align="center" width="5%"><strong><font color="#800000">年级</font></strong></td>       
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center" width="25%">
		<font color="#800000"><strong>选题名称</strong></font></td>
		
      <td nowrap="nowrap" bgcolor="#8DB5E9" align="center" width="5%">
		<font color="#800000"><strong>指导老师</strong></font></td>
       
      <td nowrap bgcolor="#8DB5E9" align="center" width="10%"><strong><font color="#800000">
		该生毕设材料</font></strong></td>
      <td bgcolor="#8DB5E9" align="center"><font color="#800000"><strong>状态</strong></font></td>
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
			wh = wh&" and Sel_name like '%"&keyword&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		'sql = "select * from select_cursor sel,teacher_inf tea where sel.Tea_id=tea.Tea_id and sel_flag=True "&wh&" order by Sel_id asc"
		sql = "select * from select_true selt,select_cursor sel,teacher_inf tea,student_info stu,speciality sp where sp.sp_id=sel.sp_id and  selt.Tea_id=tea.Tea_id and  selt.St_number=stu.St_number and selt.sel_flag=True and selt.sel_id=sel.sel_id "&wh&" order by stu.St_name asc"
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
		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'"  style='cursor:hand'  title="<%=rsobj("Sel_con")%>">
    <td width="10%"><%=rsobj("selt.St_number")%></td>
    <td width="5%"><a href='student_add1.asp?ID=<%=rsobj("stu.ID")%>' onClick='changeAdminFlag("查看学生信息")'><font color='#330099'><%=rsobj("St_name")%></font></a></td>
    <td width="5%"><%=rsobj("Sel_cour")%></td>
    <td width="25%"><p align=left><a href='sel_detail.asp?ID=<%=rsobj("sel.Sel_id")%>'  onClick='changeAdminFlag("查看详情")'><font color='#330099'><%=rsobj("Sel_name")%></font></a></p></td>
      <td width="5%"><%=rsobj("Tea_name")%></td>
        <td width="10%">
		<p align="center"><font color="#008000"><a href="file_download.asp?ID=<%=rsobj("selt.St_number")%>" target="mainFrame">
		查看该生毕设材料</font></a></td>
    <td width="10%"">	
	<%
		if rsobj("selt.sel_flag")=false then
	%>
	<span class="STYLE2"><font color="#FF0000">还未选题</font></span>
	<%else%>
	<span class="STYLE2"><font color="#0000FF">已确选</font></span>
	<% end if %>	</td>
  </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center"><a href="task_yes_excel.asp" class="STYLE3">导出报表</a>　　每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
　
  <%
		if page <> 1 then
		response.Write"<a href=?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage=1>　第一页　</a>"
		response.Write"<a href=?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=?Sel_cour="&Sel_cour2&"&Sel_level="&Sel_level2&"&tea_name="&tea_name2&"&keyword="&keyword&"&txtpage="& rsobj.pagecount&">　最末页　</a>"
		end if
		'关闭链接
		rsobj.close
		set rsobj=nothing
		cnobj.close
		set cnobj=nothing
	%>
  </div>
  <br>
  <input type="button" class="button" onclick="location.href='bnuzitc1.asp'" value=" 返 回 " style="WIDTH: 60;">		
</form>
</center>
</body>
</html>
