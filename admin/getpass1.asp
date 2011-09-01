<!--#include file="conn.asp"-->
<%
dim rs
dim username
username=request.form("username")
session("username")=username
set rs=server.createObject("Adodb.Recordset")
rs.open "select * from users where user_name='"&username&"'",conn

If rs.eof Then
	response.write "<br><br><div style='text-align:center'> No such name!!! <br><br>"
	response.write "<a href='admin_login.asp'>Back</a></div>" 
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	response.end
End If
%>
<html>
<head>

<title>Forget password</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<BODY marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">

<div style="margin:150px;"><table width="40%" border="1" cellspacing="1" cellpadding="1" align="center" bordercolor="#000000">
	<thead>
	<th style="color:#CC0000; background-color:#FFFFCC; font-size:20px; border:0px;">Password Recovery Second Step:</th>
	</thead>
  <tr valign="top" align="center"> 
    <td height="127">
      <form name="form1" method="post" action="getpass2.asp">
        <br>
        Please answer this question:<br /><%=rs("question")%><p>
        Your answer:<input type="text" name="ok" size="16" maxlength="16"><p>
        <input type="submit" name="Submit" value="Next">
      </form>
    </td>
  </tr>
</table>
</div> 
<%
rs.close
set rs=nothing
conn.close
set conn=nothing

%>
</body>
</html>
