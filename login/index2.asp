<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>����ѡ�������ϵͳ</title>
		<link href="../js/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.STYLE3 {
	font-size: 12px;
	color: #FFFFFF;
	text-decoration: none;
}
.STYLE4 {
	color: #FFFFFF;
	font-family: "����_GB2312";
	font-size: 24px;
	font-weight: bold;
}
        </style>

<script language="javascript" type="text/javascript">
function CheckForm()
{ 
	if (document.login.user_no.value.length == 0) { 
	alert("�������û���ţ�ѧ��Ϊ8λ����ѧ��!");
	document.login.user_no.focus();
	return false;
	}
	return true;
}
</script>
<!--#include file="../inc/Conn.asp" -->

	</head>

	<body >
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center" valign="middle">
					<table width="817" height="273" border="0" cellpadding="0"	cellspacing="0" >
						<tr>
							<td>&nbsp;
								
							</td>
							<td>
								<p align="center">
									<br>
									<b>
									<font color="#0000FF" face="Arial Unicode MS" size="5">
									����ѡ�������ϵͳ</font></b></p>
								<hr size="1">
							
							</td>
						</tr>
						<tr>
							<td width="100">&nbsp;
								
							</td>
							<td height="188"><form id="login" name="login" method="post" action="login.asp" onSubmit="return CheckForm();">
								<table width="100%" border="0" align="left" cellspacing="3" height="203">
                                <tr>
                                  <td class="FontWit" height="59"><div align="right">
									<b>
									<font size="3">
									<span style="background-color: #0000FF">�û�����</span></font></b></div></td>
                                  <td height="59"><div align="left">
                                      <input name="user_no" type="text" id="user_no" size="20" >
                                    	<font color="#FF0000">ѧ��������ѧ�ţ���ʦ�����빤�ţ�</font></div></td>
                                </tr>
                                <tr>
                                  <td class="FontWit" height="44"><div align="right">
									<b>
									<font size="3">
									<span style="background-color: #0000FF">�ܡ��룺</span></font></b></div></td>
                                  <td height="44"><div align="left">
                                      <input name="user_pass" type="password" id="user_pass" size="20"  title="Ĭ��������123456����¼���������޸ģ�"/>
                                 </div></div></td>
                                </tr>
                                <tr>
                                  <td class="FontWit"><div align="right">
									<b>
									<font size="3">
									<span style="background-color: #0000FF">�û����ͣ�</span></font></b></div></td>
                                  <td><div align="left">
                                      <select name="u_type" id="u_type">
                                        <%
				set rs=server.createobject("adodb.recordset")    
				sql="select * from user_type order by id desc"    
				rs.open sql,Conn,1,3
			%>
                                        <%do while not rs.eof%>
                                        <option value="<%=rs("U_T_id")%>"><%=rs("u_type")%></option>
                                        <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
				conn.close
				set conn = nothing
			%>
                                      </select>
                                  </div></td>
                                </tr>
                                <tr>
                                  <td class="FontWit" height="45"><div align="right"></div></td>
                                  <td height="45"><div align="left">
                                      <input type="submit" name="Submit" value=" �� ¼ "/>
                                      <input type="reset" name="Submit2" value=" �� �� ">
                                  </div></td>
                                </tr>
                              </table>
						    </form></td>
						</tr>
					</table>
					<p>
					<font size="4"><b>ѧ������ϵͳ������<a href="zhuce.asp">ע��</a>������ϵͳ����Աͨ�����ٽ��е�¼��</b></font></p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" height="60">
						<tr>
							<td>
								<div align="center" class="FontWit">
									<img border="0" src="../Images/logo.jpg" width="126" height="46"></div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>