<%@ LANGUAGE = VBScript.Encode %>
<html>
<head>
<title>�ļ��ϴ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="home.css" rel=stylesheet>
</head>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0>
<%
nowtime=now()
shijian=cstr(year(nowtime))+right("0"+cstr(month(nowtime)),2)+right("0"+cstr(day(nowtime)),2)+right("0"+cstr(hour(nowtime)),2)+right("0"+cstr(minute(nowtime)),2)+right("0"+cstr(second(nowtime)),2)
webid=shijian & cstr(session("Uid"))


application("downdir")="��/"
ip= Request.ServerVariables("REMOTE_ADDR")
sj=cstr(year(nowtime))+"-"+cstr(month(nowtime))+"-"+cstr(day(nowtime))+" "+cstr(hour(nowtime))+":"+right("0"+cstr(minute(nowtime)),2)+":"+right("0"+cstr(second(nowtime)),2)
%>
<!--#include FILE="upload_5xsoft.inc"-->
<%dim upload,file,formName,formPath,iCount
set upload=new upload_5xSoft ''�����ϴ�����
 	'--------������ת�����ļ���--------
	function MakedownName()
		dim fname
	  	fname = now()
		fname = replace(fname,"-","")
	 	fname = replace(fname," ","") 
		fname = replace(fname,":","")
	  	fname = replace(fname,"PM","")
	  	fname = replace(fname,"AM","")
		fname = replace(fname,"����","")
	  	fname = replace(fname,"����","")
	  	'fname = int(fname) + int((10-1+1)*Rnd + 1)
	  	fname = webid
		MakedownName=fname
	end function 
formPath="��/"
iCount=0
for each formName in upload.file ''�г������ϴ��˵��ļ�
 set file=upload.file(formName)  ''����һ���ļ�����
 if file.FileSize>500000 then         ''��� FileSize > 0 ˵�����ļ�����   
 %>
 
  <table width="100%" border="1" bgcolor="#efefef" bordercolorlight="#ffffff" bordercolordark="#ffffff" cellspacing="0" cellpadding="0" height="23">
                <tr>
                  <td width="100%" align="center" height="1">
                    <p align="center"><b><font color="#FF0000">�ļ�̫��,�޷��ϴ�����ѹ�����ٴ���</font></b><a href="javascript:history.back(1)"><b>����</b></a></p>
                  </td>
                </tr>
              </table>

 <%
   
   response.end
 end if
 
 if file.FileSize>0 then
  newname=MakedownName()&"."&mid(file.FileName,InStrRev(file.FileName, ".")+1)

  file.SaveAs Server.mappath(formPath&newname)   ''�����ļ�
  iCount=iCount+1
  tmpstr=application("downdir")&newname

 else 
 tmpstr="N/A"

 end if
 set file=nothing
next

   
%>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor=#000000 >��<B><font color="#FFFF00">�ϱ��ļ�</font></B></TD>
    <TD align=right bgColor=#000000 class=heading height=20></TD></TR>
  <TR>
    <TD align=middle vAlign=top width=109></TD>
    <TD align=middle>
        <TABLE bgColor=#666666 border=0 cellPadding=1 cellSpacing=1 
        width="100%">
	  <TR> 
            <TD bgColor=#efefef><font color="#FF0000">�ļ��Ѿ��ɹ��ϱ�</font>���Ƿ������ӡ���<BR>
<P>�ϱ��ˣ�<%=upload.form("Rname")%><BR>
<br>
��&nbsp;&nbsp;λ��<%=upload.form("Upart")%><BR>
<br>
˵&nbsp;&nbsp;����<%=upload.form("biaoti")%><BR>
<P><P><A HREF="addfile.asp"><b>�������</b></A>&nbsp;
              <table width="100%" border="1" bgcolor="#efefef" bordercolorlight="#ffffff" bordercolordark="#ffffff" cellspacing="0" cellpadding="0" height="23">
                <tr>
                  <td width="100%" align="center" height="1">
                    <p align="right"><a href="javascript:history.back(1)"><img border="0" src="images/previous.gif" width="85" height="19"></a></p>
                  </td>
                </tr>
              </table>
            </TD>
            
      </TR>
	  
      </table>
    </td></tr></table>

<%set upload=nothing  ''ɾ���˶���
%>