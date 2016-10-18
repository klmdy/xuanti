<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>毕业选题与论文管理系统</title>
		<link href="../../../../../../../../../../../../../../../../../js/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
.STYLE3 {
	font-size: 18px;
	
	text-decoration: none;
}
.STYLE4 {
	color: #FFFFFF;
	font-family: "楷体_GB2312";
	font-size: 24px;
	font-weight: bold;
}
        </style>

<script language="javascript" type="text/javascript">
function CheckForm()
{ 
	if (document.login.user_no.value.length == 0) { 
	alert("请输入用户编号，学生为8位数的学号!");
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
                                  <td ><div align="right">用 户 名：</div></td>
                                  <td><div align="left">
                                      <input name="user_no" type="text" id="user_no" size="19"  title="学生为学号，教师为工号！"/>
                                      <span  title="学生为学号，教师为工号">
										提示：学生为学号，教师为工号</span></div></td>
                                </tr>
                                <tr>
                                  <td ><div align="right">密　　码：</div></td>
                                  <td><div align="left">
                                      <input name="user_pass" type="password" id="user_pass" size="19"  title="默认密码是123456，登录后请自行修改！"/>
                                  <span  title="请保管好自己的密码！">提示：请好保管自己的密码！</span></div></div></td>
                                </tr>
                                <tr>
                                  <td><div align="right">用户类型：</div></td>
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
                                      <input type="submit" name="Submit" value=" 登 录 "/>
                                      <input type="reset" name="Submit2" value=" 重 置 ">
                                  </div></td>
                                </tr>
                                   <tr>
                                  <td class="FontWit"><div align="right"></div></td>
                                  <td>                                
                                  
                                  <p align="left"><font color="#FF0000">【注意】：<b>学生或老师登陆系统前请先点击-&gt;</b></font><b><a target="_blank" href="zhuce.asp"><font color="#FF0000">注册</font></a><font color="#FF0000">。</font></b></p>
									<p align="left">
									注册完毕后，待系统审核通过后方能登录！请注册的时候将信息填写真实完整！<br>
									初始密码：123456<br>
									学生注册名请用自己的学号<br>
									老师注册名请用自己的工号</p>
									<p align="left">演示用户名和密码：<br>
									超级管理员：用户名：00000；密码：123456；<br>
									教师：用户名：00001；密码：123456<br>
									学生：学号：1201040001；密码：123456</span></span><p>
                                  
                                  
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
									<p>北京师范大学珠海分校信息技术学院版权所有</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>