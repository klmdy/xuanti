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
set upload=new upload_5xsoft ''建立上传对象

formPath ="file/ybx/"&Session("studentnumber")&"/"    '路径



for each formName in upload.objFile ''列出所有上传了的文件
	set file=upload.file(formName)  ''生成一个文件对象
	if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
		file.SaveAs Server.mappath(formPath&file.FileName)   ''保存文件
	end if
	set file=nothing
next

set upload=nothing  ''删除此对象
%>
<script>window.parent.Finish("文件上传成功！");</script>