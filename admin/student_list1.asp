<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=0.5, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>学生列表</title></head>
<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<script language=JavaScript>
	function DoEmpty(ID)
	{
		if (confirm("真的要删除该学生的信息吗？如果删除，该学生的所有信息包括选课记录全部将删除！"))
		window.location = "student_add1.asp?Action=del&ID="+ID;
	}
</script>
<script language=JavaScript>
	function DoEmpty1(ID)
	{
		if (confirm("确定审批通过吗？"))
		window.location = "student_add1.asp?Action=shenpi&ID="+ID ;
	}
</script>

<body>
<%
dim shenhe,arr,sql
shenhe=request.form("shenhe")
arr=split(shenhe,",")

	Action=request.QueryString("Action")
	
	if Action = "addnew" then
	set rs=server.createobject("adodb.recordset")   
	sql="update Student_info set St_agree=1 where ID in(" & shenhe & ")"
	rs.open sql,Conn,1,3
    conn.execute(sql)
	
		%>	
		<%	end if
%>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>学生审核</strong></font></td>
  </tr>
  <tr>
    <td  align="center" nowrap  bgcolor="#EBF2F9">
	<form action="student_list1.asp" method="post">
	
        年级：
          <select name="Sp_id" id="Sp_id" size="1">
		  <option selected value="">请选择年级</option>
		  <!-- <option value="2012">2012级</option>
        	<option value="2013">2013级</option>
			<option value="2014">2014级</option>
				  <option value="2015">2015级</option>
        	<option value="2016">2016级</option> -->
        	<%
			set rs=server.createobject("adodb.recordset")
			sql="select St_grade from student_info group by St_grade"
			rs.open sql,Conn,1,3
		%>
      <%do while not rs.eof%>
      <option value="<%=rs("St_grade")%>"><%=rs("St_grade")%></option>
      <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
		%>
&nbsp;
      </select>
    　班级：
    <select name="St_class" id="St_class">
      <option value="">请选择</option>
      <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select St_class from student_info group by St_class"    
			rs.open sql,Conn,1,3
		%>
      <%do while not rs.eof%>
      <option value="<%=rs("St_class")%>"><%=rs("St_class")%></option>
      <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
			%>
    </select>

    　选题情况：
          <select name="select_flag" id="select_flag" size="1">
		  <option selected value="">请选择</option>
		  <option value=-1>已选</option>
        	<option value=0>未选</option>
&nbsp;
      </select>
    
	　姓名：
	<input name="St_name" type="text" id="St_name" size="12" />	　
	<input type="submit" name="Submit" value=" 检 索 " />
	　<br><a href="student_list1.asp" onclick='changeAdminFlag(&quot;系统学生&quot;)'>查看所有学生</a>&nbsp;
	</form>
    </td>    
  </tr>
</table>
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
     <td  bgcolor="#8DB5E9" align="center"><b><font color="#800000">批量审核</font></b></td>
          <td bgcolor="#8DB5E9" align="center" width="10%"><strong>
		<font color="#800000">单次审核</font></strong></td>
      <td nowrap bgcolor="#8DB5E9" align="center"><font color="#800000"><strong>学号</strong></font></td>
      <td bgcolor="#8DB5E9" align="center" width="10%">
		<font color="#800000"><strong>姓名</strong></font></td>
      <td bgcolor="#8DB5E9" align="center" width="20%">
		<font color="#800000"><strong>专业</strong></font></td>
      <td bgcolor="#8DB5E9" align="center" width="5%">
		<font color="#800000"><strong>年级</strong></font></td>
      <td bgcolor="#8DB5E9" align="center" width="5%">
		<font color="#800000"><strong>班级</strong></font></td>
      <td nowrap bgcolor="#8DB5E9" align="center" width="10%"><strong>
		<font color="#800000">手机号码</font></strong></td>
      <td bgcolor="#8DB5E9" align="center" width="10%">
		<font color="#800000"><strong>邮箱</strong></font></td>
 
      <td bgcolor="#8DB5E9" width="10%" align="center">
		<p align="center"><font color="#800000"><strong>删除该生信息</strong></font></td>
    </tr>
  <%
  		dim wh,Sp_id,St_class,St_name,select_flag
  		wh = ""
		Sp_id=request("Sp_id")
		St_class=request("St_class")
		St_name=request("St_name")
		select_flag=request("select_flag")
		if Sp_id <> "" then
			wh = " and st.St_grade = "&"'"&Sp_id&"' "
		end if
		if St_class <> "" then
			wh = wh&" and St_class = "&"'"&St_class&"' "
		end if
		if select_flag <> "" then
			wh = wh&" and select_flag = "&select_flag 
		end if
		if St_name <> "" then
			wh = wh&" and St_name like '%"&St_name&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		sql="Select * from Student_info st,speciality sp where st.Sp_id=sp.Sp_id "&wh&" order by st.ID desc"
		'sql="Select * from user_table,user_type where user_table.U_t_id=user_type.U_T_id "&wh&"order by user_no asc"
		'response.Write(sql)
'		rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=25 '分页输出 条/页
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
	<form id="form1" name="form1" method="post" action="student_list1.asp?Action=addnew">
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
   <td> <input type="checkbox" name="shenhe" value=<%=rsobj("st.ID")%> /></td>
     <td width="10%">
    <%
    if rsobj("St_agree") = false then 
 %>
    还未审核，请<a href="javascript:DoEmpty1(<%=rsobj("st.ID")%>);" onClick='changeAdminFlag("确定吗")'><font color="#FF0000">审核</font></a>
<%
    else 
 %>
    已经审核，可<a href="javascript:DoEmpty1(<%=rsobj("st.ID")%>);" onClick='changeAdminFlag("确定吗？")'><font color="#0000FF">取消</font></a>
  <%
    end if 
 %>

    </a></td>
    <td width="10%"><%=rsobj("St_number")%></td>
    <td width="10%"><%=rsobj("St_name")%></td>
    <td width="20%"><%=rsobj("Sp_name")%></td>
    <td width="5%"><%=rsobj("St_grade")%></td>
    <td width="5%"><%=rsobj("St_class")%></td>
    <td width="10%"><%=rsobj("St_m_phone")%></td>
    <td width="20%"><%=rsobj("St_email")%></td>
  
  <td width="137">
	<p align="center">
	<a href="student_add1.asp?Action=del&stn=<%=rsobj("St_number")%>&ID=<%=rsobj("st.ID")%>;"  onclick="return confirm('是否确定将该生信息删除?提醒：一旦点击确定，该生所有信息将全部删除')"><font color='#FF0000'>删除</font></a> 
	
	<%
	rsobj.movenext
	next
  %>
</table>
<br>
 <input name="shenhebutton" type="submit" class="button"  id="shenhe" value="批量审核" style="WIDTH: 60;" onclick="return confirm('确定这批学生审批通过吗？')">

 
	<form method="get" action="">
  <div align="center"><br>每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong> 　			总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
　
  <%
		if page <> 1 then
		response.Write"<a href=student_list1.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage=1>　第一页　</a>"
		response.Write"<a href=student_list1.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage="& (page-1)&">　上一页　</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=student_list1.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage="& (page+1)&">　下一页　</a>"
		response.Write"<a href=student_list1.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage="& rsobj.pagecount&">　最末页　</a>"
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
