<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" src="../js/Admin.js"></script>

<title>�����޸�</title>

</head>





<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->

<!--#include file="../inc/Md5.asp" -->



<body style="background:#f0f0f0;margin:0px;height:100%;">

<%

	'��������

	if session("user_no") <> "" then

		set rs=server.CreateObject("adodb.recordset")

		sql="select * from student_info where St_number='"&session("user_no")&"'"

		rs.open sql,conn,3,2

%>

<div style="width:100%;height:100%;background:rgb(192, 219, 255);">
  <br />
  <form style="margin:0;" name="editForm" method="post" action="student_edit1.asp?Action=modif">  

    <div align="center" style="padding:5px;">
      <b><font color="#008000" size="4px">�鿴/�޸ĸ�������</font></b>
    </div>
    <div align="center" style="padding:5px;">
      <font color="#FF0000"><b>(��ע�⣺���޸ĸ������ϵ�ʱ������ҲҪ�ٴ����룩</font></b>
    </div>
    <div style="margin-left:20%;">
      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>ѧ&#12288;&#12288;�ţ�</b></font>
          <input name="St_number" type="text" class="textfield" id="St_number" value="<%=rs("St_number")%>" size="10" readonly="true" ><font color="red">*�����޸�</font>
      </div>
        

      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>ѧ��������</b></font>
        <input name="St_name" type="text" class="textfield" id="St_name" value="<%=rs("St_name")%>" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18">
      </div>

      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>������&#12288;��</b></font>
        <input name="st_pass" class="textfield" id="st_pass" style="WIDTH: 120; height:17" value="������������" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18">
      </div>


      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>�ٴ��������룺</b></font>
        <input name="st_pass1" class="textfield" id="st_pass1" value="������������" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="15">
      </div>


      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>��ѧרҵ��</b></font>
          <select name="Sp_id" id="Sp_id">
            <%    

        		set rs1=server.createobject("adodb.recordset")    

        		sql1="select * from speciality "

            sql1="select * from  speciality where Sp_id='"& rs("Sp_id")&"'"    
        		rs1.open sql1,Conn,1,3

            %>
            <option value="<%=rs("Sp_id")%>"><%=rs1("Sp_name")%></option>
          </select>

        </div>

        <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>�����꼶��</b></font>
          <input name="St_grade" type="text" class="textfield" id="St_grade" value="<%=rs("St_grade")%>" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18" />
        </div>

        <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>���ڰ༶��</b></font>
          <input name="St_class" type="text" class="textfield" id="St_class" value="<%=rs("St_class")%>" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18" />
        </div>

      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>��&#12288;&#12288;��&#12288;&#12288;</b></font>
        <label>
      		<%
            if rs("St_sex")="��" then
      		%>
          <input name="St_sex" type="radio" value="��" checked="checked" />��
        </label>&#12288;&#12288;
        <label>
          <input type="radio" name="St_sex" value="Ů" />Ů
      		<% else  %>
      		<input name="St_sex" type="radio" value="��" />��
        </label>&#12288;&#12288;
        <label>
          <input type="radio" name="St_sex" value="Ů" checked="checked"/>Ů
      		<% end if %>
      	</label>
      </div>  

      <div style="margin:5px 0 0 5px;">
      <font color="#0000FF"><b>�ֻ����룺</b></font>
        <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" value="<%=rs("St_m_phone")%>" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18" />
        </div>

      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>&nbsp;Q&#12288;&#12288;Q&nbsp;��</b></font>
        <input name="St_qq" type="text" class="textfield" id="St_qq" value="<%=rs("St_qq")%>" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18" />
      </div>

      <div style="margin:5px 0 0 5px;">
        <font color="#0000FF"><b>�������䣺</b></font>
        <input name="St_email" type="text" class="textfield" id="St_email" value="<%=rs("St_email")%>" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" size="18" />
      </div>
    </div>

    <div align="center" style="margin:10px;">
      <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " />&#12288;&#12288;
      <input name="submitSaveEdit22" type="reset" class="button"  id="submitSaveEdit22" value=" �� �� " />&#12288;&#12288;
      <input type="button" class="button" id="back" style="width:60px;"/>
    </div>
    <br />
    <br />
  </form>
</div>



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

				response.Write("<script>alert('�޸ĳɹ���');window.location.href='bnuzitc1.asp';</script>")

				

			

				'response.Redirect("student_edit.asp")

			

		end if

	

%>

</body>
<script>
  function JachinId(x){
    return document.getElementById(x);
  }

  JachinId('back').value = "����";
  JachinId('back').onclick = function () {
    window.location.href='bnuzitc1.asp';
  }

  document.getElementsByTagName('form')[0].onsubmit = function() {
    var patt = /^[0-9]{0,100}$/;

    if(JachinId('St_name').value == ""){
      alert("��������Ϊ�գ�����������");
      JachinId('St_name').focus();
      return false;
    }

    if(JachinId('st_pass').value == "������������"){
      alert("�����벻��Ϊ��");
      JachinId('st_pass').focus();
      return false;
    }

    if(JachinId('st_pass1').value == "������������"){
      alert("�ٴ��������벻��Ϊ��");
      JachinId('st_pass1').focus();
      return false;
    }

    if(JachinId('st_pass').value != JachinId('st_pass1').value){
      alert("�����������벻һ��");
      JachinId('st_pass').focus();
      return false;
    }
  }
</script>
</html>