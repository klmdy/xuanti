<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<META NAME="copyright" CONTENT="Copyright BNUZ-ITC" />
<META NAME="Keywords" CONTENT="BNUZ-ITC" />
<META NAME="Description" CONTENT="BNUZ-ITC" />
<TITLE>毕业论文选题与过程化管理系统-WebGMS</TITLE>
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

<BODY background="../Images/SysLeft_bg.gif">
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
      <td class="SystemLeft"><a href="student_edit.asp" target="mainFrame" onClick='changeAdminFlag("完善个人资料")'>完善个人资料</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="a1.htm" target="mainFrame" onClick='changeAdminFlag("开题报告模板")'>开题报告模板</a></td>
    </tr>
      <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="a2.htm" target="mainFrame" onClick='changeAdminFlag("中期检查表模板")'>中期检查表模板</a></td>
    </tr>
       <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="论文参考模板.doc" target="mainFrame" onClick='changeAdminFlag("论文模板")'>毕业论文参考</a></td>
    </tr>

	    </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">选题与文档</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
   <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_mysel.asp" target="mainFrame" onClick='changeAdminFlag("我的选题情况")'>我的选题情况</a></td>
    </tr>

    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame">开始选题</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="../fileload/FileUploadStudent.asp" target="mainFrame">
		上传文档</a></td>
       </tr>
     <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="file_download.asp" target="mainFrame" onClick='changeAdminFlag("文档下载")'>文档下载</a></td>
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
  </table>
</div>


<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">过程化指导</td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif"> 
    
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft">
		<a href="msg_add.asp" target="mainFrame" onClick='changeAdminFlag("查看留言")'>发送信息</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("查看留言")'>查看信息</a></td>
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