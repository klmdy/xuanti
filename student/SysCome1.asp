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
  <font color="#ffffff" size="3px"><b>��ӭʹ�û���Web�ı�ҵ����ѡ�����ĵ����̻�����ϵͳ-WebGMS1.0</b></font>
  </div>
  
  <br><br>
  <p align="left" style="line-height: 200%;margin:10px;">&#12288;&#12288;
    <b>��ҵ����ѡ�������ϵͳWebGMS1.0</b>����ط����˽�ʦ��ѧ�����б�ҵ����ѡ������̻����������˱�ҵ����ָ�������е��Ͷ�ǿ�ȡ�����<b><font color="#008000">WebGMS1.1</font></b>�ڸ���Ҵ��������ͬʱ��Ҳ������ʦ��ͬѧ��ע�����¼��㣺
    <br>&#12288;&#12288;
    1.ѧ����¼ϵͳǰ��Ҫ����ע�ᣬ��ע���ʱ��������Ϣ����������ע����û��������ѡ���Լ���ѡ�ţ��ȹ���Ա����ͨ������ܵ�¼��ѧ����ʹ�ù����б��ܺ��Լ���ѧ�ź͵�½����
	��<font color="#FF0000"><br>&#12288;&#12288;
    2</font>.<font color="#FF0000">ѧ����ѡ���ʱ���뾡����ָ����ʦ����Э�̣��õ���ʦͬ����ٽ���ѡ�⡣����ָ����ʦ����ѡ�������ڰ�ѡ��<br>&#12288;&#12288;
    </font>3.ѡ���ҵ������Ŀ���õ�ָ����ʦȷѡ��Ϳ��Կ�ʼ��ҵѡ��ʵʩ������׫д������ѧ���������ñ�ϵͳ�еġ������빵ͨ����Ŀ��ָ����ʦ���ж�ʱ��ͨ���㱨���Ľ�չ����Լ���������Ҫ���������ȡ�ָ����ʦҲ�ᶨ��ѯ�ʸ�λͬѧ�����Ľ�չ�������Ҫ��ѧ���ύ����ĵ�����ʵ��������ѧ��ע�⾭���鿴�������빵ͨ����Ŀ�ġ��鿴��Ϣ����ƽʱ��ʵ���ʱ����ע�����ı��棬���γɱ�ҵ�����е��زġ�<br>&#12288;&#12288;
    4.ͬѧ����׫д���ĵ�ʱ��һ��Ҫע���ʽ��ѧԺģ��һ�£���ӡ��ʱ������γ�PDF���ٴ�ӡ��<br>&#12288;&#12288;
    5.ѧ����Ҫ�ύ���ĵ��У�<br>&#12288;&#12288;&#12288;&#12288;
    ��1�����Ŀ��ⱨ��.doc<br>&#12288;&#12288;&#12288;&#12288;
    ��2����ҵ�����ո�.doc��<br>&#12288;&#12288;
    6.ָ����ʦ��Ҫ�ύ���ĵ��У�<br>&#12288;&#12288;&#12288;&#12288;
    ��1�������ո�-��ʽ��ӡ��͵��Ӱ棨ֽ�ʼ��ѧ��ǩ�������ϱ�ҵ������������<br>&#12288;&#12288;&#12288;&#12288;
    ��2����ҵ����ָ���ֲ�ֽ�ʺ͵��Ӱ棨�ں����ⱨ�桢���ڼ�顢ָ����¼������¼��������������<br>&#12288;&#12288;&#12288;&#12288;
    ��3����ҵ����������һ�ݣ�ԭ��������ѧ����������<br>&#12288;&#12288;&#12288;&#12288;
    ��4��ָ��ѧ�����б��Ƽ�Ϊ����������ǰ�Ͻ�һ�����ģ����Ż��������ã���<br>&#12288;&#12288;&#12288;&#12288;
    ��5������ΪУ�������ҵ���ĵ�ѧ����׼�����ݱ�ҵ�������壨�����棩��
  </p>
  <center><b><font color="#800000" size="3px">&nbsp; ����ž����ĳ�Ϯ�� </font></b></center>
	<p style="line-height: 200%"><font color="#FF0000"><b>
	<marquee behavior="alternate" height="20">Ԥף��λͬѧ��ҵ���˳����ɲ�ȡ�úóɼ����� </marquee></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
  <input type="button" id="back" />
</center>
</body>
<script>
  var BUTTON = document.getElementById("back");
  BUTTON.value = "����";
  BUTTON.onclick = function () {
    window.location.href='bnuzitc1.asp';
  }
  window.ontouchmove=function(){
      BUTTON.style.display="block";
   }
</script>
</html>          



          



          



          