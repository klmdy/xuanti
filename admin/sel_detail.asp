<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>

<title>查看学生</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>

  <center>
	<%
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from select_cursor where Sel_id="&request("ID")&""
	'response.Write(sql)
	rs.open sql,conn,1,1
%>

<table width="100%" border="0" cellpadding="3" cellspacing="2" bgcolor="#6298E1">
  <tr>
      <td height="24" nowrap="nowrap" bgcolor="#EBF2F9"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="editProduct" idth="100%">
        <tr>
          <td width="120" height="20" align="right">　</td>
          <td><div align="left"><b><font color="#FF0000">该选题详细信息如下</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">题目：</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("Sel_name")%>
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="17" align="right"><b><font color="#800000">难度等级：</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("Sel_level")%>
            &nbsp;</font></b></div></td>
        </tr>
           <tr>
          <td height="23" align="right"><b><font color="#800000">对应学生的年级：</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
            <%=rs("Sel_cour")%> 
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="17" align="right"><b><font color="#800000">最多选题人数：</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
             <%=rs("Sel_nu")%> 
            &nbsp;</font></b></div></td>
        </tr>
        <tr>
          <td height="20" align="right"><b><font color="#800000">选题主要内容：</font></b></td>
          <td><div align="left"><b><font color="#008000">&nbsp;
             <%=rs("Sel_con")%> 
            &nbsp;</font></b></div></td>
        </tr>
          
       
        <tr>
          <td height="30" align="right">　</td>
          <td valign="bottom"><div align="left">
		  			<%		address = request.ServerVariables("HTTP_REFERER")%>
			<input type="button" name="submitSaveEdit3" value="返回上一页" class="button" onclick="javascript:window.location.href='<%=address%>';" style="WIDTH: 60;">           
         
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
%>
</center>
</body>
</html>