<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<BODY>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>���ݿ������ϵͳ���ݱ��֣�ѹ�����ָ�������Ա��¼��־</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
    <a href="DataManage.asp" onClick='changeAdminFlag("���ݿ����")'>��Ŀ��ҳ</a><font color="#0000FF">&nbsp;|&nbsp;</font>��վ���ݿ⣺<a href="DataManage.asp?Action=DataBackup&Result=Site" onClick='changeAdminFlag("��վ���ݿⱸ��")'>����</a>&nbsp;&nbsp;<a href="DataManage.asp?Action=DataCompact&Result=Site" onClick='changeAdminFlag("��վѹ�����ݿ�")'>ѹ��</a>&nbsp;&nbsp;<a href="DataManage.asp?Action=DataResume&Result=Site" onClick='changeAdminFlag("��վ�ָ����ݿ�")'>�ָ�</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="log.asp" onClick='changeAdminFlag("����Ա��¼��־")'>����Ա��¼��־</a><font color="#0000FF">&nbsp;</font><font color="#0000FF">&nbsp;</font></td>    
  </tr>
</table>
<br>
<% call DataManage() %>
</body>
</html>
<%
sub DataManage()
  Dim Action
  Action=request.QueryString("Action")
  Select Case Action
    Case "DataBackup"
	  DataBackup
    Case "DataCompact"
	  DataCompact
    Case "DataResume"
	  DataResume
    Case "DataLog"
	  DataLog
    Case Else
      DataMain
  End Select
end sub  
%><%
function DataMain
  response.write ("<table width='100%' border='0' cellpadding='3' cellspacing='1' bgcolor='#6298E1'><tr><td height='24' nowrap  bgcolor='#EBF2F9'>")
  response.write ("����˵����<br>���������ݿ��������Ϊ[����&nbsp;��&nbsp;ѹ��&nbsp;��&nbsp;�ָ�]<br>����������ǰ�����[<font color='#330099'>����</font>]���ݿ⣬����ʹ���е����ݿⲻ�ܱ�ѹ��<BR>�������ָ����ݿ�ʱ���Ḳ�ǵ�ǰʹ���е����ݿ�<br>����������Ա��¼��־�����鿴")
  response.write ("</td></tr></table>")
end function

function DataBackup()
  dim From,Fso,Result
  From=request.QueryString("From")
  Result=request.QueryString("Result")
  response.write ("<table width='100%' border='0' cellpadding='3' cellspacing='1' bgcolor='#6298E1'><tr><td height='24' nowrap  bgcolor='#EBF2F9' align='center'>")
  response.write ("<table width='560' border='0' cellspacing='0' cellpadding='0'><tr><td height='16'></td></tr>")
  response.write ("<tr><td height='20'>˵�����޸����ݿⱸ�ݱ���·�����ļ����������[ϵͳ���á�վ�㳣�����á����ݿⱸ��·��]</td></tr>")
  if From="Confirm" then
    set Fso=Server.CreateObject("Scripting.FileSystemObject")
	if Result="Site" then
	  Fso.CopyFile Server.MapPath(SiteDataPath),Server.MapPath(SiteDataBakPath)
      response.write ("<tr><td height='20'>�ɹ������Ѿ��ɹ��������ݵ�&nbsp;<a href='"&SiteDataBakPath&"' target='_blank'><font color='#330099'>"&SiteDataBakPath&"</font></a>&nbsp;��ע�⼰ʱɾ�����õı��ݣ�</td></tr>")
	else
	  Fso.CopyFile Server.MapPath(StatDataPath),Server.MapPath(StatDataBakPath)
      response.write ("<tr><td height='20'>�ɹ������Ѿ��ɹ��������ݵ�&nbsp;<a href='"&StatDataBakPath&"' target='_blank'><font color='#330099'>"&StatDataBakPath&"</font></a>&nbsp;��ע�⼰ʱɾ�����õı��ݣ�</td></tr>")
    end if
 	response.write ("<tr><td height='20'>�汾�����ݿ��ʱ��汾Ϊ&nbsp;"& now() &"</td></tr>")
    Set Fso=nothing
  end if	  
  response.write ("<form id='DataBackupForm' name='DataBackupForm' method='post' action='DataManage.asp?From=Confirm&Action=DataBackup&Result="&Result&"'>")
  if Result="Site" then
    response.write ("<tr><td height='30'>��Դ��<input name='fromPath' readonly type='text' size='60' value='"&SiteDataPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>Ŀ�꣺<input name='toPath' readonly type='text' size='60' value='"&SiteDataBakPath&"' class='textfield' /></td></tr>")
  else
    response.write ("<tr><td height='30'>��Դ��<input name='fromPath' readonly type='text' size='60' value='"&StatDataPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>Ŀ�꣺<input name='toPath' readonly type='text' size='60' value='"&StatDataBakPath&"' class='textfield' /></td></tr>")
  end if
  response.write ("<tr><td height='30'><input type='submit' value='ȷ������' class='button' /></td></tr>")
  response.write ("</form>")  
  response.write ("<tr><td height='16'></td></tr></table>")
  response.write ("</td></tr></table>")
end function

function DataCompact()
  dim From,Fso,Engine,SDBPath,Result
  From=request.QueryString("From")
  Result=request.QueryString("Result")
  response.write ("<table width='100%' border='0' cellpadding='3' cellspacing='1' bgcolor='#6298E1'><tr><td height='24' nowrap  bgcolor='#EBF2F9' align='center'>")
  response.write ("<table width='560' border='0' cellspacing='0' cellpadding='0'><tr><td height='16'></td></tr>")
  response.write ("<tr><td height='20'>˵����ѹ��ǰ�����[<font color='#330099'>����</font>]���ݿ⣬����ʹ���е����ݿⲻ�ܱ�ѹ��</td></tr>")
  if From="Confirm" then
    if Result="Site" then
      SDBPath = server.mappath(SiteDataBakPath)
	else
      SDBPath = server.mappath(StatDataBakPath)
	end if
    set Fso=Server.CreateObject("Scripting.FileSystemObject")
	if Fso.FileExists(SDBPath) then
      Set Engine =Server.CreateObject("JRO.JetEngine")
	  if request("boolIs") = "97" then
	     Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & SDBPath, _
		                        "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & SDBPath & "_temp.mdb;" _
		                        & "Jet OLEDB:Engine Type=" & JET_3X
	  else 
	     Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & SDBPath, _
		                        "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & SDBPath & "_temp.mdb"
      end if
      Fso.CopyFile SDBPath & "_temp.mdb",SDBPath
      Fso.DeleteFile(SDBPath & "_temp.mdb")
      set Fso = nothing
      set Engine = nothing
      response.write ("<tr><td height='20'>�ɹ������ݿ�&nbsp;<a href='"&SDBPath&"' target='_blank'><font color='#330099'>"&SiteDataBakPath&"</font></a>&nbsp;�Ѿ�ѹ���ɹ���</td></tr>")
	  response.write ("<tr><td height='20'>�汾�����ݿ��ʱ��汾Ϊ&nbsp;"& now() &"</td></tr>")
    else
      response.write ("<tr><td height='20'>ʧ�ܣ����ݿ�&nbsp;<a href='"&SDBPath&"' target='_blank'><font color='#330099'>"&SiteDataBakPath&"</font></a>&nbsp;ѹ��ʧ�ܣ�����·�������ݿ����Ƿ���ڣ�</td></tr>")
    end if
  end if
  response.write ("<form id='DataCompactForm' name='DataCompactForm' method='post' action='DataManage.asp?From=Confirm&Action=DataCompact&Result="&Result&"'>")
  if Result="Site" then
    response.write ("<tr><td height='30'>Ŀ�꣺<input name='toPath' readonly type='text' size='60' value='"&SiteDataBakPath&"' class='textfield'/></td></tr>")
  else
    response.write ("<tr><td height='30'>Ŀ�꣺<input name='toPath' readonly type='text' size='60' value='"&StatDataBakPath&"' class='textfield'/></td></tr>")
  end if
  response.write ("<tr><td height='30'><input type='submit' value='ȷ��ѹ��' class='button' /></td></tr>")
  response.write ("</form>")  
  response.write ("<tr><td height='16'></td></tr></table>")
  response.write ("</td></tr></table>")
end function

function DataResume()
  dim From,Fso,SDPath,SDBPath,Result
  From=request.QueryString("From")
  Result=request.QueryString("Result")
  response.write ("<table width='100%' border='0' cellpadding='3' cellspacing='1' bgcolor='#6298E1'><tr><td height='24' nowrap  bgcolor='#EBF2F9' align='center'>")
  response.write ("<table width='560' border='0' cellspacing='0' cellpadding='0'><tr><td height='16'></td></tr>")
  response.write ("<tr><td height='20'>˵�����޸ı��ݡ�Ŀ�����ݿ�ı���·�����ļ����������[ϵͳ���á�վ�㳣�����á����ݿⱸ��·��]</td></tr>")
  if From="Confirm" then
    if Result="Site" then
	  SDPath = server.mappath(SiteDataPath)
      SDBPath = server.mappath(SiteDataBakPath)
	else
	  SDPath = server.mappath(StatDataPath)
      SDBPath = server.mappath(StatDataBakPath)
	end if
    set Fso=Server.CreateObject("Scripting.FileSystemObject")
    if Fso.FileExists(SDBPath) then
      Fso.CopyFile SDBPath,SDPath
      Set Fso=nothing
      response.write ("<tr><td height='20'>�ɹ������Ѿ��ɹ��ָ����ݿ�&nbsp;<font color='#330099'>"&SDPath&"</font>&nbsp;ע�⼰ʱɾ�����õı��ݣ�</td></tr>")
	  response.write ("<tr><td height='20'>�汾�����ݿ��ʱ��汾Ϊ&nbsp;"& now() &"</td></tr>")
    else
      response.write ("<tr><td height='20'>ʧ�ܣ����ݿ�&nbsp;<a href='"&SDBPath&"' target='_blank'><font color='#330099'>"&SDBPath&"</font></a>&nbsp;ѹ��ʧ�ܣ�����·�������ݿ����Ƿ���ڣ�</td></tr>")
    end if
  end if	    
  response.write ("<form id='DataResumeForm' name='DataResumeForm' method='post' action='DataManage.asp?From=Confirm&Action=DataResume&Result="&Result&"'>")
  if  Result="Site" then
    response.write ("<tr><td height='30'>��Դ��<input name='fromPath' readonly type='text' size='60' value='"&SiteDataBakPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>Ŀ�꣺<input name='toPath' readonly type='text' size='60' value='"&SiteDataPath&"' class='textfield' /></td></tr>")
  else
    response.write ("<tr><td height='30'>��Դ��<input name='fromPath' readonly type='text' size='60' value='"&StatDataBakPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>Ŀ�꣺<input name='toPath' readonly type='text' size='60' value='"&StatDataPath&"' class='textfield' /></td></tr>")
  end if
  response.write ("<tr><td height='30'><input type='submit' value='ȷ���ָ�' class='button' /></td></tr>")
  response.write ("</form>")  
  response.write ("<tr><td height='16'></td></tr></table>")
  response.write ("</td></tr></table>")
end function

%>