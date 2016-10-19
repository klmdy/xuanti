<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>课题选择</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>

  <center>
    <br/>


<%
'判断学生选题次数是否超过规定次数。
set rsp = server.createobject("adodb.recordset")
sql="select * from select_true where st_number='"&session("user_no")&"'"
rsp.open sql,conn,1,1
if rsp.recordcount < 1 then
'获取选题标识
 id1=Trim(Request("selid"))
                    id2=Trim(Request("teaid")) 
                   id3=Trim(Request("stnumber"))
                 '跟新选题确选表
                          Set rs = Server.CreateObject("ADODB.Recordset")
    sql="select * from select_true"
rs.open sql,conn,1,3
rs.addnew
rs("Sel_id")=id1
rs("Tea_id")=id2
rs("St_number")=session("user_no")
rs.update
rs.close

Set rsa = Server.CreateObject("ADODB.Recordset")
sql="select * from select_cursor where sel_id="&id1
rsa.open sql,conn,1,3
rsa("sel_flag")=true
rsa.update
rsa.close
set rsa=nothing
response.Redirect("<script>alert('操作成功！');location.href=""task_list.asp""</script>")
response.End()
else
response.Write("<script>alert('选题次数已满！请返回……');history.back()</script>")
response.End()
end if

%>
