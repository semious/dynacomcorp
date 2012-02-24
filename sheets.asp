<!--#include file="conn_access.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
Dynacom - Affordable Quailty Network Cabling Products
</title>
<meta name="keywords" content="Dynacom, Wire Management, 110 Cross Connect, Wire, Management, 110, Cross-connect, cross, connect, connections, wire, management, backboard management, residential cabeling, structured wiring, home network management, structured cabling">
<meta name="description" content="Dynacom, is a manufacturer of Wire Management, 110 Cross Connect, Wire, Management, 110, Cross-connect, wire management, backboard management, residential cabling, structured wiring, home network management, structured cabling for the voice and data industries.">
<link rel="stylesheet" type="text/css" href="css/prototype.css">
<style type="text/css">
#main_col{
	padding:10px;
	width:753px;
}
th{
	text-align:left;
	font-size:16px;
	font-family:Arial;
}

td{
	font-size:14px;
}


</style>
<script language="javascript" type="text/javascript" src="js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.cookie.js"></script>
<script language="javascript" type="text/javascript" src="js/dynacom.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){


});
</script>
</head>
<body>
	<div id="warp">
		<div id="head">
			<div id="company_icon"></div>
			<div id="company_banner"></div>
			<div id="navigator">
				<!--#include file="inc/navigator.inc" -->		
			</div>
			<div id="null"></div>
		</div>
		
		<div id="ibody">
			<div id="left_col">
				<!--#include file="inc/left_new.inc" -->			
			</div>
			<div id="main_col">
				<%
				rs1.open "select * from product order by name",conn

				if not rs1.eof then
					%>
					<table>
						<thead>
							<th width="20%">Part Number</td>
							<th width="60%">Description</td>
							<th width="20%"><span lang="en-us"><font size="3">
                            Cut Sheet</font></span></td>
						</thead>
					<%
					while not rs1.eof
						%>
						<tr>
							<td><a href="product.asp?pid=<%=rs1("id")%>"><%=rs1("name")%></a>
							</td>
							<td><a href="product.asp?pid=<%=rs1("id")%>"><%=rs1("des")%></a>
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pdf/<%=rs1("pdf")%>"><img src="images/pdf.ico" height="14" width="14" style="border:0px;" /></a>
							</td>
						</tr>
						<%
						rs1.movenext
					wend
					%></table><%
				end if
				%>
				</div>		
			</div>
	
		<br clear="all" />
		
		<div id="footer">
			<!--#include file="inc/footer.inc" -->			
		</div>
	</div>
</body>
</html>