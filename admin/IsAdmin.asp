<%
if session("admin_name")="" and session("password")="" then
	response.write "<center><br><br>Authorized expired,please logout and login again!<br><br></center>"
	response.end
end if
%>