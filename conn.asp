<%
	dim conn   
	dim connstr   
	connstr = "Data Source=tcp:s01.winhost.com;Initial Catalog=DB_15838_dynacom;User ID=DB_15838_dynacom_user;Password=dynac0md3vdb2010;Integrated Security=False;"
	
	set conn=server.createobject("ADODB.CONNECTION")
	conn.Open "Provider=SQLOLEDB;Data Source=tcp:s01.winhost.com;" _
            & "Initial Catalog=DB_15838_dynacom;User Id=DB_15838_dynacom_user;Password=dynac0md3vdb2010;" _
            & "Connect Timeout=15;"
%>