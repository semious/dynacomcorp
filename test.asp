<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp" -->
<%
	dim rs1
	Set rs1 = Server.CreateObject("ADODB.Recordset")	
	rs1.open "select [zone] from distributor" ,conn
%>
