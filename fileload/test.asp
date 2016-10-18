<%
dim objfso,path
dim yy,mm,dd

yy=year(now)
mm=month(now)
dd=day(now)

if clng(mm) < 10 then yy = 0&mm
if clng(dd) < 10 then dd = 0&dd

set objfso=Server.CreateObject("Scripting.FileSystemObject") 
SourceFolder =server.MapPath("file\רש\"&yy&""&mm&""&dd&"") 
objfso.CreateFolder SourceFolder    
set objfso=nothing 
%>