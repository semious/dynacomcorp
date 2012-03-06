<%@ language="vbscript"%>
<!--#include file="conn.asp"-->
<!--#include file="IsAdmin.asp"-->
<%response.buffer=true
dim mz,qx
mz=session("admin_name")
qx=session("password")
dim username,password
password=request("pass")
password1=request("pass1")

dim rs
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select pwd from users where user_name='"&mz&"'",conn,1,3
if rs.bof or rs.eof then
	response.write "Administrator Information Wrong,please login again!<br><br>"
	response.write "<a href='admin_login.asp'>Back</a>" 
	response.end
end if
if password<>password1  or password="" or password1="" then
	response.write"<script>alert('two password are not the same,please input again£¡');history.back(-1);</script>"
else
	rs("pwd")=password
    rs.update
    rs.close
	response.write "<script>alert('Password Updated!')</script>"
end if		 
%>