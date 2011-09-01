<%
Dim cnnSimple  ' ADO connection
Dim rstSimple  ' ADO recordset
Set cnnSimple = Server.CreateObject("ADODB.Connection")
' DSNLess
cnnSimple.Open "Provider=SQLOLEDB;Data Source=tcp:s01.winhost.com;" _
            & "Initial Catalog=DB_15838_dynacom;User Id=DB_15838_dynacom_user;Password=dynac0md3vdb2010;" _
            & "Connect Timeout=15;"
Set rstSimple = cnnSimple.Execute("SELECT * FROM sysfiles")
%>
<P> Connecting to SQL DB with DSNless connection </P>
<table border="1">
<%
Do While Not rstSimple.EOF
            %>
            <tr>
                        <td><%= rstSimple.Fields(1).Value %></td>
                        <td><%= rstSimple.Fields(2).Value %></td>
            </tr>
            <%
            rstSimple.MoveNext
Loop
%>
</table>
<%
rstSimple.Close
Set rstSimple = Nothing
cnnSimple.Close
Set cnnSimple = Nothing
%>