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
set upload=new upload_5xSoft ''�����ϴ�����
for each formName in upload.file ''�г������ϴ��˵��ļ�
 set file=upload.file(formName)  ''����һ���ļ�����
 if file.FileSize>0 and file.filesize<20480000 then         ''��� FileSize > 0 ˵�����ļ�����
  fname = makefilename(now())
  if GetExtendName(fname)="xls" then
  	file.SaveAs Server.mappath(filepath&fname)   ''�����ļ�
  	excelpath="upload/"&filepath&fname
  	response.write"<font size='2'>Excel���ϴ��ɹ���</font><br>"
  	response.write"<font size='2'>�ϴ���·��Ϊ��</font><font color='#0000ff'>"&excelpath&"</font>"
  	response.write "<script>parent.daoruf.excelpath.value+='"&excelpath&"'</script>"
    else
  	response.write("<script>alert(""�ļ���������.xlsΪ��׺����Excel��"");history.back(-1);</script>")
  	response.end
 end if
 else
 response.write("<script>alert(""û��ָ��Excel�ļ����ļ��������20M��"");history.back(-1);</script>")
 response.end
 end if
set file=nothing
next
set upload=nothing  ''ɾ���˶���

function GetExtendName(FileName)
dim ExtName
ExtName = LCase(FileName)
ExtName = right(ExtName,3)
ExtName = right(ExtName,3-Instr(ExtName,"."))
GetExtendName = ExtName
end function
%>