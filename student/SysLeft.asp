<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
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
</head>

<!--#include file="CheckAdmin.asp"-->

<BODY background="../Images/SysLeft_bg.gif">
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("���غ�̨��ҳ")'><img border="0" src="../Images/title.gif"></a></td>
  </tr>
</table>
<div id="main9" onclick=expandIt(9)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">��������</td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_edit.asp" target="mainFrame" onClick='changeAdminFlag("���Ƹ�������")'>���Ƹ�������</a></td>
    </tr>
	    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="a1.htm" target="mainFrame" onClick='changeAdminFlag("���ⱨ��ģ��")'>���ⱨ��ģ��</a></td>
    </tr>
      <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="a2.htm" target="mainFrame" onClick='changeAdminFlag("���ڼ���ģ��")'>���ڼ���ģ��</a></td>
    </tr>
       <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="���Ĳο�ģ��.doc" target="mainFrame" onClick='changeAdminFlag("����ģ��")'>��ҵ���Ĳο�</a></td>
    </tr>

	    </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">ѡ�����ĵ�</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
   <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_mysel.asp" target="mainFrame" onClick='changeAdminFlag("�ҵ�ѡ�����")'>�ҵ�ѡ�����</a></td>
    </tr>

    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame">��ʼѡ��</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="../fileload/FileUploadStudent.asp" target="mainFrame">
		�ϴ��ĵ�</a></td>
       </tr>
     <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="file_download.asp" target="mainFrame" onClick='changeAdminFlag("�ĵ�����")'>�ĵ�����</a></td>
    </tr> 
  </table>
</div>
<div id="main2" onclick=expandIt(2)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">��ʦ��ѯ</td>
    </tr>
  </table>
</div>
<div id="sub2" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_list.asp" target="mainFrame" onClick='changeAdminFlag("��ʦ�б�")'>�鿴����</a></td>
    </tr>
  </table>
</div>


<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">���̻�ָ��</td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif"> 
    
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft">
		<a href="msg_add.asp" target="mainFrame" onClick='changeAdminFlag("�鿴����")'>������Ϣ</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("�鿴����")'>�鿴��Ϣ</a></td>
    </tr>
  </table>
</div>

<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_2.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("��̨��ҳ")'>������ҳ</a></td>
  </tr>
</table>
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_5.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="javascript:AdminOut()">�˳���¼</a></td>
  </tr>
</table>
<table width="167" border="0" cellpadding="1" cellspacing="2" bgcolor="#367BDA">
  <tr align="center" bgcolor="#367BDA">
    <td height=25 colspan=2 class="topbg"><font color="ffffff">��ҵ����ѡ��ϵͳ��ѧ����</font>
  <tr bgcolor="#EBF2F9">
      <td colspan="2"  class="tdbg"><div align="center">��ƣ�����ʦ����ѧ�麣��У</a></div></td>
  </tr>
  
  <tr bgcolor="#367BDA">
    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">��ǰ�û���<strong><%=session("user_name")%></strong></font></div></td>
  </tr>
</table>
</BODY>
</HTML>