<!--#include file="conn.asp" -->
<!--#include file="IsAdmin.asp" -->
<%	
response.buffer="true"
dim rs1
dim name,des,pic,rank
dim maxid
name=request("name")
des=request("des")
pic=request("pic")
rank=request("rank")

set rs1=server.createobject("adodb.recordset")
rs1.open "select * from cat where name='"&name&"'",conn
if not rs1.eof then
	response.write"<script>alert('Sorry£¬this name has been used£¡Please choose new name£¡');history.back(-1);</script>"
	response.end
end if
rs1.close

rs1.open "select max(id) as maxid from cat",conn
if not rs1.eof then
	maxid = trim(cstr(rs1("maxid")))+1
else
	maxid=1
end if
rs1.close

dim rs,sql,rs2
	set rs=server.createobject("adodb.recordset")
	set rs2=server.createobject("adodb.recordset")
	sql="select top 1 * from cat order by id "
	rs.open sql,conn,1,3
	if not rs.eof then
		rs.addnew
		rs("id")=maxid
		rs("name")=name
		rs("des")=des
		rs("pic")=pic
		rs("rank")=rank
		rs("dncat")="0"
		rs("p_id")="0"
		rs.update
		set rs1=nothing
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		response.redirect"cat_add_ok.asp"
	end if	 
%>