<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<meta NAME="copyright" CONTENT="Copyright BNUZ-ITC" />
<meta NAME="Keywords" CONTENT="BNUZ-ITC" />
<meta NAME="Description" CONTENT="BNUZ-ITC" />
<title>毕业论文选题与过程化管理系统</title>
<link rel="stylesheet" href="../js/CssAdmin.css">
<script language="javascript" src="../js/Admin.js"></script>
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

<!--target="mainFrame"内容在中间主框架打开-->

<body scroll="no" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
<center>
<a href="SysCome1.asp" style="display:block; width:310px; height:70px; background:url(../Images/title.gif);background-repeat:no-repeat;background-size:cover;" onClick='changeAdminFlag("返回后台主页")'></a>

<div id="main9" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(9)>
  <div class="nav">个人中心&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub9" style="display:none">
  <ul style="list-style:none;">
           <li>
             <a class="nav1" href="teacher_edit1.asp" onClick='changeAdminFlag("修改个人资料")'><div class="nav3">修改个人资料&#12288;&#12288;&#12288;</div></a>
           </li>
  </ul>
</div>

<div id="main8"style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_1.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(8)>

<div class="nav">选题管理&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub8" style="display:none">

  <ul style="list-style:none;">
           <li>
             <a class="nav1" href="task_tadd1.asp?Result=Add" onClick='changeAdminFlag("添加选题")'><div class="nav3">添加选题&#12288;&#12288;&#12288;</div></a>
           </li>
  </ul>

  <ul style="list-style:none;">
           <li>
             <a class="nav1" href="task_mysel1.asp" onClick='changeAdminFlag("我的选题")'><div class="nav3">选题列表&#12288;&#12288;&#12288;</div></a>
           </li>
  </ul>

    <ul style="list-style:none;">
              <li>
                <a class="nav1" href="task_view1.asp" onClick='changeAdminFlag("选题维护")'><div class="nav3">选题确选&#12288;&#12288;&#12288;</div></a>
              </li>
     </ul>
</div>


<div id="main10" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_3.gif);background-repeat:no-repeat;background-size:cover;"onclick=expandIt(10)>

 <div class="nav">文档管理&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>

</div>
<div id="sub10" style="display:none">

    <ul style="list-style:none;">
              <li>
                <a class="nav1" href="document_upload1.asp" onClick='changeAdminFlag("上传文档")'><div class="nav3">上传和下载&#12288;&#12288;&#12288;</div></a>
              </li>
     </ul>
</div>

<div id="main12" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_1.gif);background-repeat:no-repeat;background-size:cover;"onclick=expandIt(12)>
  <div class="nav">过程化指导&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub12" style="display:none">
  <ul style="list-style:none;">
                     <li>
                       <a class="nav1" href="msg_add1.asp" onClick='changeAdminFlag("签写留言")'><div class="nav3">发送指导意见&#12288;&#12288;&#12288;</div></a>
                     </li>
  </ul>

  <ul style="list-style:none;">
                      <li>
                        <a class="nav1" href="msg_list1.asp" onClick='changeAdminFlag("查看留言")'><div class="nav3">查看反馈意见&#12288;&#12288;&#12288;</div></a>
                      </li>
   </ul>

</div>

<div id="main2" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;" onclick=expandIt(2)>
   <div class="nav">教师查询&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>

</div>
        <div id="sub2" style="display:none">
            <ul style="list-style:none;">
                      <li>
                        <a class="nav1" href="teacher_list1.asp" onClick='changeAdminFlag("教师列表")'><div class="nav3">查看所有&#12288;&#12288;&#12288;</div></a>
                      </li>
              </ul>
        </div>

<div id="main3" style="display:block; width:310px; height:50px; background:url(../Images/admin_left_6.gif);background-repeat:no-repeat;background-size:cover;"onclick=expandIt(3)>
<div class="nav">学生查询&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div>
</div>

<div id="sub3" style="display:none">

    <ul style="list-style:none;">
                      <li>
                        <a class="nav1" href="student_list1.asp" onClick='changeAdminFlag("学生列表")'><div class="nav3">查看所有&#12288;&#12288;&#12288;</div></a>
                      </li>
     </ul>
</div>
<a id="RB" href="SysCome1.asp" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_2.gif);background-repeat:no-repeat;background-size:cover;" onClick='changeAdminFlag("后台主页")'><div class="nav">返回主页&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>
<a id="Exit" href="javascript:AdminOut()" style="display:block; width:310px; height:50px; background:url(../Images/Admin_left_5.gif);background-repeat:no-repeat;background-size:cover;"><div class="nav">退出登录&#12288;&#12288;&#12288;&#12288;&#12288;&#12288;</div></a>


<table width="310px" border="0" cellpadding="1" cellspacing="2" bgcolor="#367BDA">

  <tr align="center" bgcolor="#367BDA">

    <td height=25 colspan=2 class="topbg"><font color="ffffff">毕业论文选题系统（教师）</font>
  </tr>

  <tr bgcolor="#EBF2F9">

      <td colspan="2"  class="tdbg"><div align="center">设计：北京师范大学珠海分校.ds </div></td>

  </tr>

  <tr bgcolor="#367BDA">

    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">当前用户：<strong><%=session("user_name")%></strong></font></div></td>

  </tr>

</table>

</center>
</body>

<script>
function closewin() {
   if (opener!=null && !opener.closed) {
      opener.window.newwin=null;utf-8
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

</html>