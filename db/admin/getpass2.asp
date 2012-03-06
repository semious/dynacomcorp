<!--#include file="conn.asp"-->
<%
response.buffer="true"
dim username
username=session("username")
dim ok
dim rs
ok=request.form("ok")
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from users where user_name='"&username&"'",conn

If rs.eof Then
	response.write "<br><br><div style='text-align:center'> No such name!!! <br><br>"
	response.write "<a href='admin_login.asp'>Back</a></div>" 
	response.end
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
End If
if ok<>rs("answer") then 
	response.write "<br><br><div style='text-align:center'> Answer Wrong!!! Try Again <br><br>"
	response.write "<a href='admin_login.asp'>Back</a></div>" 
	response.end
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
End If
%>
<html>
<head>
<title>Forget Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="inc/style1.css" type="text/css">
</head>

<BODY marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">

<div style="margin:150px;"><table width="40%" border="1" cellspacing="1" cellpadding="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000">
	<thead>
	<th style="color:#CC0000; background-color:#FFFFCC; font-size:20px; border:0px;">Password Recovery Third Step:</th>
	</thead>
  <tr valign="top" align="center"> 
    <td height="127">
        Your Password is<br /><b><font color="#FF0000"><%=rs("pwd")%></font></b><p>
        Please don't forget your password again!<p>
		<a href='admin_login.asp'>Back</a>
    </td>
  </tr>
</table>
</div> 

<%rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
