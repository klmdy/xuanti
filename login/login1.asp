<!--#include file="../inc/Conn.asp" -->
<!--#include file="../inc/Md5.asp" -->
<%
	login_user_no=trim(request.form("user_no"))
	login_user_pass=Md5(request.form("user_pass"))
	login_u_type=request.form("u_type")
	'��������Ա
		if login_u_type=4 then
    		set rs = server.createobject("adodb.recordset")
    		sql="select * from user_table where U_t_id='4' and(user_name='"&login_user_no&"' or user_no='"&login_user_no&"')"
    		'response.Write(sql)
    		rs.open sql,conn,1,1
    		if rs.bof and rs.eof then
    		   response.Write("<script>alert('�û������ڻ��û����������뷵�ء���');history.back()</script>")
    		   response.end
            else
             user_no=trim(rs("user_no"))
             user_pass=rs("user_pass")
             u_type=4
             user_name=rs("user_name")
            end if

    		if login_user_pass<>user_pass then
    		   response.Write("<script>alert('��������뷵�ء���');history.back()</script>")
    		   response.end
    		end if
    	end if

	'ϵ����
	if login_u_type=1  then
		set rs = server.createobject("adodb.recordset")
		sql="select * from user_table where U_t_id='1' and (user_name='"&login_user_no&"' or user_no='"&login_user_no&"')  "
		'response.Write(sql)
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
		   response.Write("<script>alert('�û������ڻ��û����������뷵�ء���');history.back()</script>")
		   response.end
        else
         user_no=trim(rs("user_no"))
         user_pass=rs("user_pass")
         u_type=1
         user_name=rs("user_name")
        end if

		if login_user_pass<>user_pass then
		   response.Write("<script>alert('��������뷵�ء���');history.back()</script>")
		   response.end
		end if
	end if



	'��ʦ��¼
	if login_u_type=2 then
		set rs = server.createobject("adodb.recordset")
		sql="select * from teacher_inf where Tea_id='"&login_user_no&"' or Tea_name='"&login_user_no&"'"
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
		   response.Write("<script>alert('�û������ڻ��û����������뷵�ء���');history.back()</script>")
		   response.end
		else
		   user_no=trim(rs("Tea_id"))
		   user_pass=rs("Tea_pass")
		   u_type=2
		   user_name=rs("Tea_name")
		end if
		if login_user_pass<>user_pass then
		   response.Write("<script>alert('��������뷵�ء���');history.back()</script>")
		   response.end
		end if
	end if

	'ѧ����¼
	if login_u_type=3 then
		set rs = server.createobject("adodb.recordset")
		sql="select * from student_info where St_number='"&login_user_no&"' or st_name='"&login_user_no&"'"
		rs.open sql,conn,1,1
		if rs.bof and rs.eof then
		   response.Write("<script>alert('�û������ڻ��û����������뷵�ء���');history.back()</script>")
		   response.end
		else

		   if rs("St_agree") = false then
		     response.Write("<script>alert('��ע���û�еõ���׼����׼ͨ�������е�¼���뷵�ء���');history.back()</script>")
		     response.end
		   else

		   user_no=trim(rs("St_number"))
		   user_pass=rs("st_pass")
		   u_type=3
		   user_name=rs("St_name")
		   session("sp_id")=rs("sp_id")
		   Session("studentname")=rs("St_name")
		   Session("studentnumber")=rs("St_number")
		    Session("studentgrade")=rs("St_grade")
		    Session("studentselect")=rs("allow_flag")
                    Session("studentagree")=rs("St_agree")
		     Session("studentcollege")="��Ϣ����ѧԺ"

		  end if
	end if
		if login_user_pass<>user_pass then
		   response.Write("<script>alert('��������뷵�ء���');history.back()</script>")
		   response.end
		end if
	end if


	'��¼�ɹ�����¼��־
	'if login_user_no=user_no and login_user_pass=user_pass then
	   session("u_type")=u_type
	   session("user_name")=user_name
	   session("user_no")=user_no
	   '��־���������  20061123 00000001
		a=year(date)
		b=month(date)
		d=day(date)
		if b>=1 and b<=9 then
		   b="0"&b
		end if
		if d>=1 and d<=9 then
		   d="0"&d
		end if
		c=cstr(a&b&d)
		dim rs2,sql2
		set rs2=server.CreateObject("adodb.recordset")
		sql2="select count(*) as num from rz_table where note_id like '"&c&"%'"
		rs2.open sql2,conn,1,1
		if rs2("num")=0 then
		   note_id=c&"0001"
		   rs2.close
		else
		   rs2.close
		   sql2="select top 1 * from rz_table where note_id like '"&c&"%' order by note_id desc"
		   rs2.open sql2,conn,1,1
		   note_id=rs2("note_id")+1
		   rs2.close
		end if

	   '��¼��־
	   set rso = server.createobject("adodb.recordset")
		sql3="select * from rz_table"
		rso.open sql3,conn,1,3
		rso.addnew
		rso("note_id")=note_id
		rso("user_id")=user_no
		rso("option0")="�û���¼"
		rso("op_time")=now()
		rso("login_ip")= Request.ServerVariables("Remote_Addr")
		rso("user_name")=user_name
		rso.update
		rs.close
		set rs = nothing
		rso.close
		set rso=nothing
	    session("MemLogin")="Succeed"

	   if u_type=1 or u_type=4 then
	   	     response.redirect "../admin/bnuzitc1.asp"
		end if

		if u_type=2 then
	   		response.redirect "../teacher/bnuzitc1.asp"
		end if
		if u_type=3 then
	   		response.redirect "../student/bnuzitc1.asp"
		end if

	   response.end
	'end if
%>