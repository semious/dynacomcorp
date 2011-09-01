<!--#include file="conn.asp" -->
<!--#include file="IsAdmin.asp" -->
<%	
response.buffer="true"
dim rs1
dim username,password,password1,question,answer
dim maxid
username=request("username")
password=request("password")
password1=request("password1")
question=request("question")
answer=request("answer")

set rs1=server.createobject("adodb.recordset")
rs1.open "select * from users where user_name='"&username&"'",conn
if not rs1.eof then
	response.write"<script>alert('Sorry£¬this user name has been used£¡Please choose new user name£¡');history.back(-1);</script>"
	response.end
end if
rs1.close

rs1.open "select max(id) as maxid from users",conn
if not rs1.eof then
	maxid = trim(cstr(rs1("maxid")))+1
else
	maxid=1
end if
rs1.close



dim rs,sql,rs2
	set rs=server.createobject("adodb.recordset")
	set rs2=server.createobject("adodb.recordset")
	sql="select top 1 * from users order by id "
	rs.open sql,conn,1,3
	if not rs.eof then
		rs.addnew
		rs("id")=maxid
		rs("user_name")=username
		rs("pwd")=password
		rs("question")=question
		rs("answer")=answer
		rs.update
		Response.cookies("user_name")=username
		Response.cookies("password")=password
		set rs1=nothing
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		response.redirect"addok.asp"
	end if	 
%>