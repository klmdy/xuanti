<%Server.ScriptTimeOut=5000%>
<!--#include file="upload.inc"-->

<%

	
	

set objfso=Server.CreateObject("Scripting.FileSystemObject") 

SourceFolder =server.MapPath("file\ybx\"&Session("studentnumber")) 

if (objfso.FolderExists(SourceFolder)) then
set objfso=nothing 

else  
objfso.CreateFolder SourceFolder    
set objfso=nothing 
end if





%>


<%

dim upload,file,formName,formPath
set upload=new upload_5xsoft ''�����ϴ�����

formPath ="file/ybx/"&Session("studentnumber")&"/"    '·��



for each formName in upload.objFile ''�г������ϴ��˵��ļ�
	set file=upload.file(formName)  ''����һ���ļ�����
	if file.FileSize>0 then         ''��� FileSize > 0 ˵�����ļ�����
		file.SaveAs Server.mappath(formPath&file.FileName)   ''�����ļ�
	end if
	set file=nothing
next

set upload=nothing  ''ɾ���˶���
%>
<script>window.parent.Finish("�ļ��ϴ��ɹ���");</script>