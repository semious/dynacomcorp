

<%
if session("user_name")="" and session("password")="" then
response.write "Please Login!!! <br><br>"
response.redirect "admin_login.asp" 
response.end
end if
%>

<html>
<head>
<title>View Stores</title>
<link rel="stylesheet" href="css/style.css" type="text/css">

</head>

<body>

<div style="margin:100px 0 0 175px;"><B><FONT COLOR="#FF0033" size="4">Search Store</FONT></B><br /><p></div>
<table width="300" border="1" cellspacing="0" cellpadding="1" style="margin:25px 0 0 100px;" bordercolor="#000000">
 	<tr align="right"> 
		<td height="127"><br />
			<form action="store_inquire.asp" method="post" /> 
				<table>
					<tr>
						<td>store name:</td>
						<td><input type=text size="15" name="name" /></td>
					</tr>
					<tr>
						<td>zone:</td>
						<td><input type=text size=15 name="zone" /></td>
					<tr>
					<tr height="40">
						<td><input type="submit" value="search" /></td>
						<td><input type="reset" value="reset" name="reset" /></td>
				</table>   
			</form>
		</td>
	</tr> 
</table>
</body>
</html>
