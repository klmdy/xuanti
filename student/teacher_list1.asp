<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<script language="javascript" src="../js/Admin.js"></script>

<link rel="stylesheet" href="../js/CssAdmin.css">

<title>教师列表</title></head>


<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->

<script language=JavaScript>
	function DoEmpty(ID)
	{

		if (confirm("真的要删除该信息吗？"))

		window.location = "teacher_add1.asp?Action=del&ID="+ID ;

	}
</script>

<body background="../Images/SysLeft_bg.gif">
  <div style="background-color:#6298E1;padding:5px;">
	<font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>教师管理：添加，修改教师信息</strong></font>
  </div>
  <div style="background-color:#EBF2F9;border:1px solid #6298E1;">
  	<center>
  		<br />
	  <form id="form1" name="form1" method="post" action="">所在院系：
	    <select name="res_name" id="res_name">
	    <option value="">请选择</option>
		    <%    

				set rs=server.createobject("adodb.recordset")    

				sql="select * from department " 

				rs.open sql,Conn,1,3

			%>

		    <%do while not rs.eof%>

		    <option value="<%=rs("D_no")%>"><%=rs("D_name")%></option>

		    <%

				rs.movenext

				loop

			%>
	    </select>
	  <input type="submit" name="Submit" value=" 搜 索 " />
	    <div style="margin:5px 0 5px 0;">
	　　  <a href="teacher_list1.asp" onclick='changeAdminFlag(查看教师列表)'>查看所有教师</a>
	　　  </font><a href="teacher_excel.asp" onclick='changeAdminFlag(&quot;导出到Excel表&quot;)'>导出所有教师信息（Excel表）</a>
	    </div>
      </form>
    </center>
</div>
<br />

  <center>

  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">

    <tr>

      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>教师编码</strong></font></td>

      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>所在院系</strong></font></td>

      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>教师名</strong></font></td>

      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>职称</strong></font></td>

      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>限带人数</strong></font></td>

      <td bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>电话</strong></font></td>

      <td bgcolor="#8DB5E9"><strong><font color="#FFFFFF">详细资料</font></strong></td>

    </tr>

  <%

  		wh = ""

		res_name=request("res_name")

		if res_name <> "" then

			wh = " and D_no = "&"'"&res_name&"' "

		end if

		set rsobj=server.CreateObject("adodb.recordset")

		'sql="Select * from teacher_inf "&wh

		sql ="select * from teacher_inf t,department res,zc_table zc where t.res_id=res.D_no and t.Zc_id=zc.Zc_id "&wh&" order by Tea_id asc"

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

		response.End()

		end if

		for i=1 to rsobj.pagesize

		if rsobj.eof then exit for

	%>

  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">

    <td><%=rsobj("Tea_id")%></td>

    <td><%=rsobj("D_name")%></td>

    <td><%=rsobj("Tea_name")%></td>

    <td><%=rsobj("zc_name")%></td>

    <td><%=rsobj("St_number")%></td>

    <td><%=rsobj("Tea_m_pone")%></td>

    <td><a href='teacher_add1.asp?Result=Modify&ID=<%=rsobj("Tea_id")%>' onClick='changeAdminFlag("修改教师")'><font color='#330099'>查看</font></a></td>

    </tr>

  <%

	rsobj.movenext

	next

  %>

</table>

<br />

<input type="button" class="button" id="back" style="width:60px;"/>
<form method="get" action="">

  <div align="center">
  	每页显示<strong> <%=rsobj.pagesize%> </strong>条　总记录:<strong><%=rsobj.recordcount%></strong><br /><br />
  总页数: <strong><%=rsobj.pagecount%></strong> 　目前页数:

    <input type="text" name="txtpage" value="<% =page %>" size="3" />

　

  <%

		if page <> 1 then

		response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage=1>　第一页　</a>"

		response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage="& (page-1)&">　上一页　</a>"

		end if 

		if page<>rsobj.pagecount then

		response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage="& (page+1)&">　下一页　</a>"

		response.Write"<a href=teacher_list1.asp?res_name="&res_name&"&txtpage="& rsobj.pagecount&">　最末页　</a>"

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
<script>
  function JachinId(x){
    return document.getElementById(x);
  }

  JachinId('back').value = "返回";
  JachinId('back').onclick = function () {
    window.location.href='bnuzitc1.asp';
  }
</script>
</html>

