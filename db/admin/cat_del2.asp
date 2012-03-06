<!--#include file="IsAdmin.asp" -->
<!--#include file="conn.asp" -->

<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = no-cache 
dim action,id,sql
dim rs
dim i
id = trim(cstr(request("id")))
set rs =server.createobject("adodb.recordset")
rs.open "select * from cat where dncat like '%|"+id+"|%'",conn
if not rs.eof then
	response.Write("<script>alert('sorry£¬a menu named "+trim(cstr(rs("name")))+" has this menu which you want to delete at least,so you must remove it from this menu first£¡');history.back(-1);</script>")
	response.End()
else
	sql = "delete from cat where id = " & id
	conn.execute sql
	response.Write("<div style='margin:50px 0 0 200px;font-weight:bold;'>The menu has been deleted.</div>")
	response.End()
end if
rs.close
set rs = nothing
conn.close
set conn = nothing
%>
