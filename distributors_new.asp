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
<script language="javascript" type="text/javascript" src="js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.cookie.js"></script>
<script language="javascript" type="text/javascript" src="js/dynacom.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.color.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	$('#navigator a').eq(4).css('color','#CC0000');
	$('#navigator a').eq(4).css('cursor','default');
});

function show(dis){
	$('.dis_info').hide();
	$('#dis_'+dis).show();

	$('#dis_'+dis)
		.animate({ backgroundColor: "lightblue" }, 500)
		.animate({ backgroundColor: "white" }, 2000);

}
</script>
</head>
<body>
	<div id="warp">
		<div id="head">
			<div id="company_icon"></div>
			<div id="company_banner">	
				<!--#include file="inc/banner.inc" -->			
			</div>
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
					<table width="100%">
						<tr>
							<td width="70%" valign="top">
							<table border="0">
								<tr align="center">
									<td><img src="images/USA_map.jpg" alt="USA MAP" height="327" width="520"></td>
								</tr>
							</table>
							<%
							'dim rs1
							'dim rs2
							'Set rs1 = Server.CreateObject("ADODB.Recordset")
							'Set rs2 = Server.CreateObject("ADODB.Recordset")
							rs1.open "select * from distributor order by name",conn,1,3
							if not rs1.eof then
								while not rs1.eof
									%>
                                    <div class="dis_info" style="margin:20px; display:none" id="dis_<%=trim(cstr(rs1("id")))%>">
									<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td align="center" rowspan="7" valign="bottom" width="220" height="100" style="padding-top:10px;">&nbsp;
												</td>
										</tr>
										<tr>
											<td><div id="<%=trim(cstr(rs1("name")))%>" style="color:#16387C; font-size:16px; font-weight:bold;"><%=trim(cstr(rs1("name")))%></div>
											</td>
										</tr>
										<tr>
											<td valign="bottom" style=" text-indent:10px;color:#000000;">
												<%=trim(cstr(rs1("address")))%>
											</td>
										</tr>
										<%
											if trim(cstr(rs1("address1"))) <> "" then
												%>
												<tr>
													<td valign="bottom" style="text-indent:10px;color:#000000;">
														<%=trim(cstr(rs1("address1")))%>
													</td>
												</tr>
												<%
											end if
					
											if trim(cstr(rs1("address2"))) <> "" then
												%>
												<tr>
													<td valign="bottom" style="text-indent:10px;color:#000000;">
														<%=trim(cstr(rs1("address2")))%>
													</td>
												</tr>
												<%
											end if
										%>
												<tr>
													<td valign="bottom" style="text-indent:10px;color:#000000;">
														<%=trim(cstr(rs1("tel")))%>
													</td>
												</tr>

									</table>
                                    </div>
									<%
									rs1.movenext
								wend
								%><%
							end if
							rs1.close
							%>
						</td>
						<td valign="top" width="30%">
						<div>
								<h3 style="padding:0px;margin-top:10px">Distributors:</h3>
							<%
							rs1.open "select [zone] from distributor group by [zone]" ,conn
							if not rs1.eof then
								%><ul><%
								while not rs1.eof
									rs2.open "select * from distributor where [zone] = '"+trim(cstr(rs1("zone")))+"'",conn
									if not rs2.eof then
										%>
										<li style="padding:10px 0px 0px 0px;">&nbsp;<a onClick="expandCat(this);" style="font-size:16px;font-weight:bold;cursor:pointer;" onMouseOver="this.style.color='#CC0000'" onMouseOut="this.style.color='#16387C'"><%=rs1("zone")%></a>
											<ul style="display:none;">
											<%
											while not rs2.eof
												%><li class="disp_area" style="font-size:14px; font-weight:300;padding:5px 0px 5px 10px; "><a title="<%=trim(cstr(rs2("name")))%>" href="javascript:;" style=" color:#000000;font-size:14px;" onMouseOver="this.style.color='#CC0000'" onMouseOut="this.style.color='#000000'" onclick="show('<%=trim(cstr(rs2("id")))%>')" ><%=rs2("name")%></a></li><%
												rs2.movenext
											wend
											%>
											</ul>
										</li><%
									end if
									rs2.close
									rs1.movenext
								wend
								%></ul><%
							end if
							rs1.close
							conn.close
							set rs1=nothing
							set rs2=nothing
							set rs3=nothing
							set conn=nothing
							%>
						</div>
						</td>
						</tr>
					</table>
				</div>		
			</div>
		</div>
		<br clear="all" />
		
		<div id="footer">
			<!--#include file="inc/footer.inc" -->			
		</div>
	</div>
</body>
</html>