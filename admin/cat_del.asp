<!--#include file="IsAdmin.asp" -->
<!--#include file="conn.asp" -->

<html>
<head>
<title>Delete Category</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
<form name="form1" method="post" action="cat_del2.asp">
  <table border="1" cellspacing="0" width="346" bordercolor="#000000" cellpadding="2" align="center" style="margin:100px 0px 0px 50px;">
	<thead>
		<th colspan="2" bgcolor="#FFFFCC"  style="border:1px solid #000000;">
			Delete Category
		</th>
	</thead>
    <tr> 
      <td width="117" style="border:1px solid #000000;"> 
        <div style="margin:0 0 0 20px;" align="left">name£º</div>
      </td>
      <td width="211" style="border:1px solid #000000;"> 
        <div align="center">
		<%
		Response.Buffer = True 
		Response.ExpiresAbsolute = Now() - 1 
		Response.Expires = 0 
		Response.CacheControl = no-cache 
		dim action,id,sql
		dim rs
		dim i
		set rs =server.createobject("adodb.recordset")
		rs.open "select * from cat where rank <> '0'",conn
		if not rs.eof then
			%><select name="id"><%
			while not rs.eof 
				%>
				<option value="<%=rs("id")%>"><%=rs("name")%></option>
				<%
				rs.movenext
			wend
			%></select><%
		end if
		rs.close
		set rs = nothing
		conn.close
		set conn = nothing
		%>
		</div>
      </td>
    </tr>
    <tr> 
      <td style="border:1px solid #000000;margin:0 0 0 20px;" colspan="2"> 
        <input type="submit" value="done" />
      </td>
    </tr>

  </table>   
</form>


</body>
</html>