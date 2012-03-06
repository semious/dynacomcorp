

<%
if session("user_name")="" and session("password")="" then
response.write "Please Login!!! <br><br>"
response.redirect "admin_login.asp" 
response.end
end if
%>

<html>
<head>
<title>View Products</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css/style.css" type="text/css">

</head>

<body>

<div style="margin:100px 0 0 175px;"><B><FONT COLOR="#FF0033" size="4">Search Product</FONT></B><br /><p></div>
<table width="300" border="1" cellspacing="0" cellpadding="1" style="margin:25px 0 0 100px;" bordercolor="#000000">
 	<tr align="center"> 
		<td height="127"><br />
			<form action="product_inquire.asp" method="post" /> 
				<p align="center" style="line-height: 200%">
				part_number：<input type=text size="15" name="name" /><p>
				description：<input type=text size=15 name="des" />
				<p align="center" style="line-height: 200%">
				<input type="submit" value="search" />&nbsp;&nbsp;&nbsp;&nbsp;    
				<input type="reset" value="reset" name="reset" />     
			</form>
		</td>
	</tr> 
</table>
</body>
</html>
