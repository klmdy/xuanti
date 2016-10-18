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

			alert("请输入姓名!");

			document.editForm.St_name.focus();

			return false;

			}

			if (document.editForm.st_pass.value.length == 0) { 

			alert("密码不能为空!");

			document.editForm.St_name.focus();

			return false;

			}



			if (document.editForm.st_pass.value != document.editForm.st_pass1.value) { 

			alert("两次密码输入不一致!");

			document.editForm.st_pass.focus();

			return false;

			}

			return true;

		}

</script>

<title>资料修改</title>

</head>





<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->

<!--#include file="../inc/Md5.asp" -->



<body>

<center>

 

	

<%

	'更新数据

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

          <td><div align="left"><b><font color="#008000">查看/修改个人资料</font><font color="#FF0000">(请注意：在修改个人资料的时候，密码也要再次输入）</font></b></div></td>

        </tr>

        <tr>

          <td height="24" align="right"><font color="#0000FF"><b>学号：</b></font></td>

          <td><div align="left">

            <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="15" readonly="true" >

            <font color="#FF0000">&nbsp;*学号作为登录名,不能修改!</font></div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>学生姓名：</b></font></td>

          <td><div align="left">

            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" value="<%=rs("St_name")%>" size="19"  > 

			&nbsp;</div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>请重新设置登录密码：</b></font></td>

          <td><div align="left">

            <input name="st_pass" class="textfield" id="st_pass" style="WIDTH: 120; height:17" size="19"> 

			&nbsp;<font color="#FF0000">*请注意重新输入密码，密码不能为空!</font></div></td>

        </tr>

         <tr>

          <td height="20" align="right"><font color="#0000FF"><b>请再次输入密码：</b></font></td>

          <td><div align="left">

            <input name="st_pass1" class="textfield" id="st_pass1" style="WIDTH: 120;" size="19"> 

			&nbsp;<font color="#FF0000">*请再次输入密码!</font></div></td>

        </tr>



        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>所学专业：</b></font></td>

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

          	*不能修改</div></td>

        </tr>

       

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>所在年级：</b></font></td>

          <td><div align="left">

            <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" value="<%=rs("St_grade")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>所在班级：</b></font></td>

          <td><div align="left">

            <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" value="<%=rs("St_class")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        

        

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>性别：</b></font></td>

          <td><div align="left">&nbsp;

                    <label>

					<%

						if rs("St_sex")="男" then

					%>

                    <input name="St_sex" type="radio" value="男" checked="checked" />

                      男</label>

                    <label>

                    <input type="radio" name="St_sex" value="女" />

                      女

					  <% else  %>

					   <input name="St_sex" type="radio" value="男" />

                      男</label>

                    <label>

                    <input type="radio" name="St_sex" value="女" checked="checked"/>

                      女

					  <% end if %>

					  </label>

          </div></td>

        </tr>     

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>手机号码：</b></font></td>

          <td><div align="left">

            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" value="<%=rs("St_m_phone")%>" size="19" />

            &nbsp;* 请务必填写有效联系方式 </div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>QQ：</b></font></td>

          <td><div align="left">

            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" value="<%=rs("St_qq")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        <tr>

          <td height="20" align="right"><font color="#0000FF"><b>电子邮箱：</b></font></td>

          <td><div align="left">

            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" value="<%=rs("St_email")%>" size="19" />

            &nbsp;</div></td>

        </tr>

        <tr>

          <td height="30" align="right">　</td>

          <td valign="bottom"><div align="left">

            <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" 修 改 " style="WIDTH: 60;"  >

            

            <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />

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



  <%

  	rs1.close

	set rs1 = nothing

	rs.close

	set rs = nothing

	end if

%>





<%

'Action=addnew	添加数据

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

				response.Write("<script>alert('修改成功！请返回……');history.back()</script>")

				

			

				'response.Redirect("student_edit.asp")

			

		end if

	

%>



</center>

</body>

</html>