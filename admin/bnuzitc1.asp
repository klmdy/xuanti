<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE><%=session("sysname")%></TITLE>
<link rel="stylesheet" href="../js/CssAdmin.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<SCRIPT language=JavaScript>
function switchSysBar()
{
   if (switchPoint.innerText==3)
   {
      switchPoint.innerText=4
      document.all("frameTitle").style.display="none"
   }
   else
   {
      switchPoint.innerText=3
      document.all("frameTitle").style.display=""
   }
}
window.location.href="SysLeft1.asp"
</SCRIPT>
</head>

<!--#include file="CheckAdmin.asp"-->
<BODY scroll="no" topmargin="0" bottom="0" leftmargin="0" rightmargin="0" style="text-align:center">
  
   

</BODY>
</HTML>