<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link rel="stylesheet" href="../js/CssAdmin.css">



<title>�鿴��ʦ</title>

</head>





<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->



<body>

<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">

  <tr>

    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>��ʦ������ӣ��޸Ľ�ʦ��Ϣ</strong></font></td>

  </tr>

  <tr>

    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><font color="#0000FF">&nbsp;</font><a href="teacher_list.asp" onClick='changeAdminFlag("ϵͳ����Ա")'>�鿴���н�ʦ</a></td>    

  </tr>

</table>

  <center>

    <br/>

	

<%

	set rs=server.CreateObject("adodb.recordset")

	sql="select * from teacher_inf where Tea_id="&"'"&request("ID")&"'"

	'response.Write(sql)

	rs.open sql,conn,1,1



%>



  <form name="editForm" method="post" action="?Action=SaveEdit">

  <tr>

    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">

      <tr>

        <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">

            <tr>

              <td width="120" height="20" align="right">��</td>

              <td><div align="left"></div></td>

            </tr>

            <tr>

              <td height="20" align="right">��ʦ��ţ�</td>

              <td><div align="left">

                  <input name="Tea_id" type="text" class="textfield" id="Tea_id" style="WIDTH: 120;" value="<%=rs("Tea_id")%>" size="15" <%response.write ("readonly")%>/>

                &nbsp;</div></td>

            </tr>

            <tr>

              <td height="20" align="right">��ʦ������</td>

              <td><div align="left">

                  <input name="Tea_name" type="text" class="textfield" id="Tea_name" style="WIDTH: 120;" value="<%=rs("Tea_name")%>" size="19" <%response.write ("readonly")%>/>

                &nbsp;</div></td>

            </tr>

            <tr>

              <td height="20" align="right">�����ң�</td>

              <td><div align="left">

			  

                  <select name="res_id" id="res_id" <%response.write ("readonly")%>>

                    <%    

				set rs1=server.createobject("adodb.recordset")    

				sql="select * from res_table "    

				rs1.open sql,Conn,1,3

			%>

                    <%do while not rs1.eof%>

                    <option value="<%=rs1("res_id")%>"

					<% if rs1("res_id")=rs("res_id") then response.Write("selected='selected'") end if%>

					><%=rs1("res_name")%></option>

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

                  <input name="St_number" type="text" id="St_number" value="<%=rs("St_number")%>" size="5" <%response.write ("readonly")%>/>

                 ��಻����10�� </div></td>

            </tr>

            <tr>

              <td height="20" align="right">�绰���룺</td>

              <td><div align="left">

                  <input name="Tea_phone" type="text" class="textfield" id="Tea_phone" style="WIDTH: 120;" value="<%=rs("Tea_phone")%>" size="19" <%response.write ("readonly")%>/>

                &nbsp;</div></td>

            </tr>

            <tr>

              <td height="20" align="right">�ֻ����룺</td>

              <td><div align="left">

                  <input name="Tea_m_pone" type="text" class="textfield" id="Tea_m_pone" style="WIDTH: 120;" value="<%=rs("Tea_m_pone")%>" size="19" <%response.write ("readonly")%>/>

                &nbsp;</div></td>

            </tr>

            <tr>

              <td height="20" align="right">��ʦ���䣺</td>

              <td><div align="left">

                  <input name="Tea_email" type="text" class="textfield" id="Tea_email" style="WIDTH: 120;" value="<%=rs("Tea_email")%>" size="19" <%response.write ("readonly")%>/>

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

                  <textarea name="Tea_intru" cols="60" rows="5" class="textfield" id="Tea_intru" style="WIDTH: 580;" <%response.write ("readonly")%>><%=rs("Tea_intru")%></textarea>

              </div></td>

            </tr>

            <tr>

              <td height="30" align="right">��</td>

              <td valign="bottom"><div align="left">

                  <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" ���ؽ�ʦ�б� " style="WIDTH: 60;">

                

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

%>

</center>

</body>

</html>

<%

	Action=request.QueryString("Action")

	if Action = "SaveEdit" then

		response.Redirect("teacher_list.asp")

	end if

%>