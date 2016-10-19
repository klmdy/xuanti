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

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>课题管理：添加，修改课题信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="task_list.asp" onClick='changeAdminFlag("系统管理员")'>查看所有课题</a><font color="#0000FF">&nbsp;</font>|&nbsp;</font><a href="task_excel.asp" onclick='changeAdminFlag(&quot;导出所有课题信息&quot;)'>导出课题信息（Excel表）</a>	</td>    
  </tr>
</table>
  <center>
    <br/>
<%
	'更新数据
	Result=request.QueryString("Result")
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from select_cursor sel,teacher_inf tea,zc_table zc where sel.Tea_id=tea.Tea_id and zc.Zc_id=tea.Zc_id and Sel_id="&request("ID")
	'response.Write(sql)
	rs.open sql,conn,1,1

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="task_add.asp?Action=SaveEdit&ID=<%=request("ID")%>&txtpage=<%=request("txtpage")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="120" height="20" align="right">　</td>
        <td><div align="left"></div></td>
      </tr>
    
       <tr>
        <td height="20" align="right">课题名称：
        
        
        </td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" value="<%=rs("Sel_name")%>" size="60" <%response.write ("readonly")%>/>
        </div></td>
      </tr>

      <tr>
        <td height="20" align="right">指导老师：</td>
        <td><div align="left">
            <input name="textfield3" type="text" value="<%=rs("tea_name")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">老师电话：</td>
        <td><div align="left">
            <input name="textfield2" type="text" value="<%=rs("Tea_m_pone")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">老师Email：</td>
        <td><div align="left">
            <input name="textfield" type="text" value="<%=rs("Tea_email")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">老师职称：</td>
        <td><div align="left">
            <input name="textfield3" type="text" value="<%=rs("zc_name")%>" <%response.write ("readonly")%>/>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">课题系数：</td>
        <td><div align="left">
                      
            <select size="1" name="textfield2" id="textfield2">
  <option value="0.6" selected>0.6-容易</option>
  <option value="0.7">0.7-一般</option>
   <option value="0.8">0.8-中等</option>
    <option value="0.9">0.9-较难</option>
     <option value="1.0">1.0-很难</option>
   </select>

            
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">课题方向：</td>
        <td><div align="left">
             <select size="1" name="textfield" id="textfield">
  <option value="物联网" selected>物联网</option>
  <option value="嵌入式">嵌入式</option>
   </select>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">限选人数：</td>
        <td><div align="left">
            <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="<%=rs("Sel_nu")%>" size="5" <%response.write ("readonly")%>/>
          * 根据课题难度适当安排 </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">课题要求：</td>
        <td><div align="left">
            <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" <%response.write ("readonly")%>><%=rs("Sel_con")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
            		  			<%		address = request.ServerVariables("HTTP_REFERER")%>
			<input type="button" name="submitSaveEdit3" value="返回上一页" class="button" onclick="javascript:window.location.href='<%=address%>';" style="WIDTH: 60;">            

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
	end if
%>
</center>
</body>
</html>


<%
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		response.Redirect("task_list.asp?txtpage="&request("txtpage"))
	end if
		
	'判断老师限带人数、确定选题、删除其他选题学生
	if Action = "yes" then
		'判断老师带的人数是否超过
		set rsp = server.createobject("adodb.recordset")
		sql="select * from select_true where Sel_flag=true and Tea_id='"&session("user_no")&"'"
		rsp.open sql,conn,1,1
		
		set rsq = server.createobject("adodb.recordset")
		sql="select St_number from teacher_inf where Tea_id='"&session("user_no")&"'"
		rsq.open sql,conn,1,1
		'response.Write(rsq("St_number"))
		if rsp.recordcount < rsq("St_number") then
				'更新选题标识
				set rs = server.createobject("adodb.recordset")
				sql = "select * from select_true where St_number='"&request("scid")&"' and Sel_id="&request("ID")
				rs.open sql,conn,1,3
				rs("sel_flag")=true
				rs.update
				
				'更新学生标识
				set rsa = server.createobject("adodb.recordset")
				sql = "select * from student_info where St_number='"&request("scid")&"'"
				rsa.open sql,conn,1,3
				rsa("allow_flag")=true
				rsa.update
				rsa.close
				set rsa=nothing
				
				'删除该题其他
				'sql = "delete from select_true where Sel_flag=false and Sel_id="&request("ID")
				'Conn.Execute(sql)
				'sql = "delete from select_true where Sel_flag=false and St_number='"&request("scid")&"'"
				'Conn.Execute(sql)
						
				set rsa = server.createobject("adodb.recordset")
				sqla = "select * from student_info where St_number='"&request("scid")&"'"
				rsa.open sqla,conn,1,1
				
				set rso = server.CreateObject("adodb.recordset")
				sql = "select * from sel_record where St_number='"&request("scid")&"'"
				rso.open sql,conn,1,3
				if rso.recordcount>0 then
					rso("St_number") = request("scid")
					rso("Sel_id") = rs("Sel_id")
					rso("St_name")= rsa("St_name")
					'rso("st_class")= rsa("st_class")
					'rso("st_grade")=rsa("st_grade")
					rso.update
				else
					rso.addnew
					rso("St_number") = request("scid")
					rso("Sel_id") = rs("Sel_id")
					rso("St_name")= rsa("St_name")
					'rso("st_class")= rsa("st_class")
					'rso("st_grade")=rsa("st_grade")
					rso.update
				end if
				rsa.close
				set rsa=nothing
				rso.close
				set rso = nothing
				rs.close
				set rs = nothing
			rst.close
			set rst=nothing
			response.Redirect("task_view.asp?txtpage="&request("txtpage"))
			response.End()
		else
			response.Write("<script>alert('您所带的学生已满！请返回……');history.back()</script>")
			response.End()
		end if
			rsq.close
			set rsq=nothing
			rsp.close
			set rsp=nothing
			conn.close
			set conn = nothing
	end if
	
	'删除学生选题
	if Action = "del" then
		set rsp = server.createobject("adodb.recordset")
		sql1 = "select * from student_info where St_number='"&request("scid")&"'"
				rsp.open sql1,conn,1,3
				rsp("allow_flag")=false
				rsp("select_flag")=false
				rsp.update
				rsp.close
				set rsp=nothing
			
		set rsp=server.CreateObject("adodb.recordset")
	sql="select * from select_cursor  where Sel_id="&request("ID")	
	rsp.open sql,conn,1,3
		rsp("sel_flag") = rsp("sel_flag")-1
		rsp.update		
		rsp.close
			set rsp = nothing

		
		set rsa = server.createobject("adodb.recordset")	
		'sql = "delete from select_true where Sel_flag=True and Sel_id="&request("ID")
		
		'sql = "delete from select_true where Sel_flag=True and  St_number='"&request("scid")&"'"
		
		sql = "delete from select_true where  St_number='"&request("scid")&"'"

		Conn.Execute(sql)
		sql = "delete from sel_record where St_number='"&request("scid")&"'"
		
		Conn.Execute(sql)
		response.Redirect("task_view.asp?txtpage="&request("txtpage"))
		response.End()
		

	end if
%>