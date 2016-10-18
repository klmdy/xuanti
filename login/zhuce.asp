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
			if (document.editForm.St_number.value.length == 0) { 
			alert("学号不能为空，请输入学号!");
			document.editForm.St_number.focus();
			return false;
			}
			if (document.editForm.St_name.value.length == 0) { 
			alert("姓名不能为空，请输入姓名!");
			document.editForm.St_name.focus();
			return false;
			}
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("请选择专业名称!");
			document.editForm.Sp_id.focus();
			return false;
			}
			
			if (document.editForm.st_pass.value.length == 0) { 
			alert("密码不能为空，请输入密码!");
			document.editForm.Sp_id.focus();
			return false;
			}

			
			
			return true;
		}
</script>
<title>学生注册</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="../inc/Md5.asp" -->

<body>
  <center>
    <br/>	
	
	<table width="38%" border="0" cellpadding="3" cellspacing="2" bgcolor="#008000">
  <form name="editForm" method="post" action="zhuce.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="120" height="20" align="right">　</td>
        <td><div align="left"><b><font color="#008000">学生在线注册</font><font color="#FF0000">（注册后请等待审批，审批通过后方能登陆系统）</font></b></div></td>
      </tr>
      <tr>
        <td height="23" align="right"><font color="#0000FF"><b>学号：</b></font></td>
        <td><div align="left">
          <font color="#0000FF">
          <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" size="15"> 
			&nbsp;*请输入学号！</font></div></td>
      </tr>
      <tr>
        <td height="18" align="right"><font color="#0000FF"><b>姓名：</b></font></td>
        <td><div align="left">
            <font color="#0000FF">
            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" size="19" />
          &nbsp;*请输入正确姓名</font></div></td>
      </tr>
      <tr>
        <td height="22" align="right"><font color="#0000FF"><b>登录密码：</b></font></td>
        <td><div align="left">
            <font color="#0000FF">
            <input name="st_pass" type="password" class="textfield" id="st_pass" style="WIDTH: 120;"  size="19" /> 
			*此为登录时密码，请妥善保管！</font></div></td>
      </tr>
       <tr>
        <td height="20" align="right"><font color="#0000FF"><b>学院：</b></font></td>
        <td><div align="left">
            <font color="#0000FF">
            <input name="St_origin" type="text" class="textfield" id="St_origin" style="WIDTH: 120;" size="19" value="信息技术学院" readonly> 
			*系统默认值 </font> </div></td>
      </tr>
      <tr>
        <td height="22" align="right"><font color="#0000FF"><b>专业：</b></font></td>
        <td><div align="left">
            <font color="#0000FF">
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
            </select> *请选择你所在专业</font></div></td>
      </tr>
     
      <tr>
        <td height="19" align="right"><font color="#0000FF"><b>年级：</b></font></td>
        <td><div align="left">
                  <font color="#0000FF">
                  <select size="1" name="St_grade" id="St_grade">
            <option value="" selected>请选择</option>
            <option value="2011">2011级</option>
            <option value="2012">2012级</option>
            <option value="2013">2013级</option>
            <option value="2014">2014级</option>
            <option value="2015">2015级</option>
            <option value="2016">2016级</option>
            <option value="2017">2017级</option>
            <option value="2018">2018级</option>
            <option value="2019">2019级</option>
            <option value="2020">2020级</option>
            <option value="2021">2021级</option>
            <option value="2022">2022级</option>
 </select> *请选择你所在的年级</font></div></td>
      </tr>
      <tr>
        <td height="19" align="right"><font color="#0000FF"><b>班级：</b></font></td>
        <td><div align="left">
            
          <font color="#0000FF">
            
          <select size="1" name="St_class" id="St_class">
            <option value="">请选择</option>
            <option value="01">01班</option>
            <option value="02">02班</option>
            <option value="03">03班</option>
            <option value="04">04班</option>
   </select> *请选择你所在的班级</font></div></td>
      </tr>
         <tr>
        <td height="20" align="right"><font color="#0000FF"><b>性别：</b></font></td>
        <td><div align="left">&nbsp;
          <label>
          <input type="radio" name="St_sex" value="男" checked="checked"  />
          男</label>
          <label>
          <input type="radio" name="St_sex" value="女" />
          女</label>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><font color="#0000FF"><b>手机号码：</b></font></td>
        <td><div align="left">
            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" size="19" />*<font color="#0000FF">请填写当前有效的联系方式 
			</font> </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><font color="#0000FF"><b>QQ：</b></font></td>
        <td><div align="left">
            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><font color="#800000"><b>电子邮箱：</b></font></td>
        <td><div align="left">
            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="30" align="right">　</td>
        <td valign="bottom"><div align="left">
          <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" 注 册 " style="WIDTH: 60;" >
        　　
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" 重 置 " style="WIDTH: 60;">
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right">　</td>
        <td valign="bottom"><div align="left"><font color="#FF0000">
			<marquee>请正确填写，待系统管理员确认后再行使用！</marquee></font></div></td>
      </tr>
    </table></td>
  </tr>
  </form>
</table>


  <%
	rs.close
	set rs = nothing

%>
</center>
</body>
</html>


<%
'Action=addnew	添加数据
	Action=request.QueryString("Action")
	if Action = "addnew" then
		St_number = trim(request.form("St_number"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from student_info where St_number='"&St_number&"'"
		rs.open sql1,conn,1,3
			if rs.bof and rs.eof then
				rs.addnew
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
				'rs("St_phone")=trim(request.form("St_phone"))
				rs("St_m_phone")=trim(request.form("St_m_phone"))
				rs("St_qq")=trim(request.form("St_qq"))
				rs("St_email")=trim(request.form("St_email"))
				rs.update
				rs.close
				set rs = nothing
				response.Redirect("index.asp")
			else
				response.Write("<script>alert('学号已存在！请返回……');history.back()</script>")
			end if
		end if


	
	
%>