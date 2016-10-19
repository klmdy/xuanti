<% server.scripttimeout=9999 %>
<!--#include FILE="upload_5xsoft.inc"-->
<%
function makefilename(fname)
  fname = date()
  fname = replace(fname,"-","")
  fname = replace(fname," ","") 
  fname = replace(fname,":","")
  makefilename=fname&".xls"
end function 

dim upload,file,filepath,excelpath
filepath="uploadfile/"
set upload=new upload_5xSoft ''建立上传对象
for each formName in upload.file ''列出所有上传了的文件
 set file=upload.file(formName)  ''生成一个文件对象
 if file.FileSize>0 and file.filesize<20480000 then         ''如果 FileSize > 0 说明有文件数据
  fname = makefilename(now())
  if GetExtendName(fname)="xls" then
  	file.SaveAs Server.mappath(filepath&fname)   ''保存文件
  	excelpath="upload/"&filepath&fname
  	response.write"<font size='2'>Excel表上传成功！</font><br>"
  	response.write"<font size='2'>上传的路径为：</font><font color='#0000ff'>"&excelpath&"</font>"
  	response.write "<script>parent.daoruf.excelpath.value+='"&excelpath&"'</script>"
    else
  	response.write("<script>alert(""文件必须是以.xls为后缀名的Excel表！"");history.back(-1);</script>")
  	response.end
 end if
 else
 response.write("<script>alert(""没有指定Excel文件或文件过大，最大20M！"");history.back(-1);</script>")
 response.end
 end if
set file=nothing
next
set upload=nothing  ''删除此对象

function GetExtendName(FileName)
dim ExtName
ExtName = LCase(FileName)
ExtName = right(ExtName,3)
ExtName = right(ExtName,3-Instr(ExtName,"."))
GetExtendName = ExtName
end function
%>