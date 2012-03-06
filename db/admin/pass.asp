<!--#include file="conn.asp"-->
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<%
dim rs
dim sql
dim username
dim password
dim data
username=request("username")
password=request("password")

if username = "" or password = "" then
	response.write("<br>"&"<p>")
	Response.Write "<center>User name or password is blank£¡Please Login Again£¡</center>"
	response.write "<center><a href='javascript:onclick=history.go(-1)'>Back</a></center>"  
end if

set rs=server.createobject("adodb.recordset")
rs.open "select * from users where user_name='"&username&"' and pwd='"&password&"'",conn
	if not(rs.bof and rs.eof) then
		if username=rs("user_name") and password=rs("pwd") then
			session("username")=username
			session("password")=password
			session("user")=username
			session("pass")=password
			session("admin_name")=username
			Response.Redirect "adminindex.asp"
		end if
	else 
		response.write("<br><p><p>")
		response.write"<center>User Name or Password Wrong,Plase try again£º</center><p>"
		response.write("<center><b><a href='admin_login.asp'>Back</a></b><center>")
	end if

%>
</body>
</html>
