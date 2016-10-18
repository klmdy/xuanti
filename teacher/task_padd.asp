<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
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
  excSql="select * from ["&sheet&"$]"  '查询excel语句
  excrs.Open excSql,excconn,2,2
  set rs=server.createObject("ADODB.Recordset")
  sql="select * from [select_cursor]"
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
response.write "alert('Excel表中的数据已经成功导入到数据库中！');"
response.write "location.href='task_Padd.asp';"
response.write "</script>"
End function
%>
<script language="JavaScript">
function check()
{
  if (daoruf.excelpath.value=="")
  {
   alert("请输入Excel表的预处理数据路径！\n如果没有上传，请先上传Excel表再操作！");
  daoruf.excelpath.focus();
  return false;
  }
  if (daoruf.sheet.value=="")
  {
   alert("请输入数据表名！");
  daoruf.sheet.focus();
  return false;
  }
  return true;
}
</script>
<link rel="stylesheet" href="../js/CssAdmin.css">



<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24" nowrap="nowrap"><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle" />&nbsp;<strong>选题管理：批量导入选题信息</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center" nowrap="nowrap"  bgcolor="#EBF2F9">
	<a href="task_list.asp" onclick='changeAdminFlag(&quot;系统学生&quot;)'>查看所有选题</a>
    | <a href="task_add.asp?Result=Add" onclick='changeAdminFlag(&quot;添加学生&quot;)'>单个添加选题</a>
	|&nbsp;</font><a href="task_excel.asp" onclick='changeAdminFlag(&quot;导出所有学生信息&quot;)'>导出选题信息</a></td>
  </tr>
</table>
<form action="?action=daoru" method="post" name="daoruf" id="daoruf" onSubmit="return check();">
 <div align="left">
  <table width="100%" height="126" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#D5EBF4">
    <tr> 
      <td height="21" colspan="2" align="center">【<strong>从Excel表导入考生信息到数据库</strong>】</td>
    </tr>
    <tr> 
      <td width="200" height="60"><div align="right">上传Excel表至服务器并预处理:</div></td>
      <td width="400"><iframe align=middle marginwidth=0 marginheight=0 src='upload/uploadexcel.asp' frameborder=no width=500 scrolling=no height=120></iframe>
      <br>
      预处理数据路径：
      <input name="excelpath" type="text" id="excelpath" size="30">      </td>
    </tr>
    <tr> 
      <td height="20" width="200"><div align="right">数据表名:</div></td>
      <td>Excel 表空间名：
        <input name="sheet" type="text" id="sheet" value="sheet1"> 
        如:Sheet1（Excel表空间名）</td>
    </tr>
    <tr align="center"> 
      <td height="23" colspan="2"><input type="submit" name="Submit" value="导入Excel表中信息到数据库">
                                  <input type="button" name="back" value="返回" onClick="history.go(-1)"></td>
    </tr>
  </table>
  </div>
</form>

<p>注意：
  <br />
　　一、
准备正确的Excel数据表。（<a target="_blank" href="upload/&#26631;&#20934;&#36873;&#39064;&#20449;&#24687;&#34920;.xls"><font color="#FF0000">标准选题信息表下载</font></a>）<br />　　
二、浏览并上传到服务器进行预处理。<br />　　
三、指定数据表名（Excel表的Sheet名，默认为Sheet1 ，如有不同务必修改）<br />
</p>
