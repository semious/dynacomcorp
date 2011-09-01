<!--#include file="conn.asp" -->
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
<script language="javascript" type="text/javascript" src="js/smoothscroll.js"></script>
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
				<!--#include file="inc/left.inc" -->			
			</div>
			<div id="main_col">
				<table style="width:100%">
				<tr>
					<td width="70%">
					<div style="margin-left:30px;">
					<%
					dim cid
					dim menu_name
					cid = request("cid")
					if not isnumeric(cid) then
						response.Redirect("dynacom.asp")
						response.End()
					end if
		
					rs1.open "select * from cat where id = '"+cstr(cid)+"'" ,conn
					if not rs1.eof then
						menu_name = trim(rs1("name"))
					end if
					rs1.close
					
					menu_name = replace(menu_name,"'","''")
					rs1.open "select * from log where name = '"+cstr(menu_name)+"' and dates = '"+cstr(year(now))+"-"+cstr(month(now))+"' and kind = 'menu'",conn,1,3
					if not rs1.eof then
						rs1("counts") = cint(rs1("counts")) + 1
						rs1.update
					else
						rs1.addnew
						menu_name = replace(menu_name,"''","'")
						rs1("name") = menu_name
						rs1("counts") = 1
						rs1("dates") = cstr(year(now)) + "-" + cstr(month(now))
						rs1("kind") = "menu"
						rs1.update
					end if
					rs1.close
					
					rs1.open "select * from cat where id = '"+cstr(cid)+"'" ,conn
					if not rs1.eof then
						if cstr(rs1("dncat"))<>"" then
							ary=split(cstr(rs1("dncat")),"|")
							for i=lbound(ary) to ubound(ary)
								rs2.open "select * from cat where id='"+ary(i)+"'",conn
								if not rs2.eof then
									while not rs2.eof
										%>
										<div style="font-size:18px; font-weight:bold; margin:10px 0px 0px 0px;" id="<%=unescape(cstr(trim(rs2("name"))))%>"><%=unescape(cstr(trim(rs2("name"))))%></div>
										<img src="images/<%=cstr(rs2("pic"))%>" alt="<%=unescape(cstr(trim(rs2("name"))))%>" height="169" width="225" style="float:right; margin-left:5px;" /><ul>	
										<%
										 if cstr(rs2("p_id"))<>"" and cstr(rs2("p_id"))<>"0" then
											ary1=split(cstr(rs2("p_id")),"|")
											for j = lbound(ary1) to ubound(ary1)
												rs3.open "select * from product where id='"+ary1(j)+"' order by name",conn
												if not rs3.eof then
													%><%
													while not rs3.eof
														%>
														<li style="font-size:14px; margin:5px 0px;"><a style="color:#000000;" onMouseOver="this.style.color='#CC0000'" onMouseOut="this.style.color='#000000'" href="product.asp?pid=<%=cstr(trim(rs3("id")))%>" title="<%=trim(cstr(rs3("des")))%>"><%=trim(cstr(rs3("s_des")))%></a></li>
														<%
														rs3.movenext
													wend
													%><%
												end if
												rs3.close
											next
										 end if
										 %></ul>
										<div style="height:0; border-top:1px dotted #999; clear:both"></div>
										<%
										rs2.movenext
									wend
								end if
								rs2.close
							next
						end if
					end if
					rs1.close
					%>
				</div>
				</td>
				<td valign="top">
				<div style="margin:0px 0px 0px 25px;padding:10px 0px; width:200px;">
				<%
				rs1.open "select * from cat where id = '"+cstr(cid)+"'" ,conn
				if not rs1.eof then
				%>
					<div class="search_title"><%=unescape(rs1("name"))%></div>
					<div class="menu_main">
					<%
					if cstr(rs1("dncat"))<>"" then
						ary=split(cstr(rs1("dncat")),"|")
						for i=lbound(ary) to ubound(ary)
							rs2.open "select * from cat where id='"+ary(i)+"'",conn
							if not rs2.eof then
								%><ul><%
								while not rs2.eof
									%><li style="padding-left:10px; list-style-image:url('none');">&nbsp;<span onClick="expandCat(this);" style="font-size:14px;cursor:pointer;" onMouseOver="this.style.color='#cc0000'" onMouseOut="this.style.color='#16387C'"><%=unescape(cstr(trim(rs2("name"))))%></span>
									<ul style="display:none;"><%
										if cstr(rs2("p_id"))<>"" and cstr(rs2("p_id"))<>"0" then
											ary1=split(cstr(rs2("p_id")),"|")
											for j=lbound(ary1) to ubound(ary1)
												rs3.open "select * from  product where id='"+ary1(j)+"' order by name",conn
												if not rs3.eof then
													while not rs3.eof
														%>
														<li class="product"><a style="color:#000000;" onMouseOver="this.style.color='#CC0000'" onMouseOut="this.style.color='#000000'" href="product.asp?pid=<%=cstr(trim(rs3("id")))%>"><%=unescape(cstr(trim(rs3("s_des"))))%></a>
														</li>
														<%
														rs3.movenext
													wend
												end if
												rs3.close
											next
										end if
									%>
									</ul></li>
								<%
									rs2.movenext
								wend
								%></ul><%
							end if
							rs2.close
						next
					end if
				end if
				rs1.close
				%>
					</div>
					<div class="menu_bottom"></div>
				</div>
				</td>
				</tr>
				</table>
				</div>		
			</div>
		
		<div id="footer">
			<!--#include file="inc/footer.inc" -->			
		</div>
	</div>
	</body>
</html>