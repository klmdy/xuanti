<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>北京师范大学珠海分校信息技术学院毕业论文选题系统</TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<script language="javascript" src="../js/Admin.js"></script>
<script>
function closewin() {
   if (opener!=null && !opener.closed) {
      opener.window.newwin=null;
      opener.openbutton.disabled=false;
      opener.closebutton.disabled=true;
   }
}

var count=0;//做计数器
var limit=new Array();//用于记录当前显示的哪几个菜单
var countlimit=1;//同时打开菜单数目，可自定义

function expandIt(el) {
   obj = eval("sub" + el);
   if (obj.style.display == "none") {
      obj.style.display = "block";//显示子菜单
      if (count<countlimit) {//限制2个
         limit[count]=el;//录入数组
         count++;
      }
      else {
         eval("sub" + limit[0]).style.display = "none";
         for (i=0;i<limit.length-1;i++) {limit[i]=limit[i+1];}//数组去掉头一位，后面的往前挪一位
         limit[limit.length-1]=el;
      }
   }
   else {
      obj.style.display = "none";
      var j;
      for (i=0;i<limit.length;i++) {if (limit[i]==el) j=i;}//获取当前点击的菜单在limit数组中的位置
      for (i=j;i<limit.length-1;i++) {limit[i]=limit[i+1];}//j以后的数组全部往前挪一位
      limit[limit.length-1]=null;//删除数组最后一位
      count--;
   }
}
</script>
<style>
  .nav{
    padding-top: 18px;
    padding-left: 50px;
    font-family: "宋体", Geneva, Arial, Helvetica, sans-serif;
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
    font-family: "宋体", Geneva, Arial, Helvetica, sans-serif;
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

<BODY background="../Images/SysLeft_bg.gif" onmouseover="self.status='毕业选题与过程化考核!';return true" style="text-align:center;">
<center>
<a href="SysCome1.asp" style="display:block; width:310px; height:70px; background:url(../Images/title.gif);background-repeat:no-repeat;background-size:cover;" onClick='changeAdminFlag("返回后台主页")'></a>

<div id="main5" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(5)>
  <div class="nav">个人中心&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub5" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="user_edit1.asp?ID=<%=session("user_no")%>"  onClick='changeAdminFlag("修改个人资料")'><div class="nav3">修改个人资料&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>


<div id="main3" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(3)>
  <div class="nav">学生管理&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub3" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="student_list1.asp"  onClick='changeAdminFlag("审核学生")'><div class="nav3">审核学生&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="student_add1.asp?Result=Add"  onClick='changeAdminFlag("添加学生")'><div class="nav3">添加学生&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main4" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_3.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(4)>
  <div class="nav">选题管理&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub4" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="task_list1.asp"  onClick='changeAdminFlag("审核老师出的毕业论文题目")'><div class="nav3">老师出题审核&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="task_yes1.asp"  onClick='changeAdminFlag("查询学生选题信息")'><div class="nav3">学生选题查询&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main12" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_1.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(12)>
  <div class="nav">过程化管理&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub12" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="msg_list1.asp"  onClick='changeAdminFlag("查看留言")'><div class="nav3">查看过程化信息&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main9" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_9.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(9)>
  <div class="nav">系院设置&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub9" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="department_list1.asp"  onClick='changeAdminFlag("查看系别")'><div class="nav3">系别列表&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="department_edit1.asp?Result=Add"  onClick='changeAdminFlag("添加系别")'><div class="nav3">添加系别&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main8" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_8.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(8)>
  <div class="nav">专业设置&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub8" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="speciality_List1.asp"  onClick='changeAdminFlag("专业列表")'><div class="nav3">专业列表&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="speciality_add1.asp?Result=Add"  onClick='changeAdminFlag("添加专业")'><div class="nav3">添加专业&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main1" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(1)>
  <div class="nav">管理员管理&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub1" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="user_list1.asp"  onClick='changeAdminFlag("用户列表")'><div class="nav3">管理员列表&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="user_add1.asp?Result=Add"  onClick='changeAdminFlag("添加用户")'><div class="nav3">添加管理员&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main2" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(2)>
  <div class="nav">教师管理&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub2" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="teacher_list1.asp"  onClick='changeAdminFlag("教师列表")'><div class="nav3">查看所有&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="teacher_add1.asp?Result=Add"  onClick='changeAdminFlag("添加教师")'><div class="nav3">添加教师&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main6" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_1.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(6)>
  <div class="nav">数据字典维护&#12288;&#12288;&#12288;</div>
</div>
<div id="sub6" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="config1.asp"  onClick='changeAdminFlag("网站信息")'><div class="nav3">网站信息&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
    <li>
      <a class="nav1" href="zc_table1.asp"  onClick='changeAdminFlag("留言信息列表")'><div class="nav3">教师职称&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>

<div id="main11" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_4.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(11)>
  <div class="nav">系统安全&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>
<div id="sub11" style="display:none">
  <ul style="list-style:none;">
    <li>
      <a class="nav1" href="log1.asp"  onClick='changeAdminFlag("查看日志")'><div class="nav3">查看日志&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
    </li>
  </ul>
</div>



  <a id="RB" href="SysCome1.asp" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_2.gif);background-repeat:no-repeat;background-size:cover;" onClick='changeAdminFlag("后台主页")'><div class="nav">返回主页&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>

<a id="Exit" href="javascript:AdminOut()" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_5.gif);background-repeat:no-repeat;background-size:cover;"><div class="nav">退出登录&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>

<table width="310" border="0" cellpadding="1" cellspacing="2" bgcolor="#367BDA">

  <tr align="center" bgcolor="#367BDA">

    <td height=25 colspan=2 class="topbg"><font color="ffffff" id="user">毕业论文选题管理系统GMS（管理员）</font>

  <tr bgcolor="#EBF2F9">

      <td colspan="2"  class="tdbg"><div align="center">设计：BNUZ-ITC</a></div></td>

  </tr>

  

  <tr bgcolor="#367BDA">

    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">当前用户：<strong><%=session("user_name")%></strong></font></div></td>

  </tr>
</table>
</center>
</BODY>

<script>
u_type=<%=session("u_type")%>
window.onload=function() {
  if (u_type==1)
      {

          document.getElementById('main1').style.display="none";
          document.getElementById('main6').style.display="none";
          document.getElementById('main11').style.display="none";
//          document.body.removeChild(document.getElementById('main1'));
//          document.body.removeChild(document.getElementById('main6'));
//          document.body.removeChild(document.getElementById('main11'));
          document.getElementById("user").innerHTML="毕业论文选题管理系统GMS（系主任）";

      }

}
</script>
</HTML>