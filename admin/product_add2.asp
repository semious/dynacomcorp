<!--#include file="conn.asp" -->
<!--#include file="IsAdmin.asp" -->
<%	
dim rs1
dim name,des,pic1,pic2,pic3,pic4,pic5,pic6,intro,pq,video,pdf,bk,pr,al,bl,gn,gy,iv,orange,rd,wh,yl,menu1,menu2,menu3,menu4,color,s_des
dim maxid
dim edit,id
edit=trim(cstr(request("action")))
id=cstr(request("id"))
name=trim(cstr(request("name")))
des=trim(cstr(request("des")))
s_des=trim(cstr(request("s_des")))
pic1=trim(cstr(request("pic1")))
pic2=trim(cstr(request("pic2")))
pic3=trim(cstr(request("pic3")))
pic4=trim(cstr(request("pic4")))
pic5=trim(cstr(request("pic5")))
pic6=trim(cstr(request("pic6")))
intro=trim(cstr(request("intro")))
pq=trim(cstr(request("pq")))
video=trim(cstr(request("video")))
pdf=trim(cstr(request("pdf")))
bk=trim(cstr(request("bk")))
wh=trim(cstr(request("wh")))
pr=trim(cstr(request("pr")))
al=trim(cstr(request("al")))
bl=trim(cstr(request("bl")))
gn=trim(cstr(request("gn")))
gy=trim(cstr(request("gy")))
iv=trim(cstr(request("iv")))
orange=trim(cstr(request("orange")))
rd=trim(cstr(request("rd")))
yl=trim(cstr(request("yl")))
menu1=trim(cstr(request("menu1"))) 
menu2=trim(cstr(request("menu2")))
menu3=trim(cstr(request("menu3")))
menu4=trim(cstr(request("menu4")))

set rs1=server.createobject("adodb.recordset")
dim rs,sql,rs2
set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")

color="|"+bk+"|"+wh+"|"+al+"|"+bl+"|"+gn+"|"+gy+"|"+iv+"|"+orange+"|"+rd+"|"+yl+"|"+pr+"|"

if name="" then
	response.Write("<script>alert('sorry£¬you must input name ');history.back(-1);</script>")
	response.End()
end if

if des="" then
	response.Write("<script>alert('sorry£¬you must input description ');history.back(-1);</script>")
	response.End()
end if

if pic1="" then
	response.Write("<script>alert('sorry£¬you must input a picture at least');history.back(-1);</script>")
	response.End()
end if

if pdf="" then
	response.Write("<script>alert('sorry£¬you must input pdf name ');history.back(-1);</script>")
	response.End()
end if

if edit = "editsave" then
	name=replace(name,"'","''")
	des=replace(des,"'","''")
	s_des=replace(s_des,"'","''")
	intro=replace(intro,"'","''")
	color=replace(color,"'","''")
	video=replace(video,"'","''")
	pq=replace(pq,"'","''")
	pdf=replace(pdf,"'","''")


	rs1.open "select * from product where name='"+name+"' and id <> "+id+"",conn
	if not rs1.eof then
		response.write"<script>alert('sorry£¬the name has been used£¡Please choose another name£¡');history.back(-1);</script>"
		response.end
	end if
	rs1.close
	
	rs1.open "select * from product where des='"+escape(des)+"' and id <> "+id+"",conn
	if not rs1.eof then
		response.write"<script>alert('soory£¬the description has been used£¡Please choose another description£¡');history.back(-1);</script>"
		response.end
	end if
	rs1.close

	rs1.open "select * from product where pdf='"+pdf+"' and id <> "+id+"",conn
	if not rs1.eof then
		response.write"<script>alert('soory£¬the pdf name has been used£¡Please choose another pdf name£¡');history.back(-1);</script>"
		response.end
	end if
	rs1.close

	sql = "update product set "
	sql = sql + "name='" + name +"'," 
	sql = sql + "des='" + des + "',"
	sql = sql + "s_des='" + s_des + "',"	
	sql = sql + "pic1='" + pic1 + "',"
	sql = sql + "pic2='" + pic2 +"'," 
	sql = sql + "pic3='" + pic3 + "',"
	sql = sql + "pic4='" + pic4 + "',"
	sql = sql + "pic5='" + pic5 +"'," 
	sql = sql + "pic6='" + pic6 +"'," 
	sql = sql + "intro='" + "<pre>" +intro +"</pre>'," 
	sql = sql + "color='" + color +"'," 
	sql = sql + "pq='" + pq +"',"
	sql = sql + "video='" + video +"',"
	sql = sql + "pdf='" +  pdf +"'," 
	sql = sql + "menu1='" + menu1 +"'," 
	sql = sql + "menu2='" + menu2 +"'," 
	sql = sql + "menu3='" + menu3 +"'," 
	sql = sql + "menu4='" + menu4 +"'" 
	sql = sql + " where id = " + id + ""

	conn.execute sql
	response.Write("<script>alert('Update Ok');location.href='product_edit.asp?action=edit&id="+id+"'</script>")
	response.end 
end if


rs1.open "select * from product where name='"&replace(name,"'","''")&"'",conn
if not rs1.eof then
	response.write"<script>alert('sorry£¬the name has been used£¡Please choose another name£¡');history.back(-1);</script>"
	response.end
end if
rs1.close

rs1.open "select * from product where des='"&replace(des,"'","''")&"'",conn
if not rs1.eof then
	response.write"<script>alert('soory£¬the description has been used£¡Please choose another description£¡');history.back(-1);</script>"
	response.end
end if
rs1.close

rs1.open "select * from product where s_des='"&replace(s_des,"'","''")&"'",conn
if not rs1.eof then
	response.write"<script>alert('soory£¬the short description has been used£¡Please choose another description£¡');history.back(-1);</script>"
	response.end
end if
rs1.close


rs1.open "select max(id) as maxid from product",conn
if not rs1.eof then
	maxid = trim(cstr(rs1("maxid")))+1
else
	maxid = 1
end if
rs1.close


	sql="select top 1 * from product"
	rs.open sql,conn,1,3
	if not rs.eof then
		rs.addnew
		rs("id")=maxid
		rs("name")=name
		rs("des")=des
		rs("s_des")=s_des
		rs("pic1")=pic1
		rs("pic2")=pic2
		rs("pic3")=pic3
		rs("pic4")=pic4
		rs("pic5")=pic5
		rs("pic6")=pic6
		rs("intro")="<pre>"+intro+"</pre>"
		rs("pq")=pq
		rs("video")=video
		rs("color")=color
		rs("pdf")=pdf
		rs("menu1")=menu1
		rs("menu2")=menu2
		rs("menu3")=menu3
		rs("menu4")=menu4
		rs.update
		set rs1=nothing
		rs.close
		set rs=nothing
		conn.close
		set conn=nothing
		response.redirect"product_add_ok.asp"
	end if		 
%>