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
    <td height="24" nowrap><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>数据库操作：系统数据备分，压缩，恢复，管理员登录日志</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap  bgcolor="#EBF2F9">
    <a href="DataManage.asp" onClick='changeAdminFlag("数据库操作")'>栏目首页</a><font color="#0000FF">&nbsp;|&nbsp;</font>网站数据库：<a href="DataManage.asp?Action=DataBackup&Result=Site" onClick='changeAdminFlag("网站数据库备份")'>备份</a>&nbsp;&nbsp;<a href="DataManage.asp?Action=DataCompact&Result=Site" onClick='changeAdminFlag("网站压缩数据库")'>压缩</a>&nbsp;&nbsp;<a href="DataManage.asp?Action=DataResume&Result=Site" onClick='changeAdminFlag("网站恢复数据库")'>恢复</a><font color="#0000FF">&nbsp;|&nbsp;</font><a href="log.asp" onClick='changeAdminFlag("管理员登录日志")'>管理员登录日志</a><font color="#0000FF">&nbsp;</font><font color="#0000FF">&nbsp;</font></td>    
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
  response.write ("操作说明：<br>　　·数据库操作步骤为[备份&nbsp;→&nbsp;压缩&nbsp;→&nbsp;恢复]<br>　　·操作前最好先[<font color='#330099'>备份</font>]数据库，正在使用中的数据库不能被压缩<BR>　　·恢复数据库时将会覆盖当前使用中的数据库<br>　　·管理员登录日志可做查看")
  response.write ("</td></tr></table>")
end function

function DataBackup()
  dim From,Fso,Result
  From=request.QueryString("From")
  Result=request.QueryString("Result")
  response.write ("<table width='100%' border='0' cellpadding='3' cellspacing='1' bgcolor='#6298E1'><tr><td height='24' nowrap  bgcolor='#EBF2F9' align='center'>")
  response.write ("<table width='560' border='0' cellspacing='0' cellpadding='0'><tr><td height='16'></td></tr>")
  response.write ("<tr><td height='20'>说明：修改数据库备份保存路径和文件名，请进入[系统设置→站点常量设置→数据库备份路径]</td></tr>")
  if From="Confirm" then
    set Fso=Server.CreateObject("Scripting.FileSystemObject")
	if Result="Site" then
	  Fso.CopyFile Server.MapPath(SiteDataPath),Server.MapPath(SiteDataBakPath)
      response.write ("<tr><td height='20'>成功：你已经成功备份数据到&nbsp;<a href='"&SiteDataBakPath&"' target='_blank'><font color='#330099'>"&SiteDataBakPath&"</font></a>&nbsp;，注意及时删除不用的备份！</td></tr>")
	else
	  Fso.CopyFile Server.MapPath(StatDataPath),Server.MapPath(StatDataBakPath)
      response.write ("<tr><td height='20'>成功：你已经成功备份数据到&nbsp;<a href='"&StatDataBakPath&"' target='_blank'><font color='#330099'>"&StatDataBakPath&"</font></a>&nbsp;，注意及时删除不用的备份！</td></tr>")
    end if
 	response.write ("<tr><td height='20'>版本：数据库的时间版本为&nbsp;"& now() &"</td></tr>")
    Set Fso=nothing
  end if	  
  response.write ("<form id='DataBackupForm' name='DataBackupForm' method='post' action='DataManage.asp?From=Confirm&Action=DataBackup&Result="&Result&"'>")
  if Result="Site" then
    response.write ("<tr><td height='30'>来源：<input name='fromPath' readonly type='text' size='60' value='"&SiteDataPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>目标：<input name='toPath' readonly type='text' size='60' value='"&SiteDataBakPath&"' class='textfield' /></td></tr>")
  else
    response.write ("<tr><td height='30'>来源：<input name='fromPath' readonly type='text' size='60' value='"&StatDataPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>目标：<input name='toPath' readonly type='text' size='60' value='"&StatDataBakPath&"' class='textfield' /></td></tr>")
  end if
  response.write ("<tr><td height='30'><input type='submit' value='确定备份' class='button' /></td></tr>")
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
  response.write ("<tr><td height='20'>说明：压缩前最好先[<font color='#330099'>备份</font>]数据库，正在使用中的数据库不能被压缩</td></tr>")
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
      response.write ("<tr><td height='20'>成功：数据库&nbsp;<a href='"&SDBPath&"' target='_blank'><font color='#330099'>"&SiteDataBakPath&"</font></a>&nbsp;已经压缩成功！</td></tr>")
	  response.write ("<tr><td height='20'>版本：数据库的时间版本为&nbsp;"& now() &"</td></tr>")
    else
      response.write ("<tr><td height='20'>失败：数据库&nbsp;<a href='"&SDBPath&"' target='_blank'><font color='#330099'>"&SiteDataBakPath&"</font></a>&nbsp;压缩失败，请检查路径和数据库名是否存在！</td></tr>")
    end if
  end if
  response.write ("<form id='DataCompactForm' name='DataCompactForm' method='post' action='DataManage.asp?From=Confirm&Action=DataCompact&Result="&Result&"'>")
  if Result="Site" then
    response.write ("<tr><td height='30'>目标：<input name='toPath' readonly type='text' size='60' value='"&SiteDataBakPath&"' class='textfield'/></td></tr>")
  else
    response.write ("<tr><td height='30'>目标：<input name='toPath' readonly type='text' size='60' value='"&StatDataBakPath&"' class='textfield'/></td></tr>")
  end if
  response.write ("<tr><td height='30'><input type='submit' value='确定压缩' class='button' /></td></tr>")
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
  response.write ("<tr><td height='20'>说明：修改备份、目标数据库的保存路径和文件名，请进入[系统设置→站点常量设置→数据库备份路径]</td></tr>")
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
      response.write ("<tr><td height='20'>成功：你已经成功恢复数据库&nbsp;<font color='#330099'>"&SDPath&"</font>&nbsp;注意及时删除不用的备份！</td></tr>")
	  response.write ("<tr><td height='20'>版本：数据库的时间版本为&nbsp;"& now() &"</td></tr>")
    else
      response.write ("<tr><td height='20'>失败：数据库&nbsp;<a href='"&SDBPath&"' target='_blank'><font color='#330099'>"&SDBPath&"</font></a>&nbsp;压缩失败，请检查路径和数据库名是否存在！</td></tr>")
    end if
  end if	    
  response.write ("<form id='DataResumeForm' name='DataResumeForm' method='post' action='DataManage.asp?From=Confirm&Action=DataResume&Result="&Result&"'>")
  if  Result="Site" then
    response.write ("<tr><td height='30'>来源：<input name='fromPath' readonly type='text' size='60' value='"&SiteDataBakPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>目标：<input name='toPath' readonly type='text' size='60' value='"&SiteDataPath&"' class='textfield' /></td></tr>")
  else
    response.write ("<tr><td height='30'>来源：<input name='fromPath' readonly type='text' size='60' value='"&StatDataBakPath&"' class='textfield'/></td></tr>")
    response.write ("<tr><td height='30'>目标：<input name='toPath' readonly type='text' size='60' value='"&StatDataPath&"' class='textfield' /></td></tr>")
  end if
  response.write ("<tr><td height='30'><input type='submit' value='确定恢复' class='button' /></td></tr>")
  response.write ("</form>")  
  response.write ("<tr><td height='16'></td></tr></table>")
  response.write ("</td></tr></table>")
end function

%>