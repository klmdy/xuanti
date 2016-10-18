<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="CheckAdmin.asp"-->
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<link rel="stylesheet" href="../home.css">
<style>
  #back{
    background: url("../Images/SysLeft_bg.gif");
    border:0;
    width: 60px;
    position:fixed; 
    font-size: 20px;
    margin: 0,auto;
    right:20px; 
    bottom:20px;
    cursor:pointer; 
    display:block;
  }
</style>
<SCRIPT language=JavaScript>

  var version = "other";

  browserName = navigator.appName;

  browserVer = parseInt(navigator.appVersion);

  if (browserName == "Netscape" && browserVer >= 3) version = "n3";

  else if (browserName == "Netscape" && browserVer < 3) version = "n2";

  else if (browserName == "Microsoft Internet Explorer" && browserVer >= 4) version = "e4";

  else if (browserName == "Microsoft Internet Explorer" && browserVer < 4) version = "e3";

  function marquee1() {
    if (version == "e4"){
      document.write("<marquee behavior=scroll direction=up width=100% height=250 scrollamount=1 scrolldelay=60 onmouseover='this.stop()' onmouseout='this.start()'>")
    }
  }

  function marquee2() {
    if (version == "e4") {
      document.write("</marquee>") 
    }
  }


</SCRIPT>
</head>

<body topmargin="0"  leftmargin="0" background="../Images/SysLeft_bg.gif">

<center>
  <div style="width:95%; background:#367BDA;padding:10px;">
  <font color="#ffffff" size="3px"><b>欢迎使用基于Web的毕业论文选题与文档过程化管理系统-WebGMS1.0</b></font>
  </div>
  
  <br><br>
  <p align="left" style="line-height: 200%;margin:10px;">&#12288;&#12288;
    <b>毕业论文选题与管理系统WebGMS1.0</b>极大地方便了教师与学生进行毕业论文选题与过程化管理，降低了毕业论文指导过程中的劳动强度。但是<b><font color="#008000">WebGMS1.1</font></b>在给大家带来方便的同时，也提请老师和同学们注意以下几点：
    <br>&#12288;&#12288;
    1.学生登录系统前需要自行注册，在注册的时候尽量将信息输入完整，注册的用户名请务必选用自己的选号，等管理员审批通过后才能登录！学生在使用过程中保管好自己的学号和登陆密码
	。<font color="#FF0000"><br>&#12288;&#12288;
    2</font>.<font color="#FF0000">学生在选题的时候，请尽量与指导老师进行协商，得到老师同意后再进行选题。否则指导老师会退选，以至于白选！<br>&#12288;&#12288;
    </font>3.选完毕业论文题目并得到指导老师确选后就可以开始毕业选题实施和论文撰写工作，学生可以利用本系统中的“交流与沟通”栏目与指导老师进行定时沟通，汇报论文进展情况以及遇到的需要解决的难题等。指导老师也会定期询问各位同学的论文进展情况，并要求学生提交相关文档或者实验结果，请学生注意经常查看“交流与沟通”栏目的“查看信息”。平时做实验的时候尽量注意结果的保存，以形成毕业论文中的素材。<br>&#12288;&#12288;
    4.同学们在撰写论文的时候一定要注意格式与学院模板一致，打印的时候最好形成PDF后再打印。<br>&#12288;&#12288;
    5.学生需要提交的文档有：<br>&#12288;&#12288;&#12288;&#12288;
    （1）论文开题报告.doc<br>&#12288;&#12288;&#12288;&#12288;
    （2）毕业论文终稿.doc；<br>&#12288;&#12288;
    6.指导老师需要提交的文档有：<br>&#12288;&#12288;&#12288;&#12288;
    （1）论文终稿-正式打印版和电子版（纸质检查学生签名，附上毕业论文评定表）；<br>&#12288;&#12288;&#12288;&#12288;
    （2）毕业论文指导手册纸质和电子版（内含开题报告、中期检查、指导记录、答辩记录、论文评定表）；<br>&#12288;&#12288;&#12288;&#12288;
    （3）毕业论文评定表一份（原件，存入学生档案）；<br>&#12288;&#12288;&#12288;&#12288;
    （4）指导学生如有被推荐为有论文需提前上交一份论文（评优会上讨论用）；<br>&#12288;&#12288;&#12288;&#12288;
    （5）被评为校级优秀毕业论文的学生需准备两份毕业论文正稿（带封面）。
  </p>
  <center><b><font color="#800000" size="3px">&nbsp; 坚决杜绝论文抄袭！ </font></b></center>
	<p style="line-height: 200%"><font color="#FF0000"><b>
	<marquee behavior="alternate" height="20">预祝各位同学毕业设计顺利完成并取得好成绩！　 </marquee></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
  <input type="button" id="back" />
</center>
</body>
<script>
  var BUTTON = document.getElementById("back");
  BUTTON.value = "返回";
  BUTTON.onclick = function () {
    window.location.href='bnuzitc1.asp';
  }
  window.ontouchmove=function(){
      BUTTON.style.display="block";
   }
</script>
</html>          



          



          



          