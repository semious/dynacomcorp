<!--#include file="conn.asp"-->
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = no-cache 
dim action,id,sql
dim rs
dim flag
dim i
dim sub_array
dim msg
dim rs1
dim item_a
item_a = ""
msg=""
set rs =server.createobject("adodb.recordset")
set rs1 =server.createobject("adodb.recordset")
action=trim(cstr(request("action")))
id=trim(cstr(request("id")))

if action="" or id = "" then
	response.write("0")
	response.End()
end if

if action = "get" then
	rs.open "select * from cat where id=" & id,conn
	if rs.eof then
		response.End()
	else
		response.Write(cstr(rs("name"))+"|"+trim(cstr(rs("des")))+"|"+trim(cstr(rs("pic"))))
		response.End()
	end if
	rs.close
	response.End()
end if

if action = "update" then
	dim name,des,pic
	name=trim(cstr(request("name")))
	des=trim(cstr(request("des")))
	pic=trim(cstr(request("pic")))
	
	name=replace(name,"'","''")
	des=replace(des,"'","''")
	pic=replace(pic,"'","''")
	
	sql = "update cat set "
	sql = sql + "name='" + name +"'," 
	sql = sql + "des='" + des + "',"
	sql = sql + "pic='" + pic + "' "
	sql = sql + " where id = " & id 

	conn.execute sql
	
	response.Write("1")
	response.End()
end if

if action = "getsub" then
	rs.open "select * from cat where id="& id,conn
	if rs.eof then
		response.End()
	else
		if rs("dncat")<>"0" and rs("dncat")<>"" then
			sub_array = split(rs("dncat"),"|")
			rs.close
			for i= 1 to ubound(sub_array)-1
				rs.open "select * from cat where id = " & sub_array(i),conn
				if not rs.eof then
					msg = msg + cstr(rs("name")) + "|" + cstr(rs("id")) + "|"
				end if
				rs.close
			next 
			response.Write("1"+"@"+msg)
			response.End()
		end if
		
		if (rs("dncat")="0" or rs("dncat")="") and (rs("p_id")<>"0" and rs("p_id")<>"") then
			sub_array = split(rs("p_id"),"|")
			rs.close
			for i= 1 to ubound(sub_array)-1
				rs.open "select * from product where id = " & sub_array(i),conn
				if not rs.eof then
					msg = msg + cstr(rs("name")) + "|" + cstr(rs("id")) + "|"
				end if
				rs.close
			next 
			response.Write("2"+"@"+msg)
			response.End()
		end if
		
		if (rs("dncat")="0" or rs("dncat")="") and (rs("p_id")="0" or rs("p_id")="") then
			response.Write("0@0")
			response.End()
		end if
	end if
	rs.close
	response.End()
end if

if action = "getrank" then
	dim rank
	rs.open "select * from cat where id="& id &" order by name",conn
	if rs.eof then
		response.End()
	else
		if rs("rank")<3 then
			rank = cint(cstr(rs("rank")))+1
			rs.close
			rs.open "select * from cat where rank = '"+cstr(rank)+"' order by name"
			if not rs.eof then
				while not rs.eof
					if msg="" then
						msg = trim(cstr(rs("name"))) + "|" + trim(cstr(rs("id")))
					else
						msg = msg + "|" + trim(cstr(rs("name"))) + "|" + trim(cstr(rs("id")))
					end if
					rs.movenext
				wend
			end if
			rs.close
			response.Write(msg)
			response.End()
		else
			rs.close
			rs.open "select * from product order by name"
			if not rs.eof then
				while not rs.eof
					if msg="" then
						msg = trim(cstr(rs("name"))) + "|" + trim(cstr(rs("id")))
					else
						msg = msg + "|" + trim(cstr(rs("name"))) + "|" + trim(cstr(rs("id")))
					end if
					rs.movenext
				wend
			end if
			rs.close
			response.Write(msg)
			response.End()		
		end if
	end if
	rs.close
	response.End()
end if

if action = "updateadditem" then
	dim subi
	dim items
	flag=0
	subi=trim(cstr(request("subi")))
	rs.open "select * from cat where id = " & id,conn,1,3
	if not rs.eof then
		if rs("rank")<3 then
			items = split(cstr(rs("dncat")),"|")
			for i = lbound(items) to ubound(items)
				if trim(cstr(items(i))) = trim(cstr(subi)) then
					flag=1
					exit for
				end if 
			next
			if flag=0 then
				if rs("dncat")="" or rs("dncat") = "0" then
					rs("dncat") = "|"+subi+"|"
				else
					rs("dncat") = rs("dncat") + subi +"|"
				end if
				rs.update
				rs.close
				response.Write("1")
				response.End()
			else
				response.Write("1")
				response.End()
			end if
		else
			items = split(cstr(rs("p_id")),"|")
			for i = lbound(items) to ubound(items)
				if trim(cstr(items(i))) = trim(cstr(subi)) then
					flag=1
					exit for
				end if 
			next
			if flag = 0 then
				if rs("p_id")="" or rs("p_id")= "0"then
					rs("p_id") = "|"+subi+"|"
				else
					rs("p_id") = rs("p_id") + subi +"|"
				end if
				rs.update
				rs.close
				response.Write("1")
				response.End()
			else
				response.Write("1")
				response.End()
			end if
		end if
	end if
	rs.close
	response.End()
end if



if action = "updateitem" then
	flag=0
	subi=trim(cstr(request("subi")))
	rs.open "select * from cat where id=" & id,conn,1,3
	if not rs.eof then
		if rs("rank")<3 then
			items = split(cstr(rs("dncat")),"|")
			for i = lbound(items) to ubound(items)
				if trim(cstr(items(i))) = trim(cstr(subi)) then
					items(i)=""
					exit for
				end if 
			next
			for i = lbound(items) to ubound(items)
				if trim(cstr(items(i))) <> "" then
					item_a = item_a + "|" + items(i)
				end if 
			next
			
			if item_a = "" then
				item_a = "0"
			else
				item_a = item_a + "|"
			end if
			
			rs("dncat") = cstr(item_a)
			rs.update
			rs.close
			response.Write("1")
			response.End()
		else
			items = split(cstr(rs("p_id")),"|")
			for i = lbound(items) to ubound(items)
				if trim(cstr(items(i))) = trim(cstr(subi)) then
					items(i)=""
					exit for
				end if 
			next
			for i = lbound(items) to ubound(items)
				if trim(cstr(items(i))) <> "" then
					item_a = item_a + "|" + items(i)
				end if 
			next
			if item_a = "" then
				item_a = "0"
			else
				item_a = item_a + "|"
			end if
			rs("p_id") = cstr(item_a)
			rs.update
			rs.close
			response.Write("1")
			response.End()
		end if
	end if
	rs.close
	response.End()
end if

if action = "getitem" then
	rs.open "select * from cat where id = " & id,conn
	if rs.eof then
		response.End()
	else
		if rs("rank")<3 then
			rs.close
			rs.open "select * from cat where id = " & cstr(id)
			if not rs.eof then
				if rs("dncat")<>"" and rs("dncat")<>"0" then
					sub_array = split(rs("dncat"),"|")
					for i = 1 to ubound(sub_array)-1
						rs1.open "select * from cat where id=" & cstr(sub_array(i)),conn
							if not rs1.eof then
								if msg = "" then
									msg = trim(cstr(rs1("name"))) + "|" + trim(cstr(rs1("id")))
								else
									msg = msg + "|" + trim(cstr(rs1("name"))) + "|" + trim(cstr(rs1("id")))
								end if
							end if
						rs1.close
					next
				else
					response.Write("0")
					response.End()
				end if
			end if
			rs.close
			response.Write(msg)
			response.End()
		else
			rs.close
			rs.open "select * from cat where id = " & cstr(id)
			if not rs.eof then
				if rs("p_id")<>"" and rs("p_id")<>"0" then
					sub_array = split(rs("p_id"),"|")
					for i = 1 to ubound(sub_array)-1
						rs1.open "select * from product where id = " & cstr(sub_array(i)),conn
							if not rs1.eof then
								if msg = "" then
									msg = trim(cstr(rs1("name"))) + "|" + trim(cstr(rs1("id")))
								else
									msg = msg + "|" + trim(cstr(rs1("name"))) + "|" + trim(cstr(rs1("id")))
								end if
							end if
						rs1.close
					next
				else
					response.Write("0")
					response.End()
				end if
			end if
			rs.close
			response.Write(msg)
			response.End()		
		end if
	end if
	rs.close
	response.End()
end if


%>
