<%
	dim conn   
	dim connstr   
	'connstr = "Data Source=tcp:s01.winhost.com;Initial Catalog=DB_15838_dynacom;User ID=DB_15838_dynacom_user;Password=dynac0md3vdb2010;Integrated Security=False;"
	connstr = "PROVIDER=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("db\dynacom.mdb")
	'connstr = "Driver={Microsoft Access Driver (*.mdb)};DBQ=" & Server.MapPath("db\dynacom.mdb")
'response.write(connstr)
	set conn=server.createobject("ADODB.CONNECTION")
	'conn.Open "Provider=SQLOLEDB;Data Source=tcp:s01.winhost.com;" _
    '        & "Initial Catalog=DB_15838_dynacom;User Id=DB_15838_dynacom_user;Password=dynac0md3vdb2010;" _
    '        & "Connect Timeout=15;"
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
%>
