<!--#include file="IsAdmin.asp"-->
<%
if session("username")="" and session("password")="" then
response.write "You haven't logged in，please login!!! <br><br>"
response.write "<a href='admin_login.asp'>Back</a>" 
response.end
end if
%>
<html>
<head>
<title>Change Administrator Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css/style.css" type="text/css">

</head>
<body marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
<form action="admin_edit_pwd.asp" method="post">
 	<table width="346" border="1" CELLSPACING="0" CELLPADDING="2" ALIGN="CENTER" bordercolor="#000000" style="margin:100px 0 0 0;">
		<thead>
			<th colspan="2" bgcolor="#FFFFCC"  style="border:0px;">
				Administrator Password Change
			</th>
		</thead>
		<tr>
			<td height="21" style="border:0px;">
				<div align="center">New Password：</div>
			</td>
			<td style="border:0px;">
				<div align="center"><input type="password" size="14" name="pass"></div>
			</td>
		</tr>
		<tr>
			<td height="21" style="border:0px 0px 0px 0px;">
				<div align="center">Password reconfirm：</div>
			</td>
			<td style="border:0px;">
				<div align="center"><input type="password" size="14" name="pass1"></div>
			</td>
		</tr>
		<tr height="40">
			<td style="border:0px;">
				<div align="center"><input type=submit value="done"></div>
			</td>
			<td style="border:0px;">
				<div align="center"><input type=reset value="reset" name="reset"></div>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
