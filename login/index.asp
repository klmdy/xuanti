<html>
<head>
<title>��ҵ����ѡ������̹���ϵͳ-GMS</title>
<link href="../../../../../../../../../../../../../../../../../js/css.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../home.css">
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
<link rel="stylesheet" href="home.css" type="text/css">

<style type="text/css">
<!--
td {  font-family: "����"; font-size: 12px}
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
			alert("�������û�����");
			document.Login.UserName.focus();
			return false;
		}
		if(document.Login.PassWord.value == "")
		{
			alert("���������룡");
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
			alert("�������û�����");
			document.Login.user_no.focus();
			return false;
		}
		if(document.Login.user_pass.value == "")
		{
			alert("���������룡");
			document.Login.PassWord.focus();
			return false;
		}
	}
	function ClearForm()
	{document.Login.user_no.value = "";
	 document.Login.user_pass.value = "";
	 }



</script>
<link rel="stylesheet" href="home.css">
<!--#include file="../inc/Conn.asp" -->
</head>
<body text="#000000"  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=760 height="56">
    <TBODY>
         <TR>
                <td  class=unnamed1 width="746">
                       <img border="0" src="biyele.jpg" height="180" width="760" >
                </td>
	     </TR>
    </TBODY>
  </TABLE>

<table  border="0" align="center" cellpadding="0" cellspacing="0" height=346 background="background.jpg">  
  <tr>   
    <td  align="center" valign="top" height="346" >
            <b>
                <hr size="1" color="#008000" noshade>
            </b>

            <b><font color="#008000" face="Times New Roman">��ӭʹ�û���Web�ı�ҵ����ѡ������̻�����ϵͳ-</font><font color="#FF0000" face="Times New Roman">WebGMS</font><font color="#FF0000"><br>
	        </font></b>

            <font color="#FF0000">&nbsp;</font><br>
	        <u>
            <b>
            <img height=23   src="loginTitle.gif" width=200>

 <table width=200 border="1" cellpadding="0" cellspacing="0" bordercolor="#56B02B">
        <tbody>
          <tr> 
            <td bordercolor="#FFFFFF" bgcolor=#ffffff>
			
			 <table width="100%" cellspacing="5" bgcolor="#FFFFFF">
				<form name="Login" action="login.asp" method="Post"  onSubmit="return CheckForm()">

                  <tr> 
                    <td align=left width="29%">�û���:</td>
                    <td width="62%"><input name="user_no" type="text" id="user_no" size="16"  title="ѧ��Ϊѧ�ţ���ʦΪ���ţ�"/></td>
                  </tr>

                  <tr> 
                    <td align=left width="29%">��&nbsp;��:</td>
                    <td height="24" width="62%"> <input name="user_pass" type="password" id="user_pass" size="16"  title="���������Ʊ��ܣ�"/></td>
                  </tr>
                   <tr> 
                    <td align=left width="29%">��&nbsp;��:</td>
                            <td width="62%">
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
                             </td>
                  </tr>

                  <tr align=center> 
                    <td colspan="2" height="30">

                    <input  type="image"   name="Submit"  src="buttonlogin.gif" width="52" height="18">

                    <a href='javascript:ClearForm()'><img src="buttonclear.gif" alt="���" name="clear" width="52" height="18" border="0"></a>

					<a target="_blank" href="zhuce.asp">ע��</a></td>
                  </tr>
                </form>

              </table>
              </td>
              </tr>
              </tbody>
 </table>
              <br>
            </b></u><b><font color="#FF0000">��ע�⣺</font></b><font color="#000000">1.ѧ����һ�ε�¼ϵͳʱ��������</font><b><font color="#800000"><a target="_blank" href="zhuce.asp">����ע��--></a></font></b>��<font color="#000000">ע����ɵȴ������󷽿ɵ�¼ϵͳ</font>��<p><font color="#000000">2.ѧ����һ�ε�¼ע���ʱ���뽫������Ϣ��д��������ȷ�������ͨ���󷽿ɵ�¼��</font><b><font color="#FF0000">�û�����ѡ���Լ���ѧ��</font></b><font color="#000000">�����������趨�����Ʊ��ܣ�</font></p>
	<p><font color="#000000">3.ѧ���ڽ��б�ҵ��ƹ�������ͨ��ϵͳ��</font><b><font color="#FF0000">�����빵ͨ</font></b><font color="#000000">����ָ����ʦ��ʱ��ͨ�ͽ׶ν�����ѧ����ָ����ʦ��������Ϣ����Ϊ��ҵ��ƿ��˵�һ�����ݡ�</font></p>
	<p><font color="#000000">
	4.��ҵ���������ͬѧ�Ǵ��¿�ѧ�о��Ļ����������Ǵ�ѧ����ҵ�����һ�أ����Ͻ���ʵ����ɼȶ�����Ŀ�겢׫д���ģ�</font><b><font color="#FF0000">�Ͻ����ĳ�Ϯ</font></b><font color="#000000">��</font></p>
	<p><b><font color="#008000">
    <marquee width="768" height="18" scrolldelay="100">ʹ�ò��裺ѧ��ע��-�ȴ�����Ա����������ͨ����-��¼ϵͳѡ�⣨��ָ����ʦЭ�̺�ѡ���Ӧ��Ŀ��-�ȴ�ָ����ʦ����������ͨ����-�ϴ�������ϵ�ָ��Ŀ¼��</marquee></font></b></p>
	<p><font color="#FF0000"><b>���������ҵ��</b><br>
       <SCRIPT language=JavaScript> 
<!-- 
var bannerAD=new Array(); 
var bannerADlink=new Array(); 
var adNum=0; 

bannerAD[0]="bys0.jpg";
bannerAD[1]="bys1.jpg";
bannerAD[2]="bys2.jpg";
bannerAD[3]="bys3.jpg";
bannerAD[4]="bys4.jpg";
bannerAD[5]="bys5.jpg";
bannerAD[6]="bys6.jpg";
bannerAD[7]="bys7.jpg";
bannerAD[8]="bys8.jpg";
bannerAD[9]="bys9.jpg";
preloadedimages=new Array();
for (i=1;i<bannerAD.length;i++){
preloadedimages[i]=new Image();
preloadedimages[i].src=bannerAD[i];
}
function setTransition(){
if (document.all){
bannerADrotator.filters.revealTrans.Transition=Math.floor(Math.random()*23);
bannerADrotator.filters.revealTrans.apply();
}
}
function playTransition(){
if (document.all)
bannerADrotator.filters.revealTrans.play()
}
function nextAd(){
if(adNum<bannerAD.length-1)adNum++ ;
else adNum=0;
setTransition();
document.images.bannerADrotator.src=bannerAD[adNum];
playTransition();
theTimer=setTimeout("nextAd()", 1000);
}
function displayStatusMsg() {
status=bannerADlink[adNum];
document.returnValue = true;
} 
//-->
</SCRIPT>
	</font><IMG style="FILTER: revealTrans(duration=2,transition=20)" height=120 src="../login/by1.jpg" width=200 border=0 name=bannerADrotator></p>
	<p>
<SCRIPT language=JavaScript>nextAd()</SCRIPT>
 <b>               
	<img border="0" src="1.jpg" width="42" height="39"><font color="#008000"><a href="��ҵ��Ʋ���.zip">���ر�ҵ��Ʋ���</a></font><font color="#0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
		<img border="0" src="2.jpg" width="51" height="37"><font color="#0000FF"><a href="���Ʊ�ҵ������д�����ɺͷ���.doc">��ҵ����д�����ɷ���</a><hr size="1" color="#008000" noshade>  
    </b> 
</table>         
 <TABLE align=center height=8 width=760> 
    <TD height=1 width=754>   
     <p align="center">����ʦ����ѧ�麣��У��Ϣ����ѧԺ��Ȩ����<br>
      Copyright &copy;2015 BNUZ-ITC.&nbsp;All rights reserved<br>
		����֧�֣���ʦ�顰���ࡱ���´�ҵ�Ŷӣ�QQ:29297893��<br>                          
      </font>                           
		<img border="0" src="haitun.jpg" width="185" height="48" ></p> 
      </TD></TABLE>  
</body>                 