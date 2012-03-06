<!--#include file="conn.asp" -->
<!--#include file="IsAdmin.asp" -->
<%	
dim rs1
dim name,pic,address,tel,zone,address1,address2
dim maxid
dim edit,id
edit=trim(cstr(request("action")))
id=cstr(request("id"))
name=trim(cstr(request("name")))
pic=trim(cstr(request("pic")))
address=trim(cstr(request("address")))
address1=trim(cstr(request("address1")))
address2=trim(cstr(request("address2")))
tel=trim(cstr(request("tel")))
zone=trim(cstr(request("zone")))

set rs1=server.createobject("adodb.recordset")
dim rs,sql,rs2
set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")


if name="" then
	response.Write("<script>alert('sorry£¬you must input name ');history.back(-1);</script>")
	response.End()
end if


if address="" then
	response.Write("<script>alert('sorry£¬you must input address ');history.back(-1);</script>")
	response.End()
end if


if pic="" then
	response.Write("<script>alert('sorry£¬you must input picture ');history.back(-1);</script>")
	response.End()
end if

if tel="" then
	response.Write("<script>alert('sorry£¬you must input telepone ');history.back(-1);</script>")
	response.End()
end if

if zone="" then
	response.Write("<script>alert('sorry£¬you must input zone ');history.back(-1);</script>")
	response.End()
end if


if edit = "editsave" then
	rs1.open "select * from product where name='"+name+"' and id <> '"+id+"'",conn
	if not rs1.eof then
		response.write"<script>alert('Sorry£¬the name has been used£¡Please choose another name£¡');history.back(-1);</script>"
		response.end
	end if
	rs1.close
		
	name=replace(name,"'","''")
	address=replace(address,"'","''")
	address1=replace(address1,"'","''")
	address2=replace(address2,"'","''")
	pic=replace(pic,"'","''")
	tel=replace(tel,"'","''")
	zone=replace(zone,"'","''")
	
	sql = "update distributor set "
	sql = sql + "name='" + name +"'," 
	sql = sql + "address='" + address + "',"
	sql = sql + "pic='" + pic + "',"
	sql = sql + "address1='" + address1 + "',"
	sql = sql + "address2='" + address2 + "',"
	sql = sql + "tel='" + tel +"'," 
	sql = sql + "[zone]='" + zone + "' "
	sql = sql + " where id = " & id

	conn.execute sql
	response.Write("<script>alert('Update Ok');location.href='store_edit.asp?action=edit&id="+id+"'</script>")
	response.end 
end if


rs1.open "select * from distributor where name='"&name&"'",conn
if not rs1.eof then
	response.write"<script>alert('sorry£¬the name has been used£¡Please choose another name£¡');history.back(-1);</script>"
	response.end
end if
rs1.close

rs1.open "select max(id) as maxid from distributor",conn
if not rs1.eof then
	maxid = trim(cstr(rs1("maxid")))+1
else
	maxid = 1
end if
rs1.close


	sql="select top 1 * from distributor"
	rs.open sql,conn,1,3
	if not rs.eof then
		rs.addnew
		rs("id")=maxid
		rs("name")=name
		rs("address")=address
		rs("address1")=address1
		rs("address2")=address2
		rs("pic")=pic
		rs("tel")=tel
		rs("zone")=zone
		rs.update
		set rs1=nothing
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		response.redirect"store_add_ok.asp"
	end if		 
%>