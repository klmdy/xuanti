<%OPTION EXPLICIT%>
<%Server.ScriptTimeOut=5000%>
<!--#include file="upload.inc"-->
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