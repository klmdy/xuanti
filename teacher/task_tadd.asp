<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.Sel_name.value.length == 0) { 
			alert("�����������!");
			document.editForm.Sel_name.focus();
			return false;
			}
			if (document.editForm.Tea_id.value.length == 0) { 
			alert("��ѡ��ָ����ʦ!");
			document.editForm.Tea_id.focus();
			return false;
			}
			if (document.editForm.Sel_level.value.length == 0) { 
			alert("��ѡ������Ѷ�!");
			document.editForm.Sel_level.focus();
			return false;
			}
			if (document.editForm.Sel_cour.value.length == 0) { 
			alert("��ѡ����ⷽ��!");
			document.editForm.Sel_cour.focus();
			return false;
			}
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("��ѡ����ѡרҵ!");
			document.editForm.Sp_id.focus();
			return false;
			}
			return true;
		}
	function DoEmpty()
	{
		window.location = "task_view.asp" ;
	}
</script>
<title>����޸Ŀ���</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>���������ӣ��޸Ŀ�����Ϣ</strong></font></td>
  </tr>
  
  
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="task_tadd.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>��ӿ���</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="task_Padd.asp" onclick='changeAdminFlag(&quot;�������������Ϣ&quot;)'>�������������Ϣ</a>
	|&nbsp;</font></font><a href="task_myexcel.asp" onclick='changeAdminFlag(&quot;�������п�����Ϣ&quot;)'>�����ҵĿ���(Excel��)</a> </td>    
  </tr>
</table>
  <center>
	
	<%
		'�������------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	</font></b>
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="157" height="20" align="right">��</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�������ƣ�</font></b></td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120;" size="60" />
          &nbsp;*</div></td>
      </tr>
     
      <tr>
        <td height="20" align="right"><b><font color="#800000">�Ѷ�ϵ����</font></b></td>
        <td><div align="left">
          <select size="1" name="Sel_level" id="select2">
 <option value="1.0" selected>1.0-����</option>
     <option value="0.9">0.9-����</option> 
        <option value="0.8">0.8-�е�</option>
          <option value="0.7">0.7-һ��</option>
 <option value="0.6" >0.6-����</option>   
   </select>
        *</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">ѡ���꼶��</font></b></td>
        <td><div align="left">
              
   
     <select name="Sel_cour" id="select3" size="1">
        	<option value="2012" selected>2012��</option>
			<option value="2013">2013��</option>
			<option value="2014">2014��</option>	
			<option value="2015">2015��</option>      
			<option value="2016">2016��</option>
			
			</select>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">��ѡרҵ��</font></b></td>
        <td><div align="left">
            <select name="Sp_id" id="Sp_id">
			<%    
				set rs=server.createobject("adodb.recordset")    
				sql="select * from speciality "    
				rs.open sql,Conn,1,3
			%>
              <%do while not rs.eof%>
              <option value="<%=rs("sp_id")%>"><%=rs("sp_name")%></option>
              <%
				rs.movenext
				loop
			%>
            </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">��ѡ������</font></b></td>
        <td><div align="left">
          <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="1" size="5" />
          </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top"><b><font color="#800000">����Ҫ��</font></b></td>
        <td><div align="left">
          <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" ></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">��</td>
        <td valign="bottom"><div align="left">
        
        
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" �� �� " style="WIDTH: 60;" >
        ����
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" �� �� " style="WIDTH: 60;">
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��</td>
        <td valign="bottom"><div align="left"></div></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>

<%
	end if
	'��������
	if Result = "Modify" then
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from select_cursor as sel where Sel_id="&request("ID")
	'response.Write(sql)
	rs.open sql,conn,3,2

%>
<br>
	<font color="#FF0000">
<tr>
        <td height="20" align="right"></font><b><font size="4" color="#FF0000">ѡ��ÿ����ѧ��������   
        <%    
        
        Result=request("ID")

         %>
         <%
			set rs1=server.createobject("adodb.recordset")    
			sql="select * from sel_record " 
			rs1.open sql,Conn,1,3
		%>
        <% do while not rs1.eof %>
        <%
          if rs1("Sel_id")=cint(Result)  then 
          %>          
        <%=rs1("St_name")%>��         
       <% end if%>
        <%
				rs1.movenext
				loop
			
			%>
			<%
				 rs1.close
				set rs1 = nothing				
			%>
       
        
        </td>
        
      </tr>
	</font><font size="4" color="#0000FF">
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="?Action=SaveEdit&ID=<%=request("ID")%>&txtpage=<%=request("txtpage")%>" 
  onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
      <tr>
        <td width="158" height="20" align="right">��</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�������ƣ� 
        </font></b> 
        </td>
        <td><div align="left">
            <input name="Sel_name" type="text" class="textfield" id="Sel_name" style="WIDTH: 120; height:17" value="<%=rs("Sel_name")%>" size="60" />
          &nbsp;*</div></td>
      </tr>
     
      <tr>
        <td height="20" align="right"><b><font color="#800000">�Ѷ�ϵ����</font></b></td>
        <td><div align="left">
            <select size="1" name="Sel_level" id="select2">
 <option value="1.0" selected>1.0-����</option>
     <option value="0.9">0.9-����</option> 
        <option value="0.8">0.8-�е�</option>
          <option value="0.7">0.7-һ��</option>
 <option value="0.6" >0.6-����</option>   
   </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">����꼶��
       
        </font></b>
       
        </td>
        <td><div align="left">
    <select name="Sel_cour" id="select3" size="1">
        	<option value="2012" selected>2012��</option>
			<option value="2013">2013��</option>
			<option value="2014">2014��</option>	
			<option value="2015">2015��</option>      
			<option value="2016">2016��</option>
			
			</select>

         </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">��ѡרҵ��</font></b></td>
        <td><div align="left">
            <select name="sp_id" id="sp_id">
              <%    
				set rs1=server.createobject("adodb.recordset")    
				sql="select * from speciality "    
				rs1.open sql,Conn,1,3
			%>
              <%do while not rs1.eof%>
              <option value="<%=rs1("sp_id")%>"
			  <% if rs1("sp_id")=rs("sp_id") then response.Write("selected='selected'") end if%>
			  ><%=rs1("sp_name")%></option>
              <%
				rs1.movenext
				loop
			%>
            </select>
          *</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">��ѡ������</font></b></td>
        <td><div align="left">
            <input name="Sel_nu" type="text" class="textfield" id="Sel_nu" value="<%=rs("Sel_nu")%>" size="5" />&nbsp; </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top"><b><font color="#800000">����Ҫ��</font></b></td>
        <td><div align="left">
            <textarea name="Sel_con" cols="60" rows="8" class="textfield" id="Sel_con" style="WIDTH: 580;" ><%=rs("Sel_con")%></textarea>
        </div></td>
      </tr>
      <tr>
        <td height="30" align="right">��</td>
        <td valign="bottom"><div align="left">
		
<%
	Result=request.QueryString("show")
	if Result = "yes" then
%>

 <input name="submitSaveEdit3" type="button" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;" onclick="javascript:DoEmpty();">
<%else%>

 <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;">
 <%end if%>
		  
         <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" �� �� " style="WIDTH: 60;" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">��</td>
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
'Action=addnew	�������
	Action=request.QueryString("Action")
	if Action = "addnew" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from select_cursor"
		rs.open sql,conn,1,3
			rs.addnew
			rs("Sel_name")=trim(request.form("Sel_name"))
			rs("Tea_id")=session("user_no")
			rs("Sel_level")=trim(request.form("Sel_level"))
			rs("Sel_cour")=request.form("Sel_cour")
			rs("Sel_nu")=request.form("Sel_nu")
			rs("sp_id")=request.form("sp_id")
			rs("Sel_con")=request.form("Sel_con")
			rs("sel_flag")=false
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("task_mysel.asp")
	end if

	'Action=SaveEdit	�����޸�
		Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from select_cursor where Sel_id="&request("ID")
		rs.open sql,conn,1,3
			rs("Sel_name")=trim(request.form("Sel_name"))
			rs("Tea_id")=session("user_no")
			rs("Sel_level")=trim(request.form("Sel_level"))
			rs("Sel_cour")=request.form("Sel_cour")
			rs("sp_id")=request.form("sp_id")
			rs("Sel_nu")=request.form("Sel_nu")
			rs("Sel_con")=request.form("Sel_con")
			'rs("sel_flag")=false
			'rs("check")=false
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("task_mysel.asp?txtpage="&request("txtpage"))
	end if
		
	if Action = "del" then
		sql = "delete from select_cursor where Sel_id="&request("ID")
		'response.Write(sql)
		Conn.Execute(sql)
       	conn.close
       	set conn=nothing
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("task_mysel.asp")
	end if
	
%>