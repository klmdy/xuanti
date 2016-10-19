<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<% Option Explicit %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=session("sysname")%></title>
<link rel="stylesheet" href="../js/CssAdmin.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<script language=JavaScript>
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

window.onload=function reinitIframe() {
                 var iframe = document.getElementById("urlIframe");
               try
              {
                                 var bHeight = iframe.contentWindow.document.body.scrollHeight;
              /*
                                 var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                                 var height = Math.max(bHeight, dHeight);
                                  iframe.height = height;                */
                                 iframe.height = bHeight;
              }
                        catch (ex) { }


              }
              window.location.href='./SysLeft1.asp'
</script>
</head>

<!--#include file="CheckAdmin.asp"-->
<body scroll="no" topmargin="0" bottom="0" leftmargin="0" rightmargin="0">

   <!-- <iframe
      style="z-index:2; visibility:inherit; width:100%; height:100%; text-align:center"
      name="leftFrame" id="leftFrame"  marginWidth="0" marginHeight="0"
      src="SysLeft1.asp" frameBorder="0" noResize scrolling="auto">
	</iframe>-->

</body>
</html>