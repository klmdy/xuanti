<%Server.ScriptTimeOut=5000%>
<!--#include file="upload.inc"-->

<%
dim objfso,path
dim yy,mm,dd

yy=year(now)
mm=month(now)
dd=day(now)

if clng(mm) < 10 then yy = 0&mm
if clng(dd) < 10 then dd = 0&dd

set objfso=Server.CreateObject("Scripting.FileSystemObject") 
SourceFolder =server.MapPath("file\��\"&yy&""&mm&""&dd&"") 
objfso.CreateFolder SourceFolder    
set objfso=nothing 
%>


<%

dim upload,file,formName,formPath
set upload=new upload_5xsoft ''�����ϴ�����

formPath="file/��/"   '·��



for each formName in upload.objFile ''�г������ϴ��˵��ļ�
	set file=upload.file(formName)  ''����һ���ļ�����
	if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
		file.SaveAs Server.mappath(formPath&file.FileName)   ''�����ļ�
	end if
	set file=nothing
next

set upload=nothing  ''ɾ���˶���
%>
<script>window.parent.Finish("�ϴ��ļ��ɹ���");</script>