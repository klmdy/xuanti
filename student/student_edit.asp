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

			if (document.editForm.St_name.value.length == 0) { 

			alert("����������!");

			document.editForm.St_name.focus();

			return false;

			}

			if (document.editForm.st_pass.value.length == 0) { 

			alert("���벻��Ϊ��!");

			document.editForm.St_name.focus();

			return false;

			}



			if (document.editForm.st_pass.value != document.editForm.st_pass1.value) { 

			alert("�����������벻һ��!");

			document.editForm.st_pass.focus();

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

<center>

 

	

<%

	'��������

	if session("user_no") <> "" then

		set rs=server.CreateObject("adodb.recordset")

		sql="select * from student_info where St_number='"&session("user_no")&"'"

		rs.open sql,conn,3,2

%>





<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">

<form name="editForm" method="post" action="student_edit.asp?Action=modif" onsubmit="return depart_add()">  

     <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">

        <tr>

          <td width="179" height="16" align="right"></td>

          <td><div align="left"><b><font color="#008000">�鿴/�޸ĸ�������</font><font color="#FF0000">(��ע�⣺���޸ĸ������ϵ�ʱ������ҲҪ�ٴ����룩</font></b></div></td>

        </tr>

        <tr>

          <td height="24" align="right"><font color="#0000FF"><b>ѧ�ţ�</b></font></td>

          <td><div align="left">

            <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="15" readonly="true" >

            <font color="#FF0000">&nbsp;*ѧ����Ϊ��¼��,�����޸�!</font></div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>ѧ��������</b></font></td>

          <td><div align="left">

            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" value="<%=rs("St_name")%>" size="19"  > 

			&nbsp;</div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>���������õ�¼���룺</b></font></td>

          <td><div align="left">

            <input name="st_pass" class="textfield" id="st_pass" style="WIDTH: 120; height:17" size="19"> 

			&nbsp;<font color="#FF0000">*��ע�������������룬���벻��Ϊ��!</font></div></td>

        </tr>

         <tr>

          <td height="20" align="right"><font color="#0000FF"><b>���ٴ��������룺</b></font></td>

          <td><div align="left">

            <input name="st_pass1" class="textfield" id="st_pass1" style="WIDTH: 120;" size="19"> 

			&nbsp;<font color="#FF0000">*���ٴ���������!</font></div></td>

        </tr>



        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>��ѧרҵ��</b></font></td>

          <td><div align="left">

            <select name="Sp_id" id="Sp_id">

            

              <%    

				set rs1=server.createobject("adodb.recordset")    

				sql1="select * from speciality "

				

	sql1="select * from  speciality where Sp_id='"& rs("Sp_id")&"'"    

				rs1.open sql1,Conn,1,3

			%>

            

              <option value="<%=rs("Sp_id")%>"><%=rs1("Sp_name")%></option>			 

            </select>

          	*�����޸�</div></td>

        </tr>

       

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>�����꼶��</b></font></td>

          <td><div align="left">

            <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" value="<%=rs("St_grade")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>���ڰ༶��</b></font></td>

          <td><div align="left">

            <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" value="<%=rs("St_class")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        

        

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>�Ա�</b></font></td>

          <td><div align="left">&nbsp;

                    <label>

					<%

						if rs("St_sex")="��" then

					%>

                    <input name="St_sex" type="radio" value="��" checked="checked" />

                      ��</label>

                    <label>

                    <input type="radio" name="St_sex" value="Ů" />

                      Ů

					  <% else  %>

					   <input name="St_sex" type="radio" value="��" />

                      ��</label>

                    <label>

                    <input type="radio" name="St_sex" value="Ů" checked="checked"/>

                      Ů

					  <% end if %>

					  </label>

          </div></td>

        </tr>     

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>�ֻ����룺</b></font></td>

          <td><div align="left">

            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" value="<%=rs("St_m_phone")%>" size="19" />

            &nbsp;* �������д��Ч��ϵ��ʽ </div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>QQ��</b></font></td>

          <td><div align="left">

            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" value="<%=rs("St_qq")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>�������䣺</b></font></td>

          <td><div align="left">

            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" value="<%=rs("St_email")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        <tr>

          <td height="30" align="right">��</td>

          <td valign="bottom"><div align="left">

            <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;"  >

            

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



  <%

  	rs1.close

	set rs1 = nothing

	rs.close

	set rs = nothing

	end if

%>





<%

'Action=addnew	�������

	Action=request.QueryString("Action")

	if Action = "modif" then

		'St_number = trim(request.form("St_number"))

		set rs = server.createobject("adodb.recordset")

		sql="select * from student_info where St_number='"&session("user_no")&"'"

				rs.open sql,conn,1,3

			

				rs("St_number")=trim(request.form("St_number"))

				rs("St_name")=trim(request.form("St_name"))

				rs("st_pass")=trim(md5(request.form("st_pass")))

				rs("Sp_id")=trim(request.form("Sp_id"))

				rs("St_origin")=trim(request.form("St_origin"))

				rs("St_grade")=trim(request.form("St_grade"))

				rs("St_class")=trim(request.form("St_class"))

				'rs("St_date")=trim(request.form("St_date"))

				'rs("identity_card")=trim(request.form("identity_card"))

				'rs("St_adress")=trim(request.form("St_adress"))

				rs("St_sex")=trim(request.form("St_sex"))

				rs("St_m_phone")=trim(request.form("St_m_phone"))				

				rs("St_qq")=trim(request.form("St_qq"))

				rs("St_email")=trim(request.form("St_email"))

				rs.update

				rs.close

				set rs = nothing

				response.Write("<script>alert('�޸ĳɹ����뷵�ء���');history.back()</script>")

				

			

				'response.Redirect("student_edit.asp")

			

		end if

	

%>



</center>

</body>

</html>