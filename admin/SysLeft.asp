<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<TITLE>����ʦ����ѧ�麣��У��Ϣ����ѧԺ��ҵʵϰѡ��ϵͳ</TITLE>
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

<BODY background="../Images/SysLeft_bg.gif" onmouseover="self.status='��ҵѡ������̻�����!';return true">
<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/SysLeft_bg_click.gif">
  <tr style="cursor: hand;">
    <td><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("���غ�̨��ҳ")'><img border="0" src="../Images/title.gif"></a></td>
  </tr>
</table>

<div id="main5" onclick=expandIt(5)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">��������</td>
    </tr>
  </table>
</div>
<div id="sub5" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_edit.asp?ID=<%=session("user_no")%>" target="mainFrame" onClick='changeAdminFlag("�޸ĸ�������")'>�޸ĸ�������</a></td>
    </tr>
  </table>
</div>
<div id="main3" onclick=expandIt(3)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">ѧ������</td>
    </tr>
  </table>
</div>
<div id="sub3" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_list.asp" target="mainFrame" onClick='changeAdminFlag("���ѧ��")'>���ѧ��</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="student_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���ѧ��")'>���ѧ��</a></td>
    </tr>
    
  </table>
</div>


<div id="main4" onclick=expandIt(4)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_3.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">ѡ�����</td>
    </tr>
  </table>
</div>
<div id="sub4" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_list.asp" target="mainFrame" onClick='changeAdminFlag("�����ʦ���ı�ҵ������Ŀ")'>��ʦ�������</a></td>
    </tr>
   
	   
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="task_yes.asp" target="mainFrame" onClick='changeAdminFlag("��ѯѧ��ѡ����Ϣ")'>ѧ��ѡ���ѯ</a></td>
    </tr>   
   
  </table>
</div>
<div id="main12" onclick=expandIt(12)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">���̻�����</td>
    </tr>
  </table>
</div>
<div id="sub12" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="msg_list.asp" target="mainFrame" onClick='changeAdminFlag("�鿴����")'>�鿴���̻���Ϣ</a></td>
    </tr>
  </table>
</div>

<div id="main9" onclick=expandIt(9)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_9.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">ϵԺ����</td>
    </tr>
  </table>
</div>
<div id="sub9" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="department_list.asp" target="mainFrame" onClick='changeAdminFlag("�鿴ϵ��")'>ϵ���б�</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="department_edit.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���ϵ��")'>���ϵ��</a></td>
    </tr>
  </table>
</div>
<div id="main8" onclick=expandIt(8)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_8.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">רҵ����</td>
    </tr>
  </table>
</div>
<div id="sub8" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="speciality_List.asp" target="mainFrame" onClick='changeAdminFlag("רҵ�б�")'>רҵ�б�</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="speciality_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("���רҵ")'>���רҵ</a></td>
    </tr>
  </table>
</div>

<div id="main1" onclick=expandIt(1)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">����Ա����</td>
    </tr>
  </table>
</div>
<div id="sub1" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_list.asp" target="mainFrame" onClick='changeAdminFlag("�û��б�")'>����Ա�б�</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="user_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("����û�")'>��ӹ���Ա</a></td>
    </tr>
  </table>
</div>

<div id="main2" onclick=expandIt(2)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/admin_left_6.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">��ʦ����</td>
    </tr>
  </table>
</div>
<div id="sub2" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_list.asp" target="mainFrame" onClick='changeAdminFlag("��ʦ�б�")'>�鿴����</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="teacher_add.asp?Result=Add" target="mainFrame" onClick='changeAdminFlag("��ӽ�ʦ")'>��ӽ�ʦ</a></td>
    </tr>
   
  </table>
</div>


<div id="main6" onclick=expandIt(6)>
  <table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_1.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">�����ֵ�ά��</td>
    </tr>
  </table>
</div>

<div id="sub6" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
      <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="config.asp" target="mainFrame" onClick='changeAdminFlag("��վ��Ϣ")'>��վ��Ϣ</a></td>
    </tr>
    <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="zc_table.asp" target="mainFrame" onClick='changeAdminFlag("������Ϣ�б�")'>��ʦְ��</a></td>
    </tr>
    <!-- <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="res_table.asp" target="mainFrame" onClick='changeAdminFlag("д������")'>������</a></td>
    </tr> -->
  </table>
</div>

<div id="main11" onclick=expandIt(11)>
  <table width="167" height="24" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_4.gif">
    <tr style="cursor: hand;">
      <td width="26" ></td>
      <td class="SystemLeft">ϵͳ��ȫ</td>
    </tr>
  </table>
</div>
<div id="sub11" style="display:none">
  <table width="160" border="0" cellspacing="0" cellpadding="0" background="../Images/SysLeft_bg_link.gif">
  <tr>
      <td width="36" height="22"></td>
      <td class="SystemLeft"><a href="log.asp" target="mainFrame" onClick='changeAdminFlag("�鿴��־")'>�鿴��־</a></td>
    </tr>
     
  </table>
</div>

<table width="167" height="26" border="0" cellpadding="0" cellspacing="0" background="../Images/Admin_left_2.gif">
  <tr style="cursor: hand;">
    <td width="26"></td>
    <td class="SystemLeft"><a href="SysCome.asp" target="mainFrame" onClick='changeAdminFlag("��̨��ҳ")'>��̨��ҳ</a></td>
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
    <td height=25 colspan=2 class="topbg"><span class="Glow"><font color="ffffff" id="user">��ҵ����ѡ�����ϵͳGMS������Ա��</font></span>
  <tr bgcolor="#EBF2F9">
      <td colspan="2"  class="tdbg"><div align="center">��ƣ�BNUZ-ITC</a></div></td>
  </tr>  
  <tr bgcolor="#367BDA">
    <td height=25 colspan="2" class="tdbg"><div align="center"><font color="ffffff">��ǰ�û���<strong><%=session("user_name")%></strong></font></div></td>
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
          document.getElementById("user").innerHTML="��ҵ����ѡ�����ϵͳGMS��ϵ���Σ�";

      }

}
</script>
</HTML>