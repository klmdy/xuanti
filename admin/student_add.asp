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
			alert("������ѧ��!");
			document.editForm.St_number.focus();
			return false;
			}
			if (document.editForm.St_name.value.length == 0) { 
			alert("������ѧ����!");
			document.editForm.St_name.focus();
			return false;
			}
			if (document.editForm.Sp_id.value.length == 0) { 
			alert("��ѡ��רҵ����!");
			document.editForm.Sp_id.focus();
			return false;
			}
			
			return true;
		}
</script>
<title>�鿴ѧ��</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<!--#include file="../inc/Md5.asp" -->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѧ��������ӣ��޸�ѧ����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><a href="student_add.asp?Result=Add" onClick='changeAdminFlag("���ѧ��")'>���ѧ��</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="student_list.asp" onClick='changeAdminFlag("�鿴����ѧ��")'>�鿴����ѧ��</a>
	|&nbsp;</font><a href="student_Padd.asp" onClick='changeAdminFlag("��������ѧ����Ϣ")'>��������ѧ����Ϣ</a>
	|&nbsp;</font><a href="student_excel.asp" onclick='changeAdminFlag(&quot;��������ѧ����Ϣ&quot;)'>����ѧ����Ϣ</a>
	
	

           
	
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
  <form name="editForm" method="post" action="student_add.asp?Action=addnew" onsubmit="return depart_add()">
  <tr>
    <td height="24" nowrap bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id=editProduct idth="100%">

      <tr>
        <td width="216" height="20" align="right">��</td>
        <td><div align="left"></div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">ѧ�ţ�</font></b></td>
        <td><div align="left">
          <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" size="15">
          &nbsp;*&nbsp;�����ظ�</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">ѧ��������</font></b></td>
        <td><div align="left">
            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" size="19" />
          &nbsp;*</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">��¼���룺</font></b></td>
        <td><div align="left">
            <input name="st_pass" type="text" class="textfield" id="st_pass" style="WIDTH: 120;" value="123456" size="19" /> 
			&nbsp;*��ʼ����Ϊ123456������ͨ����ѧ���ɵ�¼�����޸��µ�����</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">רҵ��</font></b></td>
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
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">ѧԺ��</font></b></td>
        <td><div align="left">
            <input name="St_origin" type="text" class="textfield" id="St_origin" style="WIDTH: 120;" size="19" value="��Ϣ����ѧԺ" readonly> </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�꼶��</font></b></td>
        <td><div align="left">
                  <select size="1" name="St_grade" id="St_grade">
  <option selected>��ѡ��</option>
  <option value="2012">2012��</option>
  <option value="2013">2013��</option>
  <option value="2014">2014��</option>
  <option value="2015">2015��</option>
 </select>
            </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�༶��</font></b></td>
        <td><div align="left">
            
          <select size="1" name="St_class" id="St_class">
  <option value="01" selected>01��</option>
  <option value="02">02��</option>
   </select>
         </div></td>
      </tr>
         <tr>
        <td height="20" align="right"><b><font color="#800000">�Ա�</font></b></td>
        <td><div align="left">&nbsp;
          <label>
          <input type="radio" name="St_sex" value="��" checked="checked"  />
          ��</label>
          <label>
          <input type="radio" name="St_sex" value="Ů" />
          Ů</label>
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�绰���룺</font></b></td>
        <td><div align="left">
            <input name="St_phone" type="text" class="textfield" id="St_phone" style="WIDTH: 120;" size="19" />
        </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�ֻ����룺</font></b></td>
        <td><div align="left">
            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" size="19" />
          &nbsp;&nbsp; *����д��ǰ��Ч����ϵ��ʽ </div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">QQ��</font></b></td>
        <td><div align="left">
            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
      </tr>
      <tr>
        <td height="20" align="right"><b><font color="#800000">�������䣺</font></b></td>
        <td><div align="left">
            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" size="19" />
          &nbsp;</div></td>
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
	sql="select * from student_info where Id="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,3,2

%>

<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
<form name="editForm" method="post" action="student_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">    <tr>
      <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
        <tr>
          <td width="120" height="20" align="right">��</td>
          <td><div align="left"></div></td>
        </tr>
        <tr>
          <td height="20" align="right">ѧ�ţ�</td>
          <td><div align="left">
            <input name="St_number" type="text" class="textfield" id="St_number" style="WIDTH: 120;" value="<%=rs("St_number")%>" size="15" readonly/> </div></td>
        </tr>
        <tr>
          <td height="20" align="right">ѧ��������</td>
          <td><div align="left">
            <input name="St_name" type="text" class="textfield" id="St_name" style="WIDTH: 120;" value="<%=rs("St_name")%>" size="19" readonly /> 
			&nbsp;</div></td>
        </tr>
     
         <tr>
          <td height="20" align="right">����ѧԺ��</td>
          <td><div align="left">
            <input name="St_origin" type="text" class="textfield" id="St_origin" style="WIDTH: 120;" value="��Ϣ����ѧԺ" size="19" readonly> </div></td>
        </tr>
        <tr>
          <td height="20" align="right">��ѧרҵ��</td>
          <td><div align="left">
            <select name="Sp_id" id="Sp_id">
              <%    
				set rs1=server.createobject("adodb.recordset")    
				sql1="select * from speciality where Sp_id='"&rs("Sp_id")&"'"    
				rs1.open sql1,Conn,1,3
			%>
             
              <option value="<%=rs1("Sp_id")%>"><%=rs1("Sp_name")%></option>
           
            </select>
          </div></td>
        </tr>
       
        <tr>
          <td height="20" align="right">�����꼶��</td>
          <td><div align="left">
            <input name="St_grade" type="text" class="textfield" id="St_grade" style="WIDTH: 120;" value="<%=rs("St_grade")%>" size="19" readonly/>
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">���ڰ༶��</td>
          <td><div align="left">
            <input name="St_class" type="text" class="textfield" id="St_class" style="WIDTH: 120;" value="<%=rs("St_class")%>" size="19" readonly />
            &nbsp;</div></td>
        </tr>       
       
        <tr>
          <td height="20" align="right">�Ա�</td>
          <td><div align="left">&nbsp;
                    <label>
					
                    <input name="St_sex" type="radio" value="<%=rs("St_sex")%>" checked="checked" />
                      <%=rs("St_sex")%></label>
                              </div></td>
        </tr>
        <tr>
          <td height="20" align="right">�ֻ����룺</td>
          <td><div align="left">
            <input name="St_m_phone" type="text" class="textfield" id="St_m_phone" style="WIDTH: 120;" value="<%=rs("St_m_phone")%>" size="19" readonly />
            &nbsp;* �������д��Ч��ϵ��ʽ </div></td>
        </tr>
        <tr>
          <td height="20" align="right">QQ��</td>
          <td><div align="left">
            <input name="St_qq" type="text" class="textfield" id="St_qq" style="WIDTH: 120;" value="<%=rs("St_qq")%>" size="19" readonly />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="20" align="right">�������䣺</td>
          <td><div align="left">
            <input name="St_email" type="text" class="textfield" id="St_email" style="WIDTH: 120;" value="<%=rs("St_email")%>" size="19" readonly />
            &nbsp;</div></td>
        </tr>
        <tr>
          <td height="30" align="right">��</td>
          <td valign="bottom"><div align="left">
            <input name="submitSaveEdit3" type="submit" class="button"  id="submitSaveEdit3" value=" �� ׼ " style="WIDTH: 60;">
            
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
</center>
</body>
</html>


<%
'Action=addnew	�������
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
				rs("St_sex")=trim(request.form("St_sex"))
				rs("St_agree")=true
				rs("St_m_phone")=trim(request.form("St_m_phone"))
				rs("St_qq")=trim(request.form("St_qq"))
				rs("St_email")=trim(request.form("St_email"))
				rs.update
				rs.close
				set rs = nothing
				response.Redirect("student_list.asp")
			else
				response.Write("<script>alert('ѧ���Ѵ��ڣ��뷵�ء���');history.back()</script>")
			end if
		end if

'Action=addnew	�޸�����
	Action=request.QueryString("Action")
	if Action = "SaveEdit" then
		St_number = trim(request.form("St_number"))
		set rs = server.createobject("adodb.recordset")
		sql1="select * from student_info where ID="&request("ID")
		rs.open sql1,conn,1,3
			rs("St_number")=trim(request.form("St_number"))
			rs("St_name")=trim(request.form("St_name"))
			rs("Sp_id")=trim(request.form("Sp_id"))
			rs("St_origin")=trim(request.form("St_origin"))
			rs("St_grade")=trim(request.form("St_grade"))
			rs("St_class")=trim(request.form("St_class"))			
			rs("St_sex")=trim(request.form("St_sex"))
			rs("St_agree")=true
			rs("St_m_phone")=trim(request.form("St_m_phone"))
			rs("St_qq")=trim(request.form("St_qq"))
			rs("St_email")=trim(request.form("St_email"))
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("student_list.asp")
			'response.Write(sql1)
	end if
	
	Action=request.QueryString("Action")
	if Action = "shenpi" then
	
		set rs = server.createobject("adodb.recordset")
		sql1="select * from student_info where ID="&request("ID")
		rs.open sql1,conn,1,3
			
			
			   if rs("St_agree")= false  then  
			           rs("St_agree")= true
			      else 
			         rs("St_agree")= false
			      end if 
			 
					
			rs.update
			rs.close
			set rs = nothing
			response.Redirect("student_list.asp")
			'response.Write(sql1)
	end if



	if Action = "del" then
	
	
sql = "delete from sel_record where St_number='"&request("stn")&"'"

		Conn.Execute(sql)
		
		sql = "delete from select_true where St_number='"&request("stn")&"'"
		'response.Write(sql)
		Conn.Execute(sql)
sql = "delete from student_info where  ID="&request("ID")
		'response.Write(sql)
		Conn.Execute(sql)
	
		conn.close
       	set conn=nothing
		response.Write("ɾ���ɹ����뷵�ء���")
		response.Redirect("student_list.asp")
	end if
	
	
%>