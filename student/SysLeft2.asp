<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8" />
<TITLE>北京师范大学珠海分校信息技术学院毕业论文选题系统</TITLE>
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
</head>

<!--#include file="CheckAdmin.asp"-->

<BODY background="../Images/SysLeft_bg.gif" onmouseover="self.status='毕业论文选题系统——衡阳师范学院计算机系!';return true">
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("返回后台主页")'><img border="0" src="../Images/title.gif"></a></td>
  </tr>
</table>
<div id="main9" onclick=expandIt(9)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">个人中心</td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_edit.asp" target="mainFrame" onClick='changeAdminFlag("修改资料")'>修改资料</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_mysel.asp" target="mainFrame" onClick='changeAdminFlag("我的选题")'>我的选题</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_record.asp" target="mainFrame" onClick='changeAdminFlag("成绩查询")'>成绩查询</a></td>
    </tr>
  </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">开始选题</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame" onClick='changeAdminFlag("课题列表")'>所有选题</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_view.asp" target="mainFrame" onClick='changeAdminFlag("已选题学生")'>学生选题情况</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_view.asp" target="mainFrame" onClick='changeAdminFlag("选题维护")'>已确选学生</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_Excel.asp" target="mainFrame" onClick='changeAdminFlag("导出所有选题")'>导出所有选题</a></td>
    </tr>
  </table>
</div>
<div id="sub1" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_list.asp" target="mainFrame" onClick='changeAdminFlag("用户列表")'>管理员列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加用户")'>添加管理员</a></td>
    </tr>
  </table>
</div>

<div id="main2" onclick=expandIt(2)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">教师查询</td>
    </tr>
  </table>
</div>
<div id="sub2" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_list.asp" target="mainFrame" onClick='changeAdminFlag("教师列表")'>查看所有</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_excel.asp" target="mainFrame" onClick='changeAdminFlag("导出所有教师信息")'>导出所有教师</a></td>
    </tr>
  </table>
</div>

<div id="main3" onclick=expandIt(3)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">学生查询</td>
    </tr>
  </table>
</div>
<div id="sub3" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_list.asp" target="mainFrame" onClick='changeAdminFlag("学生列表")'>查看所有</a></td>
    </tr>
	  <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_excel.asp" target="mainFrame" onClick='changeAdminFlag("导出所有学生信息")'>导出所有</a></td>
    </tr>
  </table>
</div>

<div id="sub4" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame" onClick='changeAdminFlag("课题列表")'>选题查询</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加选题")'>添加选题</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_padd.asp" target="mainFrame" onClick='changeAdminFlag("添加选题")'>批量导入</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_view.asp" target="mainFrame" onClick='changeAdminFlag("选题维护")'>学生选题情况</a></td>
    </tr>
  </table>
</div>

<div id="sub6" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="zc_table.asp" target="mainFrame" onClick='changeAdminFlag("留言信息列表")'>教师职称</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="res_table.asp" target="mainFrame" onClick='changeAdminFlag("写新留言")'>教研室</a></td>
    </tr>
  </table>
</div>

<div id="main7" onclick=expandIt(7)></div>


<div id="sub11" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
  <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="log.asp" target="mainFrame" onClick='changeAdminFlag("查看日志")'>查看日志</a></td>
    </tr>
     <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="DataManage.asp" target="mainFrame" onClick='changeAdminFlag("数据库操作")'>数据库操作</a></td>
    </tr>
  </table>
</div>
<div id="main10" onclick=expandIt(10)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">文件管理</td>
    </tr>
  </table>
</div>
<div id="sub10" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="../fileload/FileUpload.asp" target="mainFrame" onClick='changeAdminFlag("文件上传")'>文件上传</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="file_download.asp" target="mainFrame" onClick='changeAdminFlag("文件下载")'>文件下载</a></td>
    </tr>
     <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="log.asp" target="mainFrame" onClick='changeAdminFlag("查看日志")'>查看日志</a></td>
    </tr>
  </table>
</div>

<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">留言建议</td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_add.asp" target="mainFrame" onClick='changeAdminFlag("签写留言")'>签写留言</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("查看留言")'>查看留言</a></td>
    </tr>
  </table>
</div>

<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_2.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("后台主页")'>返回主页</a></td>
  </tr>
</table>
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_5.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="javascript:AdminOut()">退出登录</a></td>
  </tr>
</table>
<table width="167" border="0" cellpadding="1" cellspacing="2" bgcolor="#367BDA">
  <tr align="center" bgcolor="#367BDA">
    <td height=25 colspan=2 class="topbg"><font color="ffffff">毕业论文选题系统（学生）</font>
  <tr bgcolor="#EBF2F9">
      <td colspan="2"  class="tdbg"><div align="center">设计：北京师范大学珠海分校</a></div></td>
  </tr>
  
  <tr bgcolor="#367BDA">
    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">当前用户：<strong><%=session("user_name")%></strong></font></div></td>
  </tr>
</table>
</BODY>
</HTML>