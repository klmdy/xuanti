<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>����ѡ��</title>
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->

<body>

  <center>
    <br>



<%
'�ж�ѧ��ѡ������Ƿ񳬹��涨������
set rsp = server.createobject("adodb.recordset")
sql="select * from select_true where st_number='"&session("user_no")&"'"
rsp.open sql,conn,1,1
%>
<%
if rsp.recordcount < 1 then
'��ȡѡ���ʶ
 id1=Trim(Request("selid"))
                    id2=Trim(Request("teaid")) 
                   id3=Trim(Request("stnumber"))
                 '����ѡ��ȷѡ��
Set rs = Server.CreateObject("ADODB.Recordset")
    sql="select * from select_true"
rs.open sql,conn,1,3
rs.addnew
rs("Sel_id")=id1
rs("Tea_id")=id2
rs("St_number")=session("user_no")
rs("Sel_flag")=true
rs.update
rs.close
set rs=nothing

response.Redirect("<script>alert('�����ɹ���');location.href=""task_list.asp""</script>")
response.End()
%>
<%
else
response.Write("<script>alert('ѡ������������뷵�ء���');history.back()</script>")
response.End()
end if
%>

</body>