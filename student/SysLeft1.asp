<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<% Option Explicit %>

<HTML>

<HEAD>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<META NAME="copyright" CONTENT="Copyright BNUZ-ITC" />

<META NAME="Keywords" CONTENT="BNUZ-ITC" />

<META NAME="Description" CONTENT="BNUZ-ITC" />

<TITLE>��ҵ����ѡ������̻�����ϵͳ-WebGMS</TITLE>

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" src="../js/Admin.js"></script>

<script>

function closewin() {

   if (opener!=null && !opener.closed) {

      opener.window.newwin=null;

      opener.openbutton.disabled=false;

      opener.closebutton.disabled=true;

   }

}



var count=0;//��������

var limit=new Array();//���ڼ�¼��ǰ��ʾ���ļ����˵�

var countlimit=1;//ͬʱ�򿪲˵���Ŀ�����Զ���



function expandIt(el) {

   obj = eval("sub" + el);

   if (obj.style.display == "none") {

      obj.style.display = "block";//��ʾ�Ӳ˵�

      if (count<countlimit) {//����2��

         limit[count]=el;//¼������

         count++;

      }

      else {

         eval("sub" + limit[0]).style.display = "none";

         for (i=0;i<limit.length-1;i++) {limit[i]=limit[i+1];}//����ȥ��ͷһλ���������ǰŲһλ

         limit[limit.length-1]=el;

      }

   }

   else {

      obj.style.display = "none";

      var j;

      for (i=0;i<limit.length;i++) {if (limit[i]==el) j=i;}//��ȡ��ǰ����Ĳ˵���limit�����е�λ��

      for (i=j;i<limit.length-1;i++) {limit[i]=limit[i+1];}//j�Ժ������ȫ����ǰŲһλ

      limit[limit.length-1]=null;//ɾ���������һλ

      count--;

   }

}

</script>
<style>
  .nav{
    padding-top: 18px;
    padding-left: 50px;
    font-family: "����", Geneva, Arial, Helvetica, sans-serif;
    font-weight: bold;
    color: #0f42a6;
    font-size: 20px;
  }
  ul{
    margin:0px;
    padding: 0px;
  }
  li{
    width:310px;
    height:35px; 
    font-family: "����", Geneva, Arial, Helvetica, sans-serif;
    font-weight: bold;
    color: #0f42a6;
    background:url(../Images/SysLeft_bg_link.gif);
    background-repeat:no-repeat;
    background-size:cover;
  }
  .nav1{
    display:block;
  }
  .nav3{
    padding-top: 10px;
    padding-left: 80px;
    font-size: 18px;
  }
  #RB:hover{
    color:black;
  }
  #Exit:hover{
    color:black;
  }
</style>
</head>



<!--#include file="CheckAdmin.asp"-->



<BODY background="../Images/SysLeft_bg.gif">
<center>
<a href="SysCome1.asp" style="display:block; width:310px; height:70px; background:url(../Images/title.gif);background-repeat:no-repeat;background-size:cover;" onClick='changeAdminFlag("���غ�̨��ҳ")'></a>

<div id="main9" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(9)>
  <div class="nav">��������&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub9" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="student_edit1.asp" onClick='changeAdminFlag("���Ƹ�������")'><div class="nav3">���Ƹ�������&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="a1.htm" onClick='changeAdminFlag("���ⱨ��ģ��")'><div class="nav3">���ⱨ��ģ��&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="a2.htm" onClick='changeAdminFlag("���ڼ���ģ��")'><div class="nav3">���ڼ���ģ��&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="���Ĳο�ģ��.doc" target="mainFrame" onClick='changeAdminFlag("����ģ��")'><div class="nav3">��ҵ���Ĳο�&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>



<div id="main8" style="width:310px; height:50px; background:url(../Images/Admin_left_1.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(8)>
  <div class="nav">ѡ�����ĵ�&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub8" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="task_mysel1.asp" onClick='changeAdminFlag("�ҵ�ѡ�����")'><div class="nav3">�ҵ�ѡ�����&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="task_list1.asp"><div class="nav3">��ʼѡ��&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="../fileload/FileUploadStudent1.asp"><div class="nav3">�ϴ��ĵ�&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="file_download1.asp" onClick='changeAdminFlag("�ĵ�����")'><div class="nav3">�ĵ�����&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>



<div id="main2" style="width:310px; height:50px; background:url(../Images/Admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(2)>
  <div class="nav">��ʦ��ѯ&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub2" style="display:none"><!-- SysLeft_bg_link.gif -->
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="teacher_list1.asp" onClick='changeAdminFlag("��ʦ�б�")'><div class="nav3">�鿴����&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>



<div id="main12" style="width:310px; height:50px; background:url(../Images/Admin_left_1.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(12)>
  <div class="nav">���̻�ָ��&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub12" style="display:none"><!-- SysLeft_bg_link.gif -->
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="msg_add1.asp" onClick='changeAdminFlag("�鿴����")'><div class="nav3">������Ϣ&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="msg_list1.asp" onClick='changeAdminFlag("�鿴����")'><div class="nav3">�鿴��Ϣ&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>



  <a id="RB" href="SysCome1.asp" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_2.gif);background-repeat:no-repeat;background-size:cover;" onClick='changeAdminFlag("��̨��ҳ")'><div class="nav">������ҳ&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>

<a id="Exit" href="javascript:AdminOut()" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_5.gif);background-repeat:no-repeat;background-size:cover;"><div class="nav">�˳���¼&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>

<table width="310" border="0" cellpadding="1" cellspacing="2" bgcolor="#367BDA">

  <tr align="center" bgcolor="#367BDA">

    <td height=25 colspan=2 class="topbg"><font color="ffffff">��ҵ����ѡ��ϵͳ��ѧ����</font>

  <tr bgcolor="#EBF2F9">

      <td colspan="2"  class="tdbg"><div align="center">��ƣ�����ʦ����ѧ�麣��У</a></div></td>

  </tr>

  

  <tr bgcolor="#367BDA">

    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">��ǰ�û���<strong><%=session("user_name")%></strong></font></div></td>

  </tr>

</table>
</center>
</BODY>

</HTML>