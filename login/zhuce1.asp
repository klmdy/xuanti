<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" src="../js/Admin.js"></script>
<title>学生注册</title>
</head>



<!--#include file="../inc/Conn.asp" -->

<!--#include file="../inc/Md5.asp" -->



<body style="background:f0f0f0; margin:0;">
    <div class="right" style="width:100%; background:rgb(192, 219, 255);">
      <form name="edit  Form" method="post" action="zhuce1.asp?Action=addnew">

      <div style="padding:10px;" align="center">
        <b><font color="#008000" size="5px">学生在线注册</font></br></br>
          <font color="#FF0000">（注册后请等待审批，通过后方能登陆系统）</font></b>
      </div>
      <div style="margin-left:20%;">
        <div style="margin:5px;">
          <font color="#0000FF"><b>学&#12288;&#12288;号：</b></font>
          <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120; color:#999;" size="15" value="请填写学号" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>姓&#12288;&#12288;名：</b></font>
          <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120; color:#999;" size="15" value="请输入正确姓名" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>登录密码：</b></font>
          <input name="st_pass" type="password" class="textfield" id="st_pass" style="WIDTH: 120; color:#999;"  size="15"/>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>学&#12288;&#12288;院：</b></font>
          <input name="St_origin" type="text" class="textfield" id="St_origin" style="WIDTH: 120;" size="15" value="信息技术学院" readonly>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>专&#12288;&#12288;业：</b></font>
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
        </div>
              
        <div style="margin:5px;">
          <font color="#0000FF"><b>年&#12288;&#12288;级：</b></font>
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
          </select>
        </div>
              
        <div style="margin:5px;">
          <font color="#0000FF"><b>班&#12288;&#12288;级：</b></font>
          <select size="1" name="St_class" id="St_class">
          	<option value="">请选择</option>
            <option value="01">01班</option>
            <option value="02">02班</option>
            <option value="03">03班</option>
            <option value="04">04班</option>
          </select>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>性&#12288;&#12288;别：&#12288;</b></font>
          <label><input type="radio" name="St_sex" value="男" checked="checked"/>男</label>&#12288;&#12288;
          <label><input type="radio" name="St_sex" value="女" />女</label>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>手机号码：</b></font>
          <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120; color:#999;" size="15" value="填写有效联系方式" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/>
        </div>

        <div style="margin:5px;">
          <font color="#0000FF"><b>&nbsp;Q&#12288;&#12288;Q&nbsp;：</b></font>
          <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120; color:#999;" size="15" value="填写有效的QQ号码" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/>
        </div>

        <div style="margin:5px;">
          <font color="#800000"><b>电子邮箱：</b></font>
          <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120; color:#999;" size="15" value="请填写有效的邮箱" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"/>
        </div>
      </div>
      <center>
        <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit" value=" 注 册 " >&#12288;
        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit2" value=" 重 置 ">&#12288;
        <input type="button" class="button" id="back" />
      </center>
        

      <div style="margin:5px;"><font color="#FF0000">
    		<marquee>请正确填写，待系统管理员确认后再行使用！</marquee></font>
      </div>

    </form>

  </div>

<%
	rs.close
	set rs = nothing
%>
</body>
<script>
  JachinId('back').value = " 返 回 ";
  JachinId('back').onclick = function () {
    window.location.href="../index.asp";
  }

  document.getElementsByTagName('form')[0].onsubmit = function() {
    var patt = /^[0-9]{0,100}$/;

    if(JachinId('St_number').value == "请填写学号"){
      alert("学号不能为空，请输入学号");
      JachinId('St_number').focus();
      return false;
    }

    if(!patt.test(JachinId('St_number').value)){
      alert("学号只能由数字组成");
      JachinId('St_number').focus();
      return false;
    }

    if(JachinId('St_name').value == "请输入正确姓名"){
      alert("姓名不能为空，请输入姓名");
      JachinId('St_name').focus();
      return false;
    }

    if(JachinId('st_pass').value == ""){
      alert("登录密码不能为空");
      JachinId('st_pass').focus();
      return false;
    }

    if(JachinId('St_m_phone').value == "填写有效联系方式")
      JachinId('St_m_phone').value = "";

    if(JachinId('St_qq').value == "填写有效的QQ号码")
      JachinId('St_qq').value = "";

    if(JachinId('St_email').value == "请填写有效的邮箱")
      JachinId('St_email').value = "";
  }
</script>
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

				response.Write("<script language=javascript>window.location.href=('../index.asp');</script>")

			else

				response.Write("<script>alert('学号已存在！请返回……');history.back()</script>")

			end if

		end if

%>