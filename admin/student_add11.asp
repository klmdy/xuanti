<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>

<title>�鿴ѧ��</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѧ��������ӣ��޸�ѧ����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9"><font color="#0000FF">&nbsp;</font><b><a href="student_list.asp" onClick='changeAdminFlag("�鿴����ѧ��")'><font color="#800000">�鿴����ѧ��</font></a><font color="#800000">
	|&nbsp;</font></font><a href="student_excel.asp" onclick='changeAdminFlag(&quot;��������ѧ����Ϣ&quot;)'><font color="#800000">����ѧ����Ϣ</font></a><font color="#800000">
	</font></b>	</td>    
  </tr>
</table>
  <center>
	<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from student_info where Id="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,1,1
%>

<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
<form name="editForm" method="post" action="student_add.asp?Action=SaveEdit&ID=<%=request("ID")%>" onsubmit="return depart_add()">    <tr>
      <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
        <tr>
          <td width="120" height="20" align="right">��</td>
          <td><div align="left"><b><font color="#FF0000">��ѧ����ϸ��Ϣ����</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">ѧ��ѧ�ţ�</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_number")%>
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="17" align="right"><b><font color="#800000">ѧ��������</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_name")%>
            &nbsp;</font></b></div></td>
        </tr>
           <tr>
          <td height="23" align="right"><b><font color="#800000">����ѧԺ��</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_origin")%> 
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="23" align="right"><b><font color="#800000">����רҵ��</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
         
              <%    
				set rs1=server.createobject("adodb.recordset")    
				sql="select * from speciality where Sp_id = '"&rs("sp_id")&"'"    
				rs1.open sql,Conn,1,3		%>
              
			 <%=rs1("sp_name")%></option>
            
          </font></b>
            
          </div></td>
        </tr>
     
        <tr>
          <td height="17" align="right"><b><font color="#800000">�����꼶��</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
             <%=rs("St_grade")%> 
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">���ڰ༶��</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
             <%=rs("St_class")%> 
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">�������£�</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_date")%> 
          </font></b> 
          </div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">���֤�ţ�</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("identity_card")%> 
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">�����ص㣺</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_adress")%>            &nbsp;</font></b></div></td>
        </tr>
        <tr> 
          <td height="20" align="right"><b><font color="#800000">��  ��</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
                    <label>
					<%=rs("St_sex")	%>                   
					  </label>
          	</font></b>
          </div></td>
        </tr>
          <tr>
          <td height="20" align="right"><b><font color="#800000">�ֻ����룺</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_m_phone")%>
            &nbsp; </font></b> </div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">�绰���룺</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("St_phone")%>
          </font></b>
          </div></td>
        </tr>
      
        <tr>
          <td height="20" align="right"><b><font color="#800000">QQ��</font></b></td>
          <td><div align="left">
           <b><font color="#008000">
           <%=rs("St_qq")%>
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">�������䣺</font></b></td>
          <td><div align="left">
            <b><font color="#008000">
            <%=rs("St_email")%>
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="30" align="right">��</td>
          <td valign="bottom"><div align="left">
		  			<%		address = request.ServerVariables("HTTP_REFERER")%>
			<input type="button" name="submitSaveEdit3" value="������һҳ" class="button" onclick="javascript:window.location.href='<%=address%>';" style="WIDTH: 60;">           
         
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
%>
</center>
</body>
</html>