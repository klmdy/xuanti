<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" href="../js/CssAdmin.css">
<title>ѧ���б�</title></head>
<!--#include file="../inc/Conn.asp" -->
<!--#include file="CheckAdmin.asp"-->
<body>
<table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
  <tr>
    <td height="24"  ><font color="#FFFFFF"><img src="../Images/Explain.gif" width="18" height="18" border="0" align="absmiddle">&nbsp;<strong>ѧ��������ӣ��޸�ѧ����Ϣ</strong></font></td>
  </tr>
  <tr>
    <td height="24" align="center"    bgcolor="#EBF2F9">
	
	<form id="form1" name="form1" method="post" action="">
        ���꼶��
          <select name="Sp_id" id="Sp_id" size="1">
		  <option selected  value="">��ѡ���꼶</option>
		  <!-- <option value="2012">2012��</option>
        	<option value="2013">2013��</option>
			<option value="2014">2014��</option>
				  <option value="2015">2015��</option>
        	<option value="2016">2016��</option> -->
        	<%
			set rs=server.createobject("adodb.recordset")
			sql="select St_grade from student_info group by St_grade"
			rs.open sql,Conn,1,3
		%>
      <%do while not rs.eof%>
      <option value="<%=rs("St_grade")%>"><%=rs("St_grade")%></option>
      <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
		%>
            </select>
    ���༶��
    <select name="St_class" id="St_class" >
      <option value="">��ѡ��༶</option>
      <%    
			set rs=server.createobject("adodb.recordset")    
			sql="select St_class from student_info group by St_class"    
			rs.open sql,Conn,1,3
		%>
      <%do while not rs.eof%>
      <option value="<%=rs("St_class")%>"><%=rs("St_class")%></option>
      <%
				rs.movenext
				loop
				rs.close
				set rs = nothing
		%>
    </select>
    

    ��ѡ�������
          <select name="select_flag" id="select_flag" size="1">
		  <option selected value="">��ѡ��</option>
		  <option value=-1>��ѡ</option>
        	<option value=0>δѡ</option>
&nbsp;
      </select>

	��������
	<input name="St_name" type="text" id="St_name" size="12"   />

	<input type="submit" name="Submit" value=" �� �� " />
	��
	</form>
	
	
    </td>    
  </tr>
</table>
<br />
  <center>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#6298E1">
    <tr>
      <td   bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>ѧ��</strong></font></td>
      <td   bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td  bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>רҵ��</strong></font></td>
      <td   bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>�꼶</strong></font></td>
      <td   bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>�༶���ɵ�����</strong></font></td>
      <td   bgcolor="#8DB5E9"><strong><font color="#FFFFFF">�ֻ�����</font></strong></td>
      <td   bgcolor="#8DB5E9"><font color="#FFFFFF"><strong>����</strong></font></td>
      <td   bgcolor="#8DB5E9"><strong><font color="#FFFFFF">��ϸ��Ϣ</font></strong></td>
    </tr>
  <%
  		dim wh,Sp_id,St_class,St_name,select_flag
  		wh = ""
		Sp_id=request("Sp_id")
		St_class=request("St_class")
		St_name=request("St_name")
		select_flag=request("select_flag")
		if Sp_id <> "" then
			wh = " and st.St_grade = "&"'"&Sp_id&"' "
		end if
		if St_class <> "" then
			wh = wh&" and St_class = "&"'"&St_class&"' "
		end if
		if select_flag <> "" then
			wh = wh&" and select_flag = "&select_flag 
		end if
		if St_name <> "" then
			wh = wh&" and St_name like '%"&St_name&"%'"
		end if
		set rsobj=server.CreateObject("adodb.recordset")
		sql="Select * from Student_info st,speciality sp where st.Sp_id=sp.Sp_id "&wh&" order by st.ID desc"
		'response.Write(sql)

       'rsobj.open "select * from speciality",conn ,1,1
		rsobj.open sql,conn ,1,1
		page=cint(request.QueryString("txtpage"))
		rsobj.pagesize=25 '��ҳ��� ��/ҳ
		if page < 1 then page = 1
		if page > rsobj.pagecount then page = rsobj.pagecount

		if rsobj.eof = false then
		rsobj.absolutepage = page
		else
		response.Write"<strong>û���κμ�¼����</strong>"
		response.End()

		end if
		for i=1 to rsobj.pagesize
		if rsobj.eof then exit for
	%>
  <tr bgcolor="#FFFFFF" onmouseover="this.bgColor='f1f1f1'" onmouseout="this.bgColor='FFFFFF'">
    <td><%=rsobj("St_number")%></td>
    <td><%=rsobj("St_name")%></td>
    <td><%=rsobj("Sp_name")%></td>
    <td><%=rsobj("St_grade")%></td>
    <td style='cursor:hand' title="����<%=rsobj("St_class")%>��ѧ����Ϣ">
	<a href='student_table.asp?St_class=<%=rsobj("St_class")%>'><font color='#330099'>
	<%=rsobj("St_class")%></font></a>	</td>
    <td><%=rsobj("St_m_phone")%></td>
    <td><%=rsobj("St_email")%></td>
    <td><a href='student_add.asp?ID=<%=rsobj("st.ID")%>' onClick='changeAdminFlag("�޸�ѧ��")'><font color='#330099'>�鿴</font></a></td>
    </tr>
  <%
	rsobj.movenext
	next
  %>
</table>
<br />
<form method="get" action="">
  <div align="center">ÿҳ��ʾ<strong> <%=rsobj.pagesize%> </strong>�����ܼ�¼:<strong><%=rsobj.recordcount%></strong> ��			��ҳ��: <strong><%=rsobj.pagecount%></strong> ��Ŀǰҳ��:
    <input type="text" name="txtpage" value="<% =page %>" size="3" style="height:11px" />
��
  <%
		if page <> 1 then
		response.Write"<a href=student_list.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage=1>����һҳ��</a>"
		response.Write"<a href=student_list.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage="& (page-1)&">����һҳ��</a>"
		end if 
		if page<>rsobj.pagecount then
		response.Write"<a href=student_list.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage="& (page+1)&">����һҳ��</a>"
		response.Write"<a href=student_list.asp?Sp_id="&Sp_id&"&St_class="&St_class&"&txtpage="& rsobj.pagecount&">����ĩҳ��</a>"
		end if
		'�ر�����
		rsobj.close
		set rsobj=nothing
		cnobj.close
		set cnobj=nothing
	%>
  </div>
</form>

 <button onclick="selectSysLeft()">�� ��</button>
</center>
</body>

<script>
function selectSysLeft() {
    var devies = navigator.userAgent.toLowerCase();
             var ipad = devies.match(/ipad/i) == "ipad";
             var iphone = devies.match(/iphone os/i) == "iphone os";
             var midp = devies.match(/midp/i) == "midp";
             var uc7 = devies.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
             var uc = devies.match(/ucweb/i) == "ucweb";
             var android = devies.match(/android/i) == "android";
             var wince = devies.match(/windows ce/i) == "windows ce";
             var winphone = devies.match(/windows mobile/i) == "windows mobile";
             if (ipad || iphone || midp || uc7 || uc || android || wince || winphone) {
                 window.location.href="./SysLeft1.asp";
             } else {
                 window.location.href="./bnuzitc.asp";
             }
}
</script>
</html>
