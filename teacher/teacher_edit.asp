<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
<script language="javascript" type="text/javascript"> 
	function depart_add()
		{ 
			if (document.editForm.Tea_name.value.length == 0) { 
			alert("����������!");
			document.editForm.Tea_name.focus();
			return false;
			}
			if (document.editForm.Tea_pass.value != document.editForm.Tea_pass1.value) { 
			alert("�����������벻һ��!");
			document.editForm.Tea_pass.focus();
			return false;
			}
			return true;
		}
</script>
<title>�����޸�</title>
</head>


<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle" />&nbsp;<strong>�������ģ��޸ĸ�������</strong></font></td>
  </tr>
 
</table>
<center>
    <br/>
	
<%
	'��������
	if session("user_no") <> "" then
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from teacher_inf where Tea_id='"&session("user_no")&"'"
		rs.open sql,conn,3,2
%>

<form name="editForm" method="post" action="?Action=SaveEdit" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
      <tr>
        <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
            <tr>
              <td width="187" height="20" align="right">��</td>
              <td><div align="left"><font color="#0000FF"><b>���޸Ļ��߸������ĸ�������</b></font></div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">��ʦ���/���ţ�</font></td>
              <td><div align="left">
                  <input name="Tea_id" type="text" class="textfield" id="Tea_id" style="WIDTH: 120;" value="<%=rs("Tea_id")%>" size="15" <%response.write ("readonly")%>/>
                	<font color="#FF0000">*��ʦ���/������Ϊ�û��������޸�</font></div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">��ʦ������</font></td>
              <td><div align="left">
              
              <input name="Tea_name" type="text" class="textfield" id="Tea_name" style="WIDTH: 120; height:17" value="<%=rs("Tea_name")%>" size="15">          
				&nbsp;</div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">���������룺</font></td>
              <td><div align="left">
                  <input name="Tea_pass" class="textfield" id="Tea_pass" style="WIDTH: 120;" size="19" type="password" /></div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">���ٴ�ȷ�����룺</font></td>
              <td><div align="left">
                  <input name="Tea_pass1" class="textfield" id="Tea_pass1" style="WIDTH: 120;" size="19" type="password" />
              </div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">����Ժϵ��</font></td>
              <td><div align="left">
			  
                  <select name="res_id" id="res_id" >
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
              <td height="20" align="right"><font color="#FF0000">�绰���룺</font></td>
              <td><div align="left">
                  <input name="Tea_phone" type="text" class="textfield" id="Tea_phone" style="WIDTH: 120;" value="<%=rs("Tea_phone")%>" size="19" />
              </div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">���ָ��ѧ������</font></td>
              <td><div align="left">
                  <!--webbot bot="Validation" S-Data-Type="Number" S-Number-Separators=",." S-Validation-Constraint="Less than" S-Validation-Value="80" -->
                  <input name="Stn_id" type="text" class="textfield" id="Stn_id" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="19" />
              </div></td>
            </tr>

            <tr>
              <td height="20" align="right"><font color="#FF0000">�ֻ����룺</font></td>
              <td><div align="left">
                  <input name="Tea_m_pone" type="text" class="textfield" id="Tea_m_pone" style="WIDTH: 120;" value="<%=rs("Tea_m_pone")%>" size="19" />
                &nbsp;* ��������Ч��ϵ��ʽ </div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">��ʦ���䣺</font></td>
              <td><div align="left">
                  <input name="Tea_email" type="text" class="textfield" id="Tea_email" style="WIDTH: 120;" value="<%=rs("Tea_email")%>" size="19" />
                &nbsp;</div></td>
            </tr>
            <tr>
              <td height="20" align="right"><font color="#FF0000">��ʦְ�ƣ�</font></td>
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
              <td height="20" align="right" valign="top"><font color="#FF0000">��ʦ��飺</font></td>
              <td><div align="left">
                  <textarea name="Tea_intru" cols="60" rows="5" class="textfield" id="Tea_intru" style="WIDTH: 580;" ><%=rs("Tea_intru")%></textarea>
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
              <td height="20" align="right">��</td>
              <td valign="bottom"><div align="left"></div></td>
            </tr>
        </table></td>
      </tr>
    </table>
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
'Action=SaveEdit	�޸�����
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		set rs = server.createobject("adodb.recordset")
		sql="select * from teacher_inf where Tea_id='"&session("user_no")&"'"
		rs.open sql,conn,1,3
			rs("Tea_name")=trim(request.form("Tea_name"))
			rs("res_id")=trim(request.form("res_id"))
			if request.form("Tea_pass")<>"" then
				rs("Tea_pass")=trim(md5(request.form("Tea_pass")))
			end if
			rs("Tea_phone")=trim(request.form("Tea_phone"))
			rs("Tea_m_pone")=trim(request.form("Tea_m_pone"))
			rs("Tea_email")=trim(request.form("Tea_email"))
			rs("Zc_id")=trim(request.form("Zc_id"))
			rs("Tea_intru")=trim(request.form("Tea_intru"))
			rs("St_number")=cint(request.form("Stn_id"))
			
			rs.update
			rs.close
			set rs = nothing
			response.Write("<script>alert('�޸ĳɹ����뷵�ء���');history.back()</script>")	
		end if
%>