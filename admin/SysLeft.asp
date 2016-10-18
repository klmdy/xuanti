<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>北京师范大学珠海分校信息技术学院毕业实习选题系统</TITLE>
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

<BODY background="../Images/SysLeft_bg.gif" onmouseover="self.status='毕业选题与过程化考核!';return true">
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("返回后台主页")'><img border="0" src="../Images/title.gif"></a></td>
  </tr>
</table>

<div id="main5" onclick=expandIt(5)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">个人中心</td>
    </tr>
  </table>
</div>
<div id="sub5" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_edit.asp?ID=<%=session("user_no")%>" target="mainFrame" onClick='changeAdminFlag("修改个人资料")'>修改个人资料</a></td>
    </tr>
  </table>
</div>
<div id="main3" onclick=expandIt(3)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">学生管理</td>
    </tr>
  </table>
</div>
<div id="sub3" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_list.asp" target="mainFrame" onClick='changeAdminFlag("审核学生")'>审核学生</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加学生")'>添加学生</a></td>
    </tr>
    
  </table>
</div>


<div id="main4" onclick=expandIt(4)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">选题管理</td>
    </tr>
  </table>
</div>
<div id="sub4" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame" onClick='changeAdminFlag("审核老师出的毕业论文题目")'>老师出题审核</a></td>
    </tr>
   
	   
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_yes.asp" target="mainFrame" onClick='changeAdminFlag("查询学生选题信息")'>学生选题查询</a></td>
    </tr>   
   
  </table>
</div>
<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">过程化管理</td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("查看留言")'>查看过程化信息</a></td>
    </tr>
  </table>
</div>

<div id="main9" onclick=expandIt(9)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_9.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">系院设置</td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="department_list.asp" target="mainFrame" onClick='changeAdminFlag("查看系别")'>系别列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="department_edit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加系别")'>添加系别</a></td>
    </tr>
  </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_8.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">专业设置</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="speciality_List.asp" target="mainFrame" onClick='changeAdminFlag("专业列表")'>专业列表</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="speciality_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加专业")'>添加专业</a></td>
    </tr>
  </table>
</div>

<div id="main1" onclick=expandIt(1)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">管理员管理</td>
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
      <td class="SystemLeft">教师管理</td>
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
      <td class="SystemLeft"><a href="teacher_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("添加教师")'>添加教师</a></td>
    </tr>
   
  </table>
</div>


<div id="main6" onclick=expandIt(6)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">数据字典维护</td>
    </tr>
  </table>
</div>

<div id="sub6" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
      <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="config.asp" target="mainFrame" onClick='changeAdminFlag("网站信息")'>网站信息</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="zc_table.asp" target="mainFrame" onClick='changeAdminFlag("留言信息列表")'>教师职称</a></td>
    </tr>
    <!-- <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="res_table.asp" target="mainFrame" onClick='changeAdminFlag("写新留言")'>教研室</a></td>
    </tr> -->
  </table>
</div>

<div id="main11" onclick=expandIt(11)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_4.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">系统安全</td>
    </tr>
  </table>
</div>
<div id="sub11" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
  <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="log.asp" target="mainFrame" onClick='changeAdminFlag("查看日志")'>查看日志</a></td>
    </tr>
     
  </table>
</div>

<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_2.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("后台主页")'>后台主页</a></td>
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
    <td height=25 colspan=2 class="topbg"><span class="Glow"><font color="ffffff" id="user">毕业论文选题管理系统GMS（管理员）</font></span>
  <tr bgcolor="#EBF2F9">
      <td colspan="2"  class="tdbg"><div align="center">设计：BNUZ-ITC</a></div></td>
  </tr>  
  <tr bgcolor="#367BDA">
    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">当前用户：<strong><%=session("user_name")%></strong></font></div></td>
  </tr>
</table>
</BODY>


<script>
u_type=<%=session("u_type")%>
window.onload=function() {
  if (u_type==1)
      {

          document.body.removeChild(document.getElementById('main1'));
          document.body.removeChild(document.getElementById('main6'));
          document.body.removeChild(document.getElementById('main11'));
          document.getElementById("user").innerHTML="毕业论文选题管理系统GMS（系主任）";

      }

}
</script>
</HTML>