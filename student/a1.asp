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

			alert("请输入编号!");

			document.editForm.content1.focus();

			return false;

			}

			if (document.editForm.content2.value.length == 0) { 

			alert("请输入姓名!");

			document.editForm.content2.focus();

			return false;

			}

			if (document.editForm.content3.value.length == 0) { 

			alert("请输入留言内容!");

			document.editForm.content3.focus();

			return false;

			}

			return true;

		}

</script>



<title>开题报告</title>

</head>



<!--#include file="../inc/Conn.asp" -->

<!--#include file="CheckAdmin.asp"-->





<style>

<!--

 /* Font Definitions */

 @font-face

	{font-family:宋体;

	panose-1:2 1 6 0 3 1 1 1 1 1;}

@font-face

	{font-family:黑体;

	panose-1:2 1 6 9 6 1 1 1 1 1;}

@font-face

	{font-family:"Cambria Math";

	panose-1:2 4 5 3 5 4 6 3 2 4;}

@font-face

	{font-family:Calibri;

	panose-1:2 15 5 2 2 2 4 3 2 4;}

@font-face

	{font-family:楷体_GB2312;}

@font-face

	{font-family:华文行楷;

	panose-1:2 1 8 0 4 1 1 1 1 1;}

@font-face

	{font-family:Tahoma;

	panose-1:2 11 6 4 3 5 4 4 2 4;}

@font-face

	{font-family:"\@宋体";

	panose-1:2 1 6 0 3 1 1 1 1 1;}

@font-face

	{font-family:"\@黑体";

	panose-1:2 1 6 9 6 1 1 1 1 1;}

@font-face

	{font-family:"\@华文行楷";

	panose-1:2 1 8 0 4 1 1 1 1 1;}

@font-face

	{font-family:"\@楷体_GB2312";}

 /* Style Definitions */

 p.MsoNormal, li.MsoNormal, div.MsoNormal

	{margin:0cm;

	margin-bottom:.0001pt;

	text-align:justify;

	text-justify:inter-ideograph;

	font-size:10.5pt;

	font-family:"Calibri","sans-serif";}

h1

	{mso-style-link:"标题 1 Char";

	margin-right:0cm;

	margin-left:0cm;

	font-size:24.0pt;

	font-family:宋体;

	font-weight:bold;}

p.MsoHeader, li.MsoHeader, div.MsoHeader

	{mso-style-link:"页眉 Char";

	margin:0cm;

	margin-bottom:.0001pt;

	text-align:center;

	layout-grid-mode:char;

	border:none;

	padding:0cm;

	font-size:9.0pt;

	font-family:"Calibri","sans-serif";}

p.MsoFooter, li.MsoFooter, div.MsoFooter

	{mso-style-link:"页脚 Char";

	margin:0cm;

	margin-bottom:.0001pt;

	layout-grid-mode:char;

	font-size:9.0pt;

	font-family:"Calibri","sans-serif";}

p.MsoBodyTextIndent, li.MsoBodyTextIndent, div.MsoBodyTextIndent

	{mso-style-link:"正文文本缩进 Char";

	margin-top:0cm;

	margin-right:0cm;

	margin-bottom:6.0pt;

	margin-left:21.0pt;

	text-align:justify;

	text-justify:inter-ideograph;

	font-size:10.5pt;

	font-family:"Times New Roman","serif";}

p.MsoDate, li.MsoDate, div.MsoDate

	{mso-style-link:"日期 Char";

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

	font-family:宋体;}

span.Char

	{mso-style-name:"日期 Char";

	mso-style-link:日期;}

span.1Char

	{mso-style-name:"标题 1 Char";

	mso-style-link:"标题 1";

	font-family:宋体;

	font-weight:bold;}

span.Char0

	{mso-style-name:"正文文本缩进 Char";

	mso-style-link:正文文本缩进;

	font-family:"Times New Roman","serif";}

span.Char1

	{mso-style-name:"页眉 Char";

	mso-style-link:页眉;}

span.Char2

	{mso-style-name:"页脚 Char";

	mso-style-link:页脚;}

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

style='font-size:14.0pt;line-height:150%;font-family:宋体'>北京师范大学珠海分校</span></b></p>



<p class=MsoNormal align=center style='text-align:center;line-height:150%'><b><span

style='font-size:14.0pt;line-height:150%;font-family:宋体'>本科生毕业论文（设计）开题报告</span></b></p>



<div align=center>



<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=573 style='width:429.9pt;border-collapse:collapse;border:none'>

 <tr>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:宋体'>学生姓名</span></p>

  </td>

  <td width=199 colspan=2 valign=top style='width:149.2pt;border:solid windowtext 1.0pt;

  border-left:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span lang=EN-US><%=Session("studentname")%>  </span>

	<span style="font-size: 10.5pt; font-family: 宋体">余杰霖</span></p>

  </td>

  <td width=100 valign=top style='width:75.1pt;border:solid windowtext 1.0pt;

  border-left:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:宋体'>学</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>号</span><span lang=EN-US> </span></p>

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

  style='font-family:宋体'>学院（部）</span></p>

  </td>

  <td width=199 colspan=2 valign=top style='width:149.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'>信息技术学院</p>

  </td>

  <td width=100 valign=top style='width:75.1pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:宋体'>专</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>业</span><span lang=EN-US> </span></p>

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



  %></span><span style="font-size: 10.5pt; font-family: 宋体">电子信息科学与技术</span></p>

  </td>

 </tr>

 <tr>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.4pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.2pt'><span

  style='font-family:宋体'>指导教师姓名</span></p>

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

  

  杨博雄</span></p>

  </td>

  <td width=106 valign=top style='width:79.15pt;border-top:none;border-left:

  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.0pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.6pt'><span

  style='font-family:宋体'>指导教师职称</span></p>

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

  

  副教授<%=rs3("zc_name")%>  

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

  style='font-family:宋体'>指导教师单位</span></p>

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



  %>杨博雄</p>

  </td>

 </tr>

 <tr style='page-break-inside:avoid'>

  <td width=89 valign=top style='width:66.7pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:-8.4pt;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center;text-indent:-8.2pt'><span

  style='font-family:宋体'>毕业论文题目</span></p>

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

  </span><span style="font-size: 10.5pt; font-family: 宋体">基于</span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">Android</span><span style="font-size: 10.5pt; font-family: 宋体">的</span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">WiFi</span><span style="font-size: 10.5pt; font-family: 宋体">与</span><span lang="EN-US" style="font-size: 10.5pt; font-family: Times New Roman">ZigBee</span><span style="font-size: 10.5pt; font-family: 宋体">的远程无线物联网系统研究</span></p>

  </td>

 </tr>

 <tr style='page-break-inside:avoid'>

  <td width=573 colspan=6 valign=top style='width:429.9pt;border:solid windowtext 1.0pt;

  border-top:none;padding:0cm 5.4pt 0cm 5.4pt'>

  <p class=MsoNormal align=center style='margin-top:2.3pt;margin-right:0cm;

  margin-bottom:2.3pt;margin-left:0cm;text-align:center'><span

  style='font-family:宋体'>开</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>题</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>报</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>告</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>内</span><span lang=EN-US>&nbsp; </span><span

  style='font-family:宋体'>容</span></p>

  </td>

 </tr>

  <form name="editForm" method="post" action="?Action=addnew" onsubmit="return depart_add()">

 <tr style='page-break-inside:avoid;height:285.2pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:285.2pt'>

  <p class=MsoNormal><span style='font-family:宋体'>选题背景及选题意义（</span></p>

  <p class=MsoNormal><span style='font-family:宋体'>国内外研究现状、初步设想及拟解决的问题）</span></p>

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

	<textarea name="content1" cols="60" rows="8" class="textfield1" id="content1" style="WIDTH: 582; height:347" >随着现代传感器技术、现代无线通信技术、嵌入式技术及分布式计算等技术的快速发展，无线传感器网络的功能越来越多，使得其应用领域越来越宽，应用范围越来越大。无线传感器网络节点的基本特征是成本低、功耗低。在无线传感器网络 (Wireless Sensor Network，WSN)中，大量的传感器节点被随机、无序地部署在特定的工作环境中，每个传感器节点都可获取周围环境的信息，它们通过无线通信实现网络自组织，形成分布式自治系统，相互协同完成指定的任务。Android是由Google领军提出的一个智能手机操作系统，目前占有份额迅速上升，普及率很高。若能将WSN和Android手机结合在一起，则无论在民用还是工业应用都有很广阔的市场前景。
Wi-Fi是一个无线网路通信技术的品牌，由Wi-Fi联盟(Wi-Fi Alliance)所持有。Wi-Fi无线上网目前在大城市比较常用，虽然由Wi-Fi技术传输的无线通信质量不是很好，数据安全性能比蓝牙差一些，传输质量也有待改进，但传输速度非常快，可以达到54mbps，符合个人和社会信息化的需求。Wi-Fi最主要的优势在于不需要布线，可以不受布线条件的限制，因此非常适合移动办公用户的需要。 
ZigBee是一种新兴的短距离无线通信技术。其典型特征是:功耗低、成本低、数据传输率低、协议复杂度低等。zigBee有标准的协议栈，其物理层、媒体访问控制层、网络层、应用支持子层的协议标准由IEEE802.15.4委员会和ZigBee联盟共同制定，在此之上，任何厂商都可根据具体的应用需求开发自己的应用程序。现在zigBee协议栈源码可免费下载使用，因此，使用ZigBee技术的软件成本很低。又因为其固有的可靠、高效和易于开发、组网灵活、产品兼容等众多优点，使它在无线传感器网络中有广泛而良好的应用前景。
但这两种无线传输技术都有其自身的局限性。WIFI传输距离近，若要广泛应用，在提供最后一公里的传输解决方案上力所不能及。并且对Android智能手机来说，WiFi的功耗太大，难以长期使用。ZigBee虽然功耗成本低，但其数据传输速率太低，难以满足民用的影音娱乐需求。这也是其普及率低下的最大原因。但如果二者的优势互补，各取所长，则有很好的应用前景。
</textarea>

	

	



</span></p>

  </td>

 </tr>

 <tr style='height:84.85pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:84.85pt'>

  <p class=MsoNormal><span style='font-family:宋体'>论文撰写过程中拟采取的方法和手段</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:84.85pt'>

 

  <textarea name="content2" cols="60" rows="8" class="textfield2" id="content2" style="WIDTH: 580; height:300" >本论文主要论述网络的三个部分：
1、Android手机间的WiFi组网互相通信。
2、兼容openwrt的无线路由器改装和拓展 
3、Zigbee组网及远程控制技术研究
</textarea>

  </td>

 </tr>

 <tr style='page-break-inside:avoid;height:114.75pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>论文撰写</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>提</span><span lang=EN-US>&nbsp;&nbsp;&nbsp; </span><span

  style='font-family:宋体'>纲</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <textarea name="content3" cols="60" rows="8" class="textfield3" id="content3" style="WIDTH: 580; height:300">一：研究背景（论题发展现状，所需技能，自身技能，研究目的）
二：理论介绍（网络结构，硬件结构，功能模块介绍）
三：技术实现（程序流程，程序代码）
四：优化及附加功能
五：测试及总结
六：后言（论文总结，采用的文献资料等）
</textarea>  </td>

 </tr>

 <tr style='height:114.75pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>计划进度</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>

  </td>

  <td width=484 colspan=5 valign=top style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <textarea name="content4" cols="60" rows="8" class="textfield4" id="content4" style="WIDTH: 580; height:300">计划进度
	2012年11月20日——2012年11月30日：毕业设计资料查找。
2012年12月1 日——2012年1 月15日：Wifi组网功能实现。
2012年1 月16日——2013年1 月30日：openwrt无线路由器模块完成。
2013年2 月1 日——2013年2 月15日：zigbee模块完成
2013年2 月16日——2013年2 月28日：通信测试及网络优化
2013年3 月1 日——2013年3 月14日：毕业论文初稿、定稿。
2011年3 月15日——2013年3 月20日：论文答辩。

</textarea>  </td>

 </tr>

 

 <tr style='height:114.75pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>指导教师</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>意</span><span lang=EN-US>&nbsp;&nbsp;&nbsp; </span><span

  style='font-family:宋体'>见</span></p>

  </td>

  <td width=484 colspan=5 valign=bottom style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:114.75pt'>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span><span style="font-size: 10.5pt; font-family: 宋体">&nbsp;&nbsp;&nbsp; 

	该生根据自己专业特长和市场发展动向进行选题，并参考了大量文献，最后确定的课题具有较强的实用价值。本课题是学生小学期项目的延续，并符合其自身的专业发展方向，对于提高基本知识和研究能力有益。报告研究计划合理，难度合适，能够在预定时间内完成该课题的设计。</span></p>

	<p class=MsoNormal><span style="font-family: 宋体">&nbsp;&nbsp;&nbsp; </span>

	<span style="font-size: 10.5pt; font-family: 宋体">同意开题！</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal align=right style='text-align:right;line-height:150%;

  word-break:break-all'><span style='font-family:宋体'>签名：</span><span

  lang=EN-US>&nbsp;<img border="0" src="ybx.JPG" width="83" height="24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span lang="en-us">2012</span><span style='font-family:宋体'>年</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;11&nbsp; </span><span

  style='font-family:宋体'>月</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

	2&nbsp; &nbsp; </span><span

  style='font-family:宋体'>日</span></p>

  </td>

 </tr>

 <tr style='height:137.15pt'>

  <td width=89 style='width:66.7pt;border:solid windowtext 1.0pt;border-top:

  none;padding:0cm 5.4pt 0cm 5.4pt;height:137.15pt'>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>教</span> <span style='font-family:宋体'>学</span> <span

  style='font-family:宋体'>院</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>（部）</span> <span style='font-family:宋体'>长</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal align=center style='text-align:center'><span

  style='font-family:宋体'>意</span><span lang=EN-US>&nbsp;&nbsp;&nbsp; </span><span

  style='font-family:宋体'>见</span></p>

  </td>

  <td width=484 colspan=5 valign=bottom style='width:363.2pt;border-top:none;

  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;

  padding:0cm 5.4pt 0cm 5.4pt;height:137.15pt'>

  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

  <p class=MsoNormal style='text-indent:94.5pt;line-height:150%'><span

  style='font-family:宋体'>教学院（部）长签名：</span></p>

  <p class=MsoNormal align=right style='text-align:right;line-height:150%;

  word-break:break-all'><span style='font-family:宋体'>（加盖学院或学部章）</span><span

  lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

  </span><span style='font-family:宋体'>年</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  </span><span style='font-family:宋体'>月</span><span lang=EN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

  </span><span style='font-family:宋体'>日</span></p>

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



 <input name="submitSaveEdit" type="submit" class="button"  id="submitSaveEdit3" value=" 提 交 " style="WIDTH: 60;" />        　　

        <input name="submitSaveEdit2" type="reset" class="button"  id="submitSaveEdit22" value=" 重 置 " style="WIDTH: 60;" />



</p>

</form>

</body>



</html>

