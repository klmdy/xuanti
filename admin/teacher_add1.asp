<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.Tea_id.value.length == 0) { 
			alert("�������ʦ���!");
			document.editForm.Tea_id.focus();
			return false;
			}
			if (document.editForm.Tea_name.value.length == 0) { 
			alert("�������ʦ��!");
			document.editForm.Tea_name.focus();
			return false;
			}
			return true;
		}
</script>
<style type="text/css">
  td{
    line-height: 25px;
  }
</style>
<title>��ӽ�ʦ</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>��ʦ������ӣ��޸Ľ�ʦ��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9" style="line-height: 23px; "><a href="teacher_add.asp?Result=Add" onClick='changeAdminFlag("��ӹ���Ա")'>��ӽ�ʦ</a><font color="#0000FF">|</font><a href="teacher_Padd1.asp" onclick='changeAdminFlag(&quot;���������ʦ��Ϣ&quot;)'>���������ʦ��Ϣ</a>
  |</font><a href="teacher_excel.asp" onclick='changeAdminFlag(&quot;�������н�ʦ��Ϣ&quot;)'>������ʦ��Ϣ��Excel��</a>
  <br><a href="teacher_list1.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���н�ʦ</a><font color="#0000FF">
	</td>    
  </tr>
</table>
  <center>
    <br/>
	
	
	<%
		'�������------------------------------------------------------------------------------
		Result=request.QueryString("Result")
		if Result = "Add" then
	%>
	<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
  <form name="editForm" method="post" action="teacher_add1.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="80" height="20" align="right">��</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦ��ţ�<br><br></td>
        <td><div align="left">
          <input name="Tea_id" type="text" class="textfield" id="Tea_id" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;<br>(���֣������ظ�)</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦ������</td>
        <td><div align="left">
            <input name="Tea_name" type="text" class="textfield" id="Tea_name" style="WIDTH: 120;" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��¼���룺<br><br></td>
        <td><div align="left">
            <input name="Tea_pass" type="text" class="textfield" id="Tea_pass" style="WIDTH: 120;" value="123456" size="20" />
          &nbsp;* <br>(Ĭ������ admin)</div></td>
      </tr>
      <tr>
        <td height="20" align="right">ȷ�����룺<br><br></td>
        <td><div align="left">
            <input name="Tea_pass1" type="text" class="textfield" id="Tea_pass1" style="WIDTH: 120;" value="123456" size="20" />
          &nbsp;* <br>(Ĭ������ admin)</div></td>
      </tr>
      <tr>
        <td height="20" align="right">����Ժϵ��</td>
        <td><div align="left">
            <select name="res_id" id="res_id">
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
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">�޴�������</td>
        <td><div align="left">
          <input name="St_number" type="text" id="St_number" size="5" />
        * ��಻����10�� </div></td>
      </tr>
      <tr>
        <td height="20" align="right">�绰���룺</td>
        <td><div align="left">
            <input name="Tea_phone" type="text" class="textfield" id="Tea_phone" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">�ֻ����룺</td>
        <td><div align="left">
            <input name="Tea_m_pone" type="text" class="textfield" id="Tea_m_pone" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦ���䣺</td>
        <td><div align="left">
            <input name="Tea_email" type="text" class="textfield" id="Tea_email" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right">��ʦְ�ƣ�</td>
        <td><div align="left">
          <select name="Zc_id" id="Zc_id">
            <%    
				set rs=server.createobject("adodb.recordset")    
				sql="select * from zc_table "    
				rs.open sql,Conn,1,3
			%>
            <%do while not rs.eof%>
            <option value="<%=rs("zc_id")%>"><%=rs("zc_name")%></option>
            <%
				rs.movenext
				loop
			%>
          </select>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right" valign="top">��ʦ��飺</td>
        <td><div align="left">
          <textarea name="Tea_intru" cols="60" rows="5" class="textfield" id="Tea_intru" style="WIDTH: 90%;" ></textarea>
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
        <td height="30" align="right">��</td>
        <td valign="bottom"><div align="left">
        <input type="button" class="button" onclick="location.href='bnuzitc1.asp'" value=" �� �� " style="WIDTH: 60; margin-left: 40px; ">
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
	sql="select * from teacher_inf where Tea_id="&"'"&request("ID")&"'"
	'response.Write(sql)
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <form name="editForm" method="post" action="teacher_add1.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">
  <tr>
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
      <tr>
        <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
            <tr>
              <td width="80" height="20" align="right">��</td>
              <td><div align="left"></div></td>
            </tr>
            <tr>
              <td height="20" align="right">��ʦ��ţ�<br><br></td>
              <td><div align="left">
                  <input name="Tea_id" type="text" class="textfield" id="Tea_id" style="WIDTH: 120;" value="<%=rs("Tea_id")%>" size="15" <%response.write ("readonly")%>/>
                &nbsp;*<br>(���֣������ظ�)</div></td>
            </tr>
            <tr>
              <td height="20" align="right">��ʦ������</td>
              <td><div align="left">
                  <input name="Tea_name" type="text" class="textfield" id="Tea_name" style="WIDTH: 120;" value="<%=rs("Tea_name")%>" size="19" />
                &nbsp;*</div></td>
            </tr>
            <tr>
              <td height="20" align="right">��¼���룺<br><br></td>
              <td><div align="left">
                  <input name="Tea_pass" type="text" class="textfield" id="Tea_pass" style="WIDTH: 120;" size="20" />
                &nbsp;*<br>(Ĭ������:admin Ϊ�����޸�)</div></td>
            </tr>
            <tr>
              <td height="20" align="right">ȷ�����룺<br><br></td>
              <td><div align="left">
                  <input name="Tea_pass1" type="text" class="textfield" id="Tea_pass1" style="WIDTH: 120;" size="20" />
                &nbsp;*<br>(Ĭ������ admin)</div></td>
            </tr>
            <tr>
              <td height="20" align="right">����Ժϵ��</td>
              <td><div align="left">
			  
                  <select name="res_id" id="res_id">
                    <%    
				set rs1=server.createobject("adodb.recordset")    
				sql="select * from department "    
				rs1.open sql,Conn,1,3
			%>
                    <%do while not rs1.eof%>
                    <option value="<%=rs1("D_no")%>"
					<% if rs1("D_no")=rs("res_id") then response.Write("selected='selected'") end if%>
					><%=rs1("D_name")%></option>
                    <%
				rs1.movenext
				loop
			%>
                  </select>
				  
              </div></td>
            </tr>
            <tr>
              <td height="20" align="right">�޴�������</td>
              <td><div align="left">
                  <input name="St_number" type="text" id="St_number" value="<%=rs("St_number")%>" size="5" />
                * ��಻����10�� </div></td>
            </tr>
            <tr>
              <td height="20" align="right">�绰���룺</td>
              <td><div align="left">
                  <input name="Tea_phone" type="text" class="textfield" id="Tea_phone" style="WIDTH: 120;" value="<%=rs("Tea_phone")%>" size="19" />
                &nbsp;</div></td>
            </tr>
            <tr>
              <td height="20" align="right">�ֻ����룺</td>
              <td><div align="left">
                  <input name="Tea_m_pone" type="text" class="textfield" id="Tea_m_pone" style="WIDTH: 120;" value="<%=rs("Tea_m_pone")%>" size="19" />
                &nbsp;</div></td>
            </tr>
            <tr>
              <td height="20" align="right">��ʦ���䣺</td>
              <td><div align="left">
                  <input name="Tea_email" type="text" class="textfield" id="Tea_email" style="WIDTH: 120;" value="<%=rs("Tea_email")%>" size="19" />
                &nbsp;</div></td>
            </tr>
            <tr>
              <td height="20" align="right">��ʦְ�ƣ�</td>
              <td><div align="left">
                  <select name="Zc_id" id="select2">
                    <%    
				set rs1=server.createobject("adodb.recordset")    
				sql="select * from zc_table "    
				rs1.open sql,Conn,1,3
			%>
                    <%do while not rs1.eof%>
                    <option value="<%=rs1("zc_id")%>"
					 <% if rs1("zc_id")=rs("zc_id") then response.Write("selected='selected'") end if%>
					><%=rs1("zc_name")%></option>
                    <%
				rs1.movenext
				loop
			%>
                  </select>
              </div></td>
            </tr>
            <tr>
              <td height="20" align="right" valign="top">��ʦ��飺</td>
              <td><div align="left">
                  <textarea name="Tea_intru" cols="60" rows="5" class="textfield" id="Tea_intru" style="WIDTH: 90%;" ><%=rs("Tea_intru")%></textarea>
              </div></td>
            </tr>
            <tr>
              <td height="30" align="right">��</td>
              <td valign="bottom"><div align="left">
                  <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;">
                
                <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" �� �� " style="WIDTH: 60;" />
              </div></td>
            </tr>

            <tr>
              <td height="30" align="right">��</td>
              <td valign="bottom"><div align="left">
              <input type="button" class="button" onClick="javascript :history.back(-1);" value=" �� �� " style="WIDTH: 60; margin-left: 40px; ">
              </div></td>
            </tr>

            <tr>
              <td height="20" align="right">��</td>
              <td valign="bottom"><div align="left"></div></td>
            </tr>
        </table></td>
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
		Tea_id = trim(request.form("Tea_id"))
		Tea_pass = request.form("Tea_pass")
		Tea_pass1 = request.form("Tea_pass1")
		if Tea_pass = Tea_pass1 then
		set rs = server.createobject("adodb.recordset")
		sql1="select * from teacher_inf where Tea_id='"&Tea_id&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
				rs("Tea_id")=trim(request.form("Tea_id"))
				rs("Tea_name")=trim(request.form("Tea_name"))
				rs("Tea_pass")=trim(md5(request.form("Tea_pass")))
				rs("res_id")=request.form("res_id")
				rs("St_number")=request.form("St_number")
				rs("Tea_phone")=request.form("Tea_phone")
				rs("Tea_m_pone")=request.form("Tea_m_pone")
				rs("Tea_email")=request.form("Tea_email")
				rs("Zc_id")=request.form("Zc_id")
				rs("Tea_intru")=request.form("Tea_intru")
				rs.update
				rs.close
				set rs = nothing
				response.Redirect("teacher_list1.asp")
			else
				response.Write("<script>alert('��ʦ����Ѵ��ڣ��뷵�ء���');history.back()</script>")
			end if
		end if
		response.Write("<script>alert('�����������벻һ�£��뷵�ء���');history.back()</script>")
		end if

	'Action=SaveEdit	�����޸�
		Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		Tea_id = trim(request.form("Tea_id"))
		Tea_pass = request.form("Tea_pass")
		Tea_pass1 = request.form("Tea_pass1")
		if Tea_pass = Tea_pass1 then
			set rs = server.createobject("adodb.recordset")
			sql1="select * from teacher_inf where Tea_id='"&Tea_id&"'"
			rs.open sql1,conn,1,3
			rs("Tea_id")=trim(request.form("Tea_id"))
			rs("Tea_name")=trim(request.form("Tea_name"))
			if Tea_pass<>"" then
				rs("Tea_pass")=trim(md5(Tea_pass))
			end if
			rs("res_id")=request.form("res_id")
			rs("St_number")=request.form("St_number")
			rs("Tea_phone")=request.form("Tea_phone")
			rs("Tea_m_pone")=request.form("Tea_m_pone")
			rs("Tea_email")=request.form("Tea_email")
			rs("Zc_id")=request.form("Zc_id")
			rs("Tea_intru")=request.form("Tea_intru")
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("teacher_list1.asp")
		end if
	response.Write("<script>alert('�����������벻һ�£��뷵�ء���');history.back()</script>")
	end if
		
	if Action = "del" then
		sql = "delete from teacher_inf where Tea_id=" & "'"&trim(request("ID"))&"'"
		response.Write(sql)
		Conn.Execute(sql)
       	conn.close
       	set conn=nothing
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("teacher_list1.asp")
	end if
	
	
%>