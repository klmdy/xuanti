<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" /> 

<link rel="stylesheet" href="../js/CssAdmin.css">

<script language="javascript" type="text/javascript"> 

	function depart_add()

		{ 

			if (document.editForm.content1.value.length == 0) { 

			alert("��������!");

			document.editForm.content1.focus();

			return false;

			}

			if (document.editForm.content2.value.length == 0) { 

			alert("����������!");

			document.editForm.content2.focus();

			return false;

			}

			if (document.editForm.content3.value.length == 0) { 

			alert("��������������!");

			document.editForm.content3.focus();

			return false;

			}

			return true;

		}

</script>



<title>���ⱨ��</title>

</head>



<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->





<style>

<!--

 /* Font Definitions */

 @font-face

	{font-family:����;

	panose-1:2 1 6 0 3 1 1 1 1 1;}

@font-face

	{font-family:����;

	panose-1:2 1 6 9 6 1 1 1 1 1;}

@font-face

	{font-family:"Cambria Math";

	panose-1:2 4 5 3 5 4 6 3 2 4;}

@font-face

	{font-family:Calibri;

	panose-1:2 15 5 2 2 2 4 3 2 4;}

@font-face

	{font-family:����_GB2312;}

@font-face

	{font-family:�����п�;

	panose-1:2 1 8 0 4 1 1 1 1 1;}

@font-face

	{font-family:Tahoma;

	panose-1:2 11 6 4 3 5 4 4 2 4;}

@font-face

	{font-family:"\@����";

	panose-1:2 1 6 0 3 1 1 1 1 1;}

@font-face

	{font-family:"\@����";

	panose-1:2 1 6 9 6 1 1 1 1 1;}

@font-face

	{font-family:"\@�����п�";

	panose-1:2 1 8 0 4 1 1 1 1 1;}

@font-face

	{font-family:"\@����_GB2312";}

 /* Style Definitions */

 p.MsoNormal, li.MsoNormal, div.MsoNormal

	{margin:0cm;

	margin-bottom:.0001pt;

	text-align:justify;

	text-justify:inter-ideograph;

	font-size:10.5pt;

	font-family:"Calibri","sans-serif";}

h1

	{mso-style-link:"���� 1 Char";

	margin-right:0cm;

	margin-left:0cm;

	font-size:24.0pt;

	font-family:����;

	font-weight:bold;}

p.MsoHeader, li.MsoHeader, div.MsoHeader

	{mso-style-link:"ҳü Char";

	margin:0cm;

	margin-bottom:.0001pt;

	text-align:center;

	layout-grid-mode:char;

	border:none;

	padding:0cm;

	font-size:9.0pt;

	font-family:"Calibri","sans-serif";}

p.MsoFooter, li.MsoFooter, div.MsoFooter

	{mso-style-link:"ҳ�� Char";

	margin:0cm;

	margin-bottom:.0001pt;

	layout-grid-mode:char;

	font-size:9.0pt;

	font-family:"Calibri","sans-serif";}

p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent

	{mso-style-link:"�����ı����� Char";

	margin-top:0cm;

	margin-right:0cm;

	margin-bottom:6.0pt;

	margin-left:21.0pt;

	text-align:justify;

	text-justify:inter-ideograph;

	font-size:10.5pt;

	font-family:"Times New Roman","serif";}

p.MsoDate, li.MsoDate, div.MsoDate

	{mso-style-link:"���� Char";

	margin-top:0cm;

	margin-right:0cm;

	margin-bottom:0cm;

	margin-left:5.0pt;

	margin-bottom:.0001pt;

	text-align:justify;

	text-justify:inter-ideograph;

	font-size:10.5pt;

	font-family:"Calibri","sans-serif";}

p

	{margin-right:0cm;

	margin-left:0cm;

	font-size:12.0pt;

	font-family:����;}

span.Char

	{mso-style-name:"���� Char";

	mso-style-link:����;}

span.1Char

	{mso-style-name:"���� 1 Char";

	mso-style-link:"���� 1";

	font-family:����;

	font-weight:bold;}

span.Char0

	{mso-style-name:"�����ı����� Char";

	mso-style-link:�����ı�����;

	font-family:"Times New Roman","serif";}

span.Char1

	{mso-style-name:"ҳü Char";

	mso-style-link:ҳü;}

span.Char2

	{mso-style-name:"ҳ�� Char";

	mso-style-link:ҳ��;}

 /* Page Definitions */

 @page Section1

	{size:595.3pt 841.9pt;

	margin:62.3pt 90.0pt 62.3pt 90.0pt;

	layout-grid:15.6pt;}

div.Section1

	{page:Section1;}

 /* List Definitions */

 ol

	{margin-bottom:0cm;}

ul

	{margin-bottom:0cm;}

-->

</style>



</head>







<body lang=ZH-CN style='text-justify-trim:punctuation'>

<%

	Action=request.QueryString("Action")

	if Action = "addnew" then

	

	set rs = server.createobject("adodb.recordset")

	sql="select * from sel_record where St_number='"&Session("studentnumber")&"'"

	rs.open sql,conn,1,3

		

		%>

		111111111111111111111<%=Session("studentnumber")%>

		<%

		response.Redirect("a1.asp")

	end if

%>



<%

set rs1=server.CreateObject("adodb.recordset")

	sql1="select * from select_true where St_number='"&Session("studentnumber")&"'"

	rs1.open sql1,conn,1,3



		if rs1.bof and rs1.eof then

        response.Redirect("SysCome.asp")

	else					



%>





<div class=Section1 style='layout-grid:15.6pt'>



<p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span><b><span

style='font-size:14.0pt;line-height:150%;font-family:����'>����ʦ����ѧ�麣��У</span></b></p>



<p class=MsoNormal align=center style='text-align:center;line-height:150%'><b><span

style='font-size:14.0pt;line-height:150%;font-family:����'>��������ҵ���ģ���ƣ����ⱨ��</span></b></p>



<div align=center>



<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=573 style='width:429.9pt;border-collapse:collapse;border:none'>

 <tr>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:����'>ѧ������</span></p>

  </td>

  <td width=199 colspan=2 valign=top style='width:149.2pt;border:solid windowtext 1.0pt;

  border-left:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span lang=EN-US><%=Session("studentname")%>  </span>

	<span style="font-size: 10.5pt; font-family: ����">�����</span></p>

  </td>

  <td width=100 valign=top style='width:75.1pt;border:solid windowtext 1.0pt;

  border-left:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:����'>ѧ</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>��</span><span lang=EN-US> </span></p>

  </td>

  <td width=185 colspan=2 valign=top style='width:138.9pt;border:solid windowtext 1.0pt;

  border-left:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal style='margin:2.3pt 0cm; text-align:center'><span lang=EN-US><%=Session("studentnumber")%></span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">0901040112</span></p>

  </td>

 </tr>

 <tr>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:����'>ѧԺ������</span></p>

  </td>

  <td width=199 colspan=2 valign=top style='width:149.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'>��Ϣ����ѧԺ</p>

  </td>

  <td width=100 valign=top style='width:75.1pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:����'>ר</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>ҵ</span><span lang=EN-US> </span></p>

  </td>

  <td width=185 colspan=2 valign=top style='width:138.9pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal style='margin-top:2.3pt;margin-right:0cm;margin-bottom:

  2.3pt;margin-left:0cm'><span lang=EN-US>

  <%

  set rsp=server.CreateObject("adodb.recordset")

	sql="select * from department where D_no='"&session("sp_id")&"'"

	rsp.open sql,conn,1,3

	%>

	<%=rsp("D_name")%>

	<% 				

		rsp.close

			set rsp = nothing



  %></span><span style="font-size: 10.5pt; font-family: ����">������Ϣ��ѧ�뼼��</span></p>

  </td>

 </tr>

 <tr>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.4pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.2pt'><span

  style='font-family:����'>ָ����ʦ����</span></p>

  </td>

  <td width=93 valign=top style='width:70.05pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span lang=EN-US>

   <%

  set rs2=server.CreateObject("adodb.recordset")

	sql="select * from teacher_inf where Tea_id='"&rs1("Tea_id")&"'"

	rs2.open sql,conn,1,3

	%>

  

  <%=rs2("Tea_name")%>

  

  ���</span></p>

  </td>

  <td width=106 valign=top style='width:79.15pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.0pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.6pt'><span

  style='font-family:����'>ָ����ʦְ��</span></p>

  </td>

  <td width=100 valign=top style='width:75.1pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.0pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.6pt'><span

  lang=EN-US> 

   <%

  set rs3=server.CreateObject("adodb.recordset")

	sql="select * from zc_table where zc_id='"&rs2("Zc_id")&"'"

	rs3.open sql,conn,1,3

	%>

  

  ������<%=rs3("zc_name")%>  

  <% 				

		rs3.close

			set rs3 = nothing



  %></span></p>

  </td>

  <td width=93 valign=top style='width:70.05pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.0pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.6pt'><span

  style='font-family:����'>ָ����ʦ��λ</span></p>

  </td>

  <td width=92 valign=top style='width:68.85pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal style='margin-top:2.3pt;margin-right:0cm;margin-bottom:

  2.3pt;margin-left:0cm'> 

  <%

  set rs4=server.CreateObject("adodb.recordset")

	sql="select * from res_table where res_id='"&rs2("res_id")&"'"

	rs4.open sql,conn,1,3

	%>

  

  <%=rs4("res_name")%>  

  <% 				

		rs4.close

			set rs4 = nothing



  %>���</p>

  </td>

 </tr>

 <tr style='page-break-inside:avoid'>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.4pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.2pt'><span

  style='font-family:����'>��ҵ������Ŀ</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal style='margin-top:2.3pt;margin-right:0cm;margin-bottom:

  2.3pt;margin-left:0cm'><span lang=EN-US>

  <%

  set rs5=server.CreateObject("adodb.recordset")

	sql5="select * from select_cursor where Sel_id="&rs1("Sel_id")

	rs5.open sql5,conn,1,3

	%>

  

  <%=rs5("Sel_name")%>  

  <% 				

		rs5.close

			set rs5 = nothing



  %>

  </span><span style="font-size: 10.5pt; font-family: ����">����</span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">Android</span><span style="font-size: 10.5pt; font-family: ����">��</span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">WiFi</span><span style="font-size: 10.5pt; font-family: ����">��</span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">ZigBee</span><span style="font-size: 10.5pt; font-family: ����">��Զ������������ϵͳ�о�</span></p>

  </td>

 </tr>

 <tr style='page-break-inside:avoid'>

  <td width=573 colspan=6 valign=top style='width:429.9pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:����'>��</span></p>

  </td>

 </tr>

  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">

 <tr style='page-break-inside:avoid;height:285.2pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:285.2pt'>

  <p class=MsoNormal><span style='font-family:����'>ѡ�ⱳ����ѡ�����壨</span></p>

  <p class=MsoNormal><span style='font-family:����'>�������о���״���������뼰���������⣩</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:285.2pt'>

  <p class=MsoNormal><span lang=EN-US>

    <%

  

  set rs9 = server.createobject("adodb.recordset")

	sql="select * from sel_record where St_number ='"&Session("studentnumber")&"'"

	rs9.open sql,conn,1,3	



  %>

	<textarea name="content1" cols="60" rows="8" class="textfield1" id="content1" style="WIDTH: 582; height:347" >�����ִ��������������ִ�����ͨ�ż�����Ƕ��ʽ�������ֲ�ʽ����ȼ����Ŀ��ٷ�չ�����ߴ���������Ĺ���Խ��Խ�࣬ʹ����Ӧ������Խ��Խ��Ӧ�÷�ΧԽ��Խ�����ߴ���������ڵ�Ļ��������ǳɱ��͡����ĵ͡������ߴ��������� (Wireless Sensor Network��WSN)�У������Ĵ������ڵ㱻���������ز������ض��Ĺ��������У�ÿ���������ڵ㶼�ɻ�ȡ��Χ��������Ϣ������ͨ������ͨ��ʵ����������֯���γɷֲ�ʽ����ϵͳ���໥Эͬ���ָ��������Android����Google��������һ�������ֻ�����ϵͳ��Ŀǰռ�зݶ�Ѹ���������ռ��ʺܸߡ����ܽ�WSN��Android�ֻ������һ�������������û��ǹ�ҵӦ�ö��кܹ������г�ǰ����
Wi-Fi��һ��������·ͨ�ż�����Ʒ�ƣ���Wi-Fi����(Wi-Fi Alliance)�����С�Wi-Fi��������Ŀǰ�ڴ���бȽϳ��ã���Ȼ��Wi-Fi�������������ͨ���������Ǻܺã����ݰ�ȫ���ܱ�������һЩ����������Ҳ�д��Ľ����������ٶȷǳ��죬���Դﵽ54mbps�����ϸ��˺������Ϣ��������Wi-Fi����Ҫ���������ڲ���Ҫ���ߣ����Բ��ܲ������������ƣ���˷ǳ��ʺ��ƶ��칫�û�����Ҫ�� 
ZigBee��һ�����˵Ķ̾�������ͨ�ż����������������:���ĵ͡��ɱ��͡����ݴ����ʵ͡�Э�鸴�Ӷȵ͵ȡ�zigBee�б�׼��Э��ջ��������㡢ý����ʿ��Ʋ㡢����㡢Ӧ��֧���Ӳ��Э���׼��IEEE802.15.4ίԱ���ZigBee���˹�ͬ�ƶ����ڴ�֮�ϣ��κγ��̶��ɸ��ݾ����Ӧ�����󿪷��Լ���Ӧ�ó�������zigBeeЭ��ջԴ����������ʹ�ã���ˣ�ʹ��ZigBee����������ɱ��ܵ͡�����Ϊ����еĿɿ�����Ч�����ڿ�������������Ʒ���ݵ��ڶ��ŵ㣬ʹ�������ߴ������������й㷺�����õ�Ӧ��ǰ����
�����������ߴ��似������������ľ����ԡ�WIFI������������Ҫ�㷺Ӧ�ã����ṩ���һ����Ĵ������������������ܼ������Ҷ�Android�����ֻ���˵��WiFi�Ĺ���̫�����Գ���ʹ�á�ZigBee��Ȼ���ĳɱ��ͣ��������ݴ�������̫�ͣ������������õ�Ӱ������������Ҳ�����ռ��ʵ��µ����ԭ�򡣵�������ߵ����ƻ�������ȡ���������кܺõ�Ӧ��ǰ����
</textarea>

	

	



</span></p>

  </td>

 </tr>

 <tr style='height:84.85pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:84.85pt'>

  <p class=MsoNormal><span style='font-family:����'>����׫д���������ȡ�ķ������ֶ�</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:84.85pt'>

 

  <textarea name="content2" cols="60" rows="8" class="textfield2" id="content2" style="WIDTH: 580; height:300" >��������Ҫ����������������֣�
1��Android�ֻ����WiFi��������ͨ�š�
2������openwrt������·������װ����չ 
3��Zigbee������Զ�̿��Ƽ����о�
</textarea>

  </td>

 </tr>

 <tr style='page-break-inside:avoid;height:114.75pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>����׫д</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp; </span><span

  style='font-family:����'>��</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <textarea name="content3" cols="60" rows="8" class="textfield3" id="content3" style="WIDTH: 580; height:300">һ���о����������ⷢչ��״�����輼�ܣ������ܣ��о�Ŀ�ģ�
�������۽��ܣ�����ṹ��Ӳ���ṹ������ģ����ܣ�
��������ʵ�֣��������̣�������룩
�ģ��Ż������ӹ���
�壺���Լ��ܽ�
�������ԣ������ܽᣬ���õ��������ϵȣ�
</textarea>  </td>

 </tr>

 <tr style='height:114.75pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>�ƻ�����</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <textarea name="content4" cols="60" rows="8" class="textfield4" id="content4" style="WIDTH: 580; height:300">�ƻ�����
	2012��11��20�ա���2012��11��30�գ���ҵ������ϲ��ҡ�
2012��12��1 �ա���2012��1 ��15�գ�Wifi��������ʵ�֡�
2012��1 ��16�ա���2013��1 ��30�գ�openwrt����·����ģ����ɡ�
2013��2 ��1 �ա���2013��2 ��15�գ�zigbeeģ�����
2013��2 ��16�ա���2013��2 ��28�գ�ͨ�Ų��Լ������Ż�
2013��3 ��1 �ա���2013��3 ��14�գ���ҵ���ĳ��塢���塣
2011��3 ��15�ա���2013��3 ��20�գ����Ĵ�硣

</textarea>  </td>

 </tr>

 

 <tr style='height:114.75pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>ָ����ʦ</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp; </span><span

  style='font-family:����'>��</span></p>

  </td>

  <td width=484 colspan=5 valign=bottom style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span><span style="font-size: 10.5pt; font-family: ����">&nbsp;&nbsp;&nbsp; 

	���������Լ�רҵ�س����г���չ�������ѡ�⣬���ο��˴������ף����ȷ���Ŀ�����н�ǿ��ʵ�ü�ֵ����������ѧ��Сѧ����Ŀ���������������������רҵ��չ���򣬶�����߻���֪ʶ���о��������档�����о��ƻ������ѶȺ��ʣ��ܹ���Ԥ��ʱ������ɸÿ������ơ�</span></p>

	<p class=MsoNormal><span style="font-family: ����">&nbsp;&nbsp;&nbsp; </span>

	<span style="font-size: 10.5pt; font-family: ����">ͬ�⿪�⣡</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal align=right style='text-align:right;line-height:150%;

  word-break:break-all'><span style='font-family:����'>ǩ����</span><span

  lang=EN-US>&nbsp;<img border="0" src="ybx.JPG" width="83" height="24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang="en-us">2012</span><span style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11&nbsp; </span><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

	2&nbsp; &nbsp; </span><span

  style='font-family:����'>��</span></p>

  </td>

 </tr>

 <tr style='height:137.15pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:137.15pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>��</span> <span style='font-family:����'>ѧ</span> <span

  style='font-family:����'>Ժ</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>������</span> <span style='font-family:����'>��</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp; </span><span

  style='font-family:����'>��</span></p>

  </td>

  <td width=484 colspan=5 valign=bottom style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:137.15pt'>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal style='text-indent:94.5pt;line-height:150%'><span

  style='font-family:����'>��ѧԺ��������ǩ����</span></p>

  <p class=MsoNormal align=right style='text-align:right;line-height:150%;

  word-break:break-all'><span style='font-family:����'>���Ӹ�ѧԺ��ѧ���£�</span><span

  lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

  </span><span style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  </span><span style='font-family:����'>��</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

  </span><span style='font-family:����'>��</span></p>

  </td>

 </tr>

 <tr height=0>

  <td width=89 style='border:none'></td>

  <td width=93 style='border:none'></td>

  <td width=106 style='border:none'></td>

  <td width=100 style='border:none'></td>

  <td width=93 style='border:none'></td>

  <td width=92 style='border:none'></td>

 </tr>

</table>



</div>



</div>

	<p align="center">

	<% 				

		rs1.close

			set rs1 = nothing



  %>

  <% 				

		rs2.close

			set rs2 = nothing



  %>

    <%

  	

		rs9.close

		set rs9 = nothing

		conn.close

		set conn=nothing



  %>

<%end if%>



 <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit3" value=" �� �� " style="WIDTH: 60;" />        ����

        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit22" value=" �� �� " style="WIDTH: 60;" />



</p>

</form>

</body>



</html>

