<html>
<head>
<title>毕业论文选题与过程管理系统-GMS</title>
<link href="../../../../../../../../../../../../../../../../js/css.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
//-->
</script>
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link rel="stylesheet" href="file:///F:/web/gms/login/home.css" type="text/css">
<style type="text/css">
<!--
td {  font-family: "宋体"; font-size: 12px}
.input1 {  font-family: "Verdana", "Arial", "Helvetica", "sans-serif"; font-size: 12px; border-color: black black #000000; border-style: solid; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; background-image:  url(images1/1x1.gif)}
-->
</style>
<style type="text/css">
<!--
.unnamed1 {  font-size: 24pt}
-->
</style>
<script language=javascript>
	function CheckForm()
	{
		if(document.Login.UserName.value=="")
		{
			alert("请输入用户名！");
			document.Login.UserName.focus();
			return false;
		}
		if(document.Login.PassWord.value == "")
		{
			alert("请输入密码！");
			document.Login.PassWord.focus();
			return false;
		}
	}
	function ClearForm()
	{document.Login.UserName.value = "";
	 document.Login.PassWord.value = "";
	 }
</script>

<script language=javascript>
	function CheckForm()
	{
		if(document.Login.UserName.value=="")
		{
			alert("请输入用户名！");
			document.Login.user_no.focus();
			return false;
		}
		if(document.Login.user_pass.value == "")
		{
			alert("请输入密码！");
			document.Login.PassWord.focus();
			return false;
		}
	}
	function ClearForm()
	{document.Login.user_no.value = "";
	 document.Login.user_pass.value = "";
	 }
</script>
<link rel="stylesheet" href="file:///F:/web/gms/login/home.css">
<!--#include file="../inc/Conn.asp" -->
</head>
<body text="#000000"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=760 height="56">
  <TBODY>
  <TR>
    <td  class=unnamed1 width="746">
      
    <img border="0" src="biyele.jpg" height="180" width="760" ></td>  
	</TR>
  </TBODY></TABLE>
<table  border="0" align="center" cellpadding="0" cellspacing="0" height=346 background="background.jpg">  
  <tr>   
    <td  align="center" valign="top" height="346" >
    <b>    
                
      <hr size="1" color="#008000" noshade>    
           
    </b>
    <b><font color="#008000">欢迎使用毕业论文选题与文档管理系统-GMS</font></b>    <br> <br>
    <u> 
    <b> 
            <IMG height=23   src="loginTitle.gif" width=200> 
    <table width=200 border="1" cellpadding="0" cellspacing="0" bordercolor="#56B02B">
        <tbody>
          <tr> 
            <td bordercolor="#FFFFFF" bgcolor=#ffffff>
			
			 <table width="100%" cellspacing="5" bgcolor="#FFFFFF">
				<form name="Login" action="login.asp" method="Post"  onSubmit="return CheckForm()">
                  <tr> 
                    <td align=left width="29%">用户名:</td>
                    <td width="62%"><input name="user_no" type="text" id="user_no" size="16"  title="学生为学号，教师为工号！"/>
 </td>
                     

                  </tr>
                  <tr> 
                    <td align=left width="29%">密&nbsp;码:</td>
                    <td height="24" width="62%"> <input name="user_pass" type="password" id="user_pass" size="16"  title="密码请妥善保管！"/>

                    </td>
                  </tr>
                   <tr> 
                    <td align=left width="29%">类&nbsp;型:</td>
                    <td width="62%"><select name="u_type" id="u_type">
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
 </td>
                  </tr>

                  <tr align=center> 
                    <td colspan="2" height="30"> 
                    <input  type="image"   name="Submit"  src="buttonlogin.gif" width="52" height="18"> 
                   <a href='javascript:ClearForm()'><img src="buttonclear.gif" alt="清除" name="clear" width="52" height="18" border="0"></a>                     </td>
                  </tr>                 
                </form>
              </table>
              </td>
              </tr>
              </tbody>
 </table>
              <br>
            </b></u><font color="#0000FF">请注意：学生第一次登录，需首先进行</font><a target="_blank" href="zhuce.asp"><font color="#FF0000">注册--></font></a> 
 <p align="center"><font color="#FF0000">
    <marquee width="768" height="18" scrolldelay="100">学生第一次登录注册的时候，请将个人信息填写完整和正确，待审核通过后方可登录。用户名请选用自己的学号，密码自行设定”！</marquee>
 </font>    
    <p>               
    <img border="0" src="by.jpg" width="58" height="54"> <b>               
       <br>
	<img border="0" src="1.jpg" width="42" height="39"><a href="毕业设计材料.zip"><font color="#008000">下载毕业设计材料（含开题报告、论文模板、论文评定表、答辩情况表等）</font></a><font color="#0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
		<img border="0" src="2.jpg" width="51" height="37"><a href="本科毕业生论文写作技巧和方法.doc"><font color="#0000FF">毕业论文写作技巧</font>分享</a><hr size="1" color="#008000" noshade>  
    </b> 
</table>     
                   
 <TABLE align=center height=8 width=760>                  
        
    <TD height=1 width=754>   
     <p align="center">技术支持：北京师范大学信息技术学院<font color="#000000"><font face="Arial">海豚创新创业团队<br>
                          
      Copyright &copy;2015 BNUZ-ITC.&nbsp; All rights reserved</font> <br>
                          
      </font>
		<img border="0" src="haitun.jpg" ></p>             
                    
      </TD></TABLE>                   
                  
                  
                 
                 
</body>                 