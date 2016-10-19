<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="CheckAdmin.asp"-->
<html>
<head>
<title>毕业设计欢迎界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.  5, maximum-scale=2.0, user-scalable=yes" />
<link rel="stylesheet" href="../home.css">
<script language=JavaScript>

var version = "other"                                                                                                                                                                                                               
browserName = navigator.appName;                                                                                                                                                                                                                  
browserVer = parseInt(navigator.appVersion);                                                                                                                                                                                                               
if (browserName == "Netscape" && browserVer >= 3) version = "n3";                                                                                                                                                                                                               
else if (browserName == "Netscape" && browserVer < 3) version = "n2";                                                                                                                                                                                                               
else if (browserName == "Microsoft Internet Explorer" && browserVer >= 4) version = "e4";                                                                                                                                                                                                               
else if (browserName == "Microsoft Internet Explorer" && browserVer < 4) version = "e3";                                                                                                                                                                                                               
function marquee1()                                                                                                                                                                                                               
{                                                                                                                                                                                                               
if (version == "e4")                                                                                                                                                                                                               
{                                                                                                                                                                                                               
document.write("<marquee behavior=scroll direction=up width=100% height=250 scrollamount=1 scrolldelay=60 onmouseover='this.stop()' onmouseout='this.start()'>")                                                                                                                                                                                                               
}                                                                                                                                                                                                               
}                                                                                                                                                                                                               
function marquee2()                                                                                                                                                                                                               
{                                                                                                                                                                                                               
if (version == "e4")                                                                                                                                                                                                               
{                                                                                                                                                                                                               
document.write("</marquee>")                                                                                                                                                                                                               
}                                                                                                                                                                                                               
}                                                                                                                                                                                                               

</script>
<style>

@media screen and (max-device-width: 480px) {
#divMain{
float: none;
width:auto;
}
#divSidebar {
display:none;
}
}
body
{
height: 100%;
}
</style>

</head>
<body bgcolor="#F6F6F6" topmargin="0"  leftmargin="0">
 <center>

  
  <table border=0 bordercolorlight=#ffffff bordercolordark=#ffffff cellspacing=0 cellpadding=0>
 <tr>
    <td  height="27" align="center" bgcolor="#0000FF" >
    <font color="#FFFF00"><b>欢迎使用基于Web的毕业论文选题与文档过程化管理系统-WebGMS1.0</b></font></td>
  </tr>

  <tr>                                                                                                                                                    
    <td  height="69" vAlign="center" align="center"> 
    <br> 
    <p align="left" style="line-height: 200%;word-wrap: break-word;">
    &nbsp;&nbsp;&nbsp;          
  <b>毕业论文选题与管理系统<font color="#FF0000">WebGMS</font></b>极大地方便了教师与学生进行毕业论文选题与过程化
	的管理，降低了毕业论文指导过程中的劳动强度。但是<b><font color="#FF0000">WebGMS</font></b>在给大家带来方便的同时，也提请老师和同学们注意以下几点：<br>
&nbsp;&nbsp;&nbsp;
	1.学生登录系统前需要自行注册，在注册的时候尽量将信息输入完整，注册的用户名请务必选用自己的选号，等管理员审批通过后才能登录！学生在使用过程中保管好自己的学号和登陆密码
	。<font color="#FF0000"><br>
&nbsp;&nbsp;&nbsp; 2</font>.<font color="#FF0000">学生在选题的时候，请尽量与指导老师进行协商，得到老师同意后再进行选题。否则指导老师会退选，以至于白选！<br>
&nbsp;&nbsp;&nbsp; 3</font>.选完毕业论文题目并得到指导老师确选后就可以开始毕业选题实施和论文撰写工作，学生可以利用本系统中的“交流与沟通”栏目与指导老师进行定时沟通，汇报论文进展情况以及遇到的需要解决的难题等。指导老师也会定期询问各位同学的论文进展情况，并要求学生提交相关文档或者实验结果，请学生注意经常查看“交流与沟通”栏目的“查看信息”。平时做实验的时候尽量注意结果的保存，以形成毕业论文中的素材。<br>
&nbsp;&nbsp;&nbsp; 4.同学们在撰写论文的时候一定要注意格式与学院模板一致，打印的时候最好形成PDF后再打印。<br>
&nbsp;&nbsp;&nbsp; 5.学生需要提交的文档有：论文开题报告.doc和毕业论文终稿.doc；<br>
&nbsp;&nbsp;&nbsp;
	6.指导老师需要提交的文档有：<br>
&nbsp;&nbsp;&nbsp;&nbsp; （1）论文终稿-正式打印版和电子版（纸质检查学生签名，附上毕业论文评定表）；<br>
&nbsp;&nbsp;&nbsp;&nbsp; （2）毕业论文指导手册纸质和电子版（内含开题报告、中期检查、指导记录、答辩记录、论文评定表）；<br>
&nbsp;&nbsp;&nbsp;&nbsp; （3）毕业论文评定表一份（原件，存入学生档案）；<br>
&nbsp;&nbsp;&nbsp;&nbsp; （4）指导学生如有被推荐为有论文需提前上交一份论文（评优会上讨论用）；<br>
&nbsp;&nbsp;&nbsp;&nbsp; （5）被评为校级优秀毕业论文的学生需准备两份毕业论文正稿（带封面）。<p align="left" style="line-height: 200%">&nbsp;
    <b><font color="#800000">&nbsp; 坚决杜绝论文抄袭！ </font></b>
	<p style="line-height: 200%"><font color="#FF0000"><b>
	<marquee behavior="alternate" width="100%" height="25px">预祝各位同学毕业设计顺利完成并取得好成绩！　 </marquee></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>

    </td>

  </tr>

  </table>
    <!--<table id=table8 borderColor=#bdb76b cellSpacing=0 cellPadding=0 width=250 align=center border=3>-->
<tbody>
<tr>
<td>
<script language=JavaScript>nextAd()</script>
</td> </tbody></table>
	 <button onclick="selectSysLeft()">返 回</button>
</center>
</body>



<script language=JavaScript>
<!--
var bannerAD=new Array();
var bannerADlink=new Array();
var adNum=0;

bannerAD[0]="../login/by1.jpg";
bannerAD[1]="../login/by2.jpg";
bannerAD[2]="../login/by3.jpg";
bannerAD[3]="../login/by4.jpg";
bannerAD[4]="../login/by5.jpg";
bannerAD[5]="../login/by6.jpg";
bannerAD[6]="../login/by7.jpg";
bannerAD[7]="../login/by8.jpg";preloadedimages=new Array();
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
theTimer=setTimeout("nextAd()", 2000);
}
function displayStatusMsg() {
status=bannerADlink[adNum];
document.returnValue = true;
}
//-->


function selectSysLeft() {
    var devies = navigator.userAgent.toLowerCase();
             var ipad = devies.match(/ipad/i) == "ipad";
             var iphone = devies.match(/iphone os/i) == "iphone os";
             var midp = devies.match(/midp/i) == "midp";
             var uc7 = devies.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
             var uc = devies.match(/ucweb/i) == "ucweb";
             var android = devies.match(/android/i) == "android";
             var wince = devies.match(/windows ce/i) == "windows ce";
             var winphone = devies.match(/windows mobile/i) == "windows mobile";
             if (ipad || iphone || midp || uc7 || uc || android || wince || winphone) {
                 window.location.href="./SysLeft1.asp";
             } else {
                 window.location.href="./bnuzitc.asp";
             }
}
</script>
</html>
          
          
          