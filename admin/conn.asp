<%
	dim conn   
	dim connstr
	connstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("..\db\dynacom.mdb")
	set conn=server.createobject("ADODB.CONNECTION")
	if err.number<>0 then 
		err.clear
		set conn=nothing
		response.write "数据库连接出错！"
		Response.End
	else
		conn.open connstr
		if err then 
			err.clear
			set conn=nothing
			response.write "数据库连接出错！"
			Response.End 
		end if
	end if   
	sub endConnection()
		conn.close
		set conn=nothing
	end sub
%>
