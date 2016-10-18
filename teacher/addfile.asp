<%@ LANGUAGE = VBScript.Encode %>
<html>
<head>
<title>文件上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="home.css" rel=stylesheet>
</head>
<BODY bgcolor="#F6F6F6" leftMargin=0 topMargin=0>
</Script>

<form method="POST" action="file_add_db.asp" enctype="multipart/form-data" name=myform onsubmit="return validate()">
  <div align="center">
<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor=#000000 class=heading colSpan=2 height=3></TD></TR>
  <TR>
    <TD bgColor=#000000 class=heading>　<B><font color="#FFFF00">上报文件</font></B></TD>
    <TD align=right bgColor=#000000 class=heading height=20>　</TD></TR>
  <TR>
    <TD align=middle vAlign=top width=109></TD>
    <TD align=middle>
        <TABLE bgColor=#666666 border=0 cellPadding=1 cellSpacing=1 
        width="100%">                 
                                                                                                 
      <tr>                                                                                               
        <TD bgColor=#efefef height=25 width=60><b>&nbsp; 附件</b></TD>                                                                                                      
        <td height="25" bgcolor="#ffffFF"><input type="file" name="lianjie" size="20" class="smallInput"><font color="#FF0000"><br>                   
          (文件不得大于500K，文件传送前请最好进行压缩！)</font>&nbsp;<br>                                            
        </td>                                                                                             
      </tr>                                 
      <tr>                                 
        <TD bgColor=#efefef height=21 width=60><b>　</b></TD>                                                                                             
        <td height="21" bgcolor="#ffffFF">                               
          <p align="center"><input type="submit" value="开始上传" name="B1" class="buttonface "  IsShowProcessBar="True"></p>                              
          <p align="left"><font color="#FF0000">注：</font><font color="#FF0000"><br>
          &nbsp;&nbsp; 1、</font><font color="#FF0000">支持群发功能，但群发的文件不能由接收人删除，只能由发送人来删除。<br>
          &nbsp;&nbsp;&nbsp; 
          如向教务处教务主管向所有院系的系主任发送信息和文件，请在收件部门中选择<b>所有院系</b>，在收件人中选择<b>系主任</b>即可，该文件的删除则只能由教务处教务主管来删除。</font></p>                              
          <p align="left"><font color="#FF0000">&nbsp;&nbsp; 2、支持直接传送文件主题和“文件主题＋附件”两种传送方式；</font></p>                               
          <p align="left"><font color="#FF0000">&nbsp;&nbsp; 3、如果不选择文件传送，在附件栏中什么也不选择即可；</font><p align="left"><font color="#FF0000">&nbsp;&nbsp;         
          4、您能传送文件的部门和收件人在“收件部门”和收件人中自动显示，如果没有，则说明您没有此项权限！</font></td>                                                                                          
      </tr>                              
        </table>                                                                                          
    </td></tr></table>                                                                                          
  </div></form></body></html>