<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
</head>

<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<%
dim action,excelpath,sheet,edate
action=trim(request.querystring("action"))
excelpath=trim(request.form("excelpath"))
sheet=trim(request.form("sheet"))
select case action
case "daoru":call exctoacc(excelpath,sheet)
end select
function exctoacc(excpath,sheet)
  Dim excConn,Coon
  Dim excStrConn,strConn
  Dim excrs,rs
  Dim excSql
  Set excconn=Server.CreateObject("ADODB.Connection") 
  Set excrs = Server.CreateObject("ADODB.Recordset")
  excStrConn="Driver={Microsoft Excel Driver (*.xls)};DriverId=790; DBQ="&Server.MapPath(excpath)
  excconn.Open excStrConn
  excSql="select * from ["&sheet&"$]"  '��ѯexcel���
  excrs.Open excSql,excconn,2,2
  set rs=server.createObject("ADODB.Recordset")
  sql="select * from [teacher_inf]"  '��ѯAccess��
  rs.open sql,conn,1,3
  do while Not excrs.EOF 
    rs.addnew
      for i=0 to excrs.Fields.Count-1
        rs(i+1)=excrs(i)
        next
    rs.update
    excrs.MoveNext
  Loop
  rs.close
  set rs=nothing
  excrs.close
  set excrs=nothing
  excConn.close
  set excConn=nothing
  conn.close
  set conn=nothing
response.write "<script language=javascript>"
response.write "alert('Excel���е������Ѿ��ɹ����뵽���ݿ��У�');"
response.write "location.href='student_Padd.asp';"
response.write "</script>"
End function
%>
<script language="JavaScript">
function check()
{
  if (daoruf.excelpath.value=="")
  {
   alert("������Excel���Ԥ��������·����\n���û���ϴ��������ϴ�Excel���ٲ�����");
  daoruf.excelpath.focus();
  return false;
  }
  if (daoruf.sheet.value=="")
  {
   alert("���������ݱ�����");
  daoruf.sheet.focus();
  return false;
  }
  return true;
}
</script>
<link rel="stylesheet" href="../js/CssAdmin.css">



<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap="nowrap"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle" />&nbsp;<strong>��ʦ�������������ʦ��Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap="nowrap"  bgcolor="#EBF2F9">
	<a href="teacher_list.asp" onclick='changeAdminFlag(&quot;ϵͳѧ��&quot;)'>�鿴��ʦ�б�</a>
    | <a href="teacher_add.asp?Result=Add" onclick='changeAdminFlag(&quot;���ѧ��&quot;)'>������ӽ�ʦ</a>
	|&nbsp;</font><a href="teacher_excel.asp" onclick='changeAdminFlag(&quot;�������н�ʦ��Ϣ&quot;)'>������ʦ��Ϣ</a>
	</td>
  </tr>
</table>
<form action="?action=daoru" method="post" name="daoruf" id="daoruf" onSubmit="return check();">
 <div align="left">
  <table width="100%" height="126" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#D5EBF4">
    <tr> 
      <td height="21" colspan="2" align="center">��<strong>��Excel���뿼����Ϣ�����ݿ�</strong>��</td>
    </tr>
    <tr> 
      <td width="200" height="60"><div align="right">�ϴ�Excel������������Ԥ����:</div></td>
      <td width="400"><iframe align=middle marginwidth=0 marginheight=0 src='upload/uploadexcel.asp' frameborder=no scrolling=no height=120></iframe>
      <br>
      Ԥ��������·����
      <input name="excelpath" type="text" id="excelpath" size="30">      </td>
    </tr>
    <tr> 
      <td height="20" width="200"><div align="right">���ݱ���:</div></td>
      <td>Excel ��ռ�����
        <input name="sheet" type="text" id="sheet" value="sheet1"> 
        ��:Sheet1��Excel��ռ�����</td>
    </tr>
    <tr align="center"> 
      <td height="23" colspan="2"><input type="submit" name="Submit" value="����Excel������Ϣ�����ݿ�">
                                  <input type="button" name="back" value="����" onClick="history.go(-1)"></td>
    </tr>
  </table>
  </div>
</form>

<p>ע�⣺
  <br />
����һ��
׼����ȷ��Excel���ݱ���<a target="_blank" href="upload/��ʦ��Ϣ��.xls"><font color="#FF0000">��׼��ʦ��Ϣ������</font></a>��<br />
����
����������ϴ�������������Ԥ����<br />����
����ָ�����ݱ�����Excel���Sheet����Ĭ��ΪSheet1 �����в�ͬ����޸ģ�<br />
�����ġ������ֶ�Ĭ������ admin ����</p>
