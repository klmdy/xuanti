<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ҵѡ�������Ĺ���ϵͳ</title>
		<link href="../../../../../../../../../../../../../../../../../js/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.STYLE3 {
	font-size: 18px;
	
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
<%
	set rs1 = server.createobject("adodb.recordset")
	sql="select * from config"
	rs1.open sql,conn,1,3
	session("sysname")=rs1("sysname")
%>
	</head>

	<body onLoad="imgth()">
		<table width="100%" height="100%" border="0" cellpadding="0"	cellspacing="0">
			<tr>
				<td align="center" valign="middle">
				
								<p align="left">
									
								</p>
								<table width="95%" height="72" border="0" align="center"	cellpadding="0" cellspacing="0" align="center">
									<tr>
										<td>
											<center>
											<img border="0" src="byj.jpg" width="80%" height="163" align="left"></center></td>
									</tr>
							
						<tr>
							
							<td height="147"><form id="login" name="login" method="post" action="login.asp" onSubmit="return CheckForm();">
                              <table width="100%" border="0" align="left" cellspacing="3">
                                <tr>
                                  <td ><div align="right">�� �� ����</div></td>
                                  <td><div align="left">
                                      <input name="user_no" type="text" id="user_no" size="19"  title="ѧ��Ϊѧ�ţ���ʦΪ���ţ�"/>
                                      <span  title="ѧ��Ϊѧ�ţ���ʦΪ����">
										��ʾ��ѧ��Ϊѧ�ţ���ʦΪ����</span></div></td>
                                </tr>
                                <tr>
                                  <td ><div align="right">�ܡ����룺</div></td>
                                  <td><div align="left">
                                      <input name="user_pass" type="password" id="user_pass" size="19"  title="Ĭ��������123456����¼���������޸ģ�"/>
                                  <span  title="�뱣�ܺ��Լ������룡">��ʾ����ñ����Լ������룡</span></div></div></td>
                                </tr>
                                <tr>
                                  <td><div align="right">�û����ͣ�</div></td>
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
                                  <td class="FontWit"><div align="right"></div></td>
                                  <td><div align="left">
                                      <input type="submit" name="Submit" value=" �� ¼ "/>
                                      <input type="reset" name="Submit2" value=" �� �� ">
                                  </div></td>
                                </tr>
                                   <tr>
                                  <td class="FontWit"><div align="right"></div></td>
                                  <td>                                
                                  
                                  <p align="left"><font color="#FF0000">��ע�⡿��<b>ѧ������ʦ��½ϵͳǰ���ȵ��-&gt;</b></font><b><a target="_blank" href="zhuce.asp"><font color="#FF0000">ע��</font></a><font color="#FF0000">��</font></b></p>
									<p align="left">
									ע����Ϻ󣬴�ϵͳ���ͨ�����ܵ�¼����ע���ʱ����Ϣ��д��ʵ������<br>
									��ʼ���룺123456<br>
									ѧ��ע���������Լ���ѧ��<br>
									��ʦע���������Լ��Ĺ���</p>
									<p align="left">��ʾ�û��������룺<br>
									��������Ա���û�����00000�����룺123456��<br>
									��ʦ���û�����00001�����룺123456<br>
									ѧ����ѧ�ţ�1201040001�����룺123456</span></span><p>
                                  
                                  
                                  </td>
                                </tr>
                                
                               
                              </table>
						    </form></td>
						</tr>
					</table>
<hr size="1" color="#008000" noshade>     
<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<p align="center">
								<img src="by1.jpg" width="118" height="82" name=imgs id=imgs style="filter:revealTrans(Duration=4,Transition=22);border: 1px inset #000000;">
<script language="javascript1.2">
var j=1;
fadeimages = new Array()
for(var i=0; i <= 1; i++) {
fadeimages[i] = new Image()
}
fadeimages[0]="by1.jpg"
fadeimages[1]="by2.jpg"
fadeimages[2]="by3.jpg"
function imgth(){
document.all.imgs.filters.revealTrans.apply();
document.all.imgs.src=fadeimages[j];
document.all.imgs.filters.revealTrans.Transition=parseInt(23*Math.random());
document.all.imgs.filters.revealTrans.play();
j+=1
if (j>1)j=0;
setTimeout("imgth()",5000);
}
</script>							</td>
						</tr>
					</table>
  
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								<div align="center">
									<p>����ʦ����ѧ�麣��У��Ϣ����ѧԺ��Ȩ����</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>