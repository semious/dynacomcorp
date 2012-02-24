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
<script language="javascript" type="text/javascript" src="js/smoothscroll.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	$('#navigator a').eq(2).css('color','#CC0000');
	$('#navigator a').eq(2).css('cursor','default');
	$('.pic_thumb img').click(function(){
		$('#pic_src').attr('src',$(this).attr('src')).attr('title',$(this).attr('src'));
		$('#main_pic').attr('href',$(this).attr('src'))
	});
	
});
</script>
<script language="javascript" type="text/javascript">
function selPic(_obj){
	document.getElementById("pic_src").src=_obj.src;
	document.getElementById("pic_src").alt=_obj.alt;
	document.getElementById("main_pic").href=_obj.src;
}

function goUrl(obj){
	if(obj.value!=" "){
		location.href=obj.value;
	}
}
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
		
		<table>
			<tr>
				<td valign="top" width="80%">
					<div style="font-size:12px; margin:20px 0px; width:631; height:2042">
				<%
				dim pid
				dim p_name
				'dim rs1
				'Set rs1 = Server.CreateObject("ADODB.Recordset")
				pid = request("pid")
				if pid <> "" then
					rs1.open "select * from product where id = "+cstr(pid)+"" ,conn
					if not rs1.eof then
						p_name = trim(rs1("name"))
					end if
					rs1.close
					
					p_name = replace(p_name,"'","''")
					rs1.open "select * from log where name = '"+cstr(p_name)+"' and dates = '"+cstr(year(now))+"-"+cstr(month(now))+"' and kind = 'product'",conn,1,3
					if not rs1.eof then
						rs1("counts") = cint(rs1("counts")) + 1
						rs1.update
					else
						rs1.addnew
						p_name = replace(p_name,"''","'")
						rs1("name") = p_name
						rs1("counts") = 1
						rs1("dates") = cstr(year(now)) + "-" + cstr(month(now))
						rs1("kind") = "product"
						rs1.update
					end if
					rs1.close
	
					rs1.open "select * from product where id = "+cstr(pid)+"",conn
					if not rs1.eof then
					%>
						<div id="product_frame">
							<div id="product_head">
								<ul>
									<li class="li_left"><h3><%=trim(cstr(rs1("name")))%></h3></li>
									<li class="li_right"><h3><%=unescape(trim(cstr(rs1("des"))))%></h3></li>
								</ul>
							</div>
							<div id="product_gallery">
								<ul>
									<li>
										<div style="overflow:auto;height:320px;width:150px;border-right:1px solid #CCC;">
										<a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(cstr(rs1("pic1")))%>" width="100" height="75" alt="<%=trim(cstr(rs1("pic1")))%>" title="Click to enlarge"></a>
									<%
									if trim(cstr(rs1("pic2")))<>"" then
									%>
									<a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(cstr(rs1("pic2")))%>" width="100" height="75" alt="<%=trim(cstr(rs1("pic2")))%>"  title="Click to enlarge"></a>
									<%
									end if
		
									if trim(cstr(rs1("pic3")))<>"" then
									%>
									<a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(cstr(rs1("pic3")))%>" width="100" height="75" alt="<%=trim(cstr(rs1("pic3")))%>" title="Click to enlarge"></a>
									<%
									end if
		
									if trim(cstr(rs1("pic4")))<>"" then
									%>
									<a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(cstr(rs1("pic4")))%>" width="100" height="75" alt="<%=trim(cstr(rs1("pic4")))%>" title="Click to enlarge"></a>
									<%
									end if
		
									if trim(cstr(rs1("pic5")))<>"" then
									%>
									<a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(cstr(rs1("pic5")))%>" width="100" height="75" alt="<%=trim(cstr(rs1("pic5")))%>" title="Click to enlarge"></a>
									<%
									end if
		
									if trim(cstr(rs1("pic6")))<>"" then
									%>
									<a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(cstr(rs1("pic6")))%>" width="100" height="75" alt="<%=trim(cstr(rs1("pic6")))%>" title="Click to enlarge"></a>
									<%
									end if
									
									if trim(cstr(rs1("video")))<>"" then
										dim video_a
										video_a = split(rs1("video"),"|")
										for i = lbound(video_a) to ubound(video_a)
										%><a href="javascript:;" class="pic_thumb"><img src="images/<%=trim(video_a(i))%>" width="100" height="75" alt="<%=trim(cstr(video_a(i)))%>" title="Click to enlarge"></a>
										<%
										next
									end if
									%>
										</div>									
									</li>
									<li style="width:395px;">
										<a href="images/<%=trim(cstr(rs1("pic1")))%>" target="_blank" id="main_pic"><img src="images/<%=trim(cstr(rs1("pic1")))%>" width="380" height="300" id="pic_src" alt="<%=trim(cstr(rs1("pic1")))%>" /></a>
									</li>
								</ul>
							</div>
    <%
								dim intro
								intro = replace(unescape(rs1("intro")),"<pre>","")
								intro = replace(intro,"</pre>","")
							%>
							<div id="intro" style="font-family:arial;font-size:14px;padding:5px;font-weight:bold;height:110px;width:540px; overflow:auto; border-top:1px solid #AAA; border-bottom:1px solid #AAA;">
								<%=intro%>&nbsp;
							</div>
							<div id="color" class="border_bottom">
								<div style="color:#000000; font-weight:bold;">
									<div style="margin-bottom:10px; font-size:14px;color:#16387C;">Colors:</div>
									<%
									if cstr(rs1("color"))<>"" then
										dim c_a 
										c_a = split(rs1("color"),"|")
										for i = lbound(c_a) to ubound(c_a)
											if trim(c_a(i)) <> "" then
												%><%=c_a(i)%>&nbsp;<%
												%><img src="images/<%=c_a(i)%>.jpg" height="12" width="12"/>&nbsp;&nbsp;&nbsp;<%
											end if
										next
									end if
									%>
									
								</div>
							</div>
							<div id="etc">
								<ul style="overflow:hidden;height:28px;">
									<li style="border-right:1px solid #999999; height:30px; padding:5px 10px 0px">
										<span style="color:#16387C; padding:0px; font-size:14px; font-weight:bold">Specification:</span>
										<img src="images/pdf.ico" height="15" width="15" />&nbsp;<a href="pdf/<%=trim(cstr(rs1("pdf")))%>" target="_blank"><%=trim(cstr(rs1("name")))%></a>
									</li>
									<li style="height:3px ;padding:5px 10px 0px">
										<span style="color:#16387C; padding:0px; font-size:14px; font-weight:bold">Pkg. Qty.&nbsp;</span><font color="#000000"><%=cstr(rs1("pq"))%></font>										</li>
								
								</ul>
							</div>
						</div>
					<%
				end if
				rs1.close
			else
				%>
				<table cellpadding="5" style="font-size:14px" width="600">
					<tr>
						<td width="50%" style="text-align:center" height="233"><p><a href="category.asp?cid=86"><img border="0" src="images/Voice_&_Data_Jack_Collage.jpg" width="200" height="150"></a> </p>
<p>
                            <a href="category.asp?cid=86">Voice & Data Jacks </a></p>
<p><a href="category.asp?cid=86">and </a><a href="category.asp?cid=86">Related Tools</a></p></td>
							<td width="50%" style="text-align:center" height="233"><p><a href="category.asp?cid=80"><img src="images/Wallplate_&_Surface_Box_Collage.jpg" width="200" height="150" /></a></p>
							  <p><a href="category.asp?cid=80">Wallplates, Surface Boxes,</a></p>
							  <p><a href="category.asp?cid=80">&amp; Mounting Boxes</a></p>				      </td>
				  </tr>
					<tr>
						<td width="50%" style="text-align:center" height="211"><p>&nbsp;</p>
						  <p><a href="category.asp?cid=78"><img src="images/RJ-Sytle_Cross-Connect_Collage.jpg" width="200" height="150" /></a></p>
						  <p><a href="category.asp?cid=78">RJ-Style Cross-Connect Systems</a></p>
					  <p>and Related Tools</p></td>
					  <td width="50%" style="text-align:center" height="211"><p>&nbsp;
                        </p>
					    <p><a href="category.asp?cid=76"><img src="images/110-Style_Cross-Connect_Collage.jpg" width="200" height="150" /></a></p>
					    <p><a href="category.asp?cid=76">110-Style Cross-Connect Systems </a></p>
				      <p><a href="category.asp?cid=76">and Related Tools</a></p></td>
				  </tr>
                    <tr>
                        <td width="50%" style="text-align:center" height="238">
						<p>
                          <a href="category.asp?cid=77"><img src="images/66-Style_Cross-Connect_Collage.jpg" width="200" height="150" /></a></p>
						<p><a href="category.asp?cid=77">66-Style Cross-Connect Systems</a> </p>
					  <p>and Related Tools</p></td>
						<td width="50%" style="text-align:center" height="238"><a href="category.asp?cid=79"><img src="images/FIber_Optic_Collage.jpg" width="200" height="150" border="0" /></a>
						  <p><a href="category.asp?cid=79">Fiber Optic Cross-Connect Systems</a></p>					  </td>
				  </tr>
					<tr>
						<td width="50%" style="text-align:center" height="238">
							<p><a href="category.asp?cid=124"><img src="images/Rack_Accessories_Brackets_&_Harware_Collage.jpg" width="200" height="150" /></a></p>
						  <p><a href="category.asp?cid=124">Rack Accessories, Wall Brackets</a><a href="category.asp?cid=124">, </a></p>
						  <p>J-Hooks, <a href="category.asp?cid=124">and   Hardware</a> </p>
					  </td>
						<td width="50%" style="text-align:center" height="238"><p><a href="category.asp?cid=182"><img src="images/Voice_Connectivity_Collage.jpg" width="200" height="150" /></a></p>
				  <p><a href="category.asp?cid=182">Couplers & Tees, Integrated Wallplates</a>,</p>
				  <p><a href="category.asp?cid=182">Mod. Plugs, and Related Tools</a></p></td>
					</tr>
					<tr>
                        <td width="50%" style="text-align:center" height="238"><a href="category.asp?cid=168"><img src="images/Audio_Video_Collage.jpg" width="200" height="150"/></a>
                      <p><a href="category.asp?cid=168">Audio-Video Modular Inserts</a></p>                      </td>
       			    <td width="50%" style="text-align:center" height="238"><p>                      <a href="category.asp?cid=179"><img src="images/Residential_Collage.jpg" width="200" height="150" /></a> </p>
                  <p><a href="category.asp?cid=179">Residential Cross-Connect Systems</a></p>                  </td>
					</tr>
				</table>
				<%
				end if
				%>
			</div>
				</td>
				<td width="220" valign="top">
					<div align="center">
						<br />
						<ul>
						<%
						if len(pid) = 0 then
							temp = -9999
						else
							temp = pid
						end if
						rs1.open "select * from product where id = " & temp ,conn
						if not rs1.eof then
							%>
							<h4>Related Products:</h4>
							<%
							if rs1("menu1")<>"" then
								rs2.open "select * from cat where id="+cstr(rs1("menu1"))+"",conn
								if not rs2.eof then
										%><a href="category.asp?cid=<%=rs2("id")%>"><img src="images/<%=rs2("pic")%>" width="75" height="75" alt="<%=cstr(rs2("name"))%>" /></a><br /><%
									%><a href="category.asp?cid=<%=rs2("id")%>"><%=unescape(cstr(rs2("name")))%></a><p><%
								end if
								rs2.close
							end if
							if rs1("menu2")<>"" then
								rs2.open "select * from cat where id="+cstr(rs1("menu2"))+"",conn
								if not rs2.eof then
										%><a href="category.asp?cid=<%=rs2("id")%>"><img src="images/<%=cstr(rs2("pic"))%>" width="75" height="75" alt="<%=cstr(rs2("name"))%>" /></a><br /><%
									%><a href="category.asp?cid=<%=rs2("id")%>"><%=unescape(cstr(rs2("name")))%></a><p><%
									end if
								rs2.close
							end if
							if rs1("menu3")<>"" then
								rs2.open "select * from cat where id="+cstr(rs1("menu3"))+"",conn
								if not rs2.eof then
										%><a href="category.asp?cid=<%=rs2("id")%>"><img src="images/<%=cstr(rs2("pic"))%>" width="75" height="75" alt="<%=cstr(rs2("name"))%>" /></a><br /><%
									%><a href="category.asp?cid=<%=rs2("id")%>"><%=unescape(cstr(rs2("name")))%></a><p><%
								end if
								rs2.close
							end if
							if rs1("menu4")<>"" then
								rs2.open "select * from cat where id="+cstr(rs1("menu4"))+"",conn
								if not rs2.eof then
										%><a href="category.asp?cid=<%=rs2("id")%>"><img src="images/<%=cstr(rs2("pic"))%>" width="75" height="75" alt="<%=cstr(rs2("name"))%>" /></a><br /><%
									%><a href="category.asp?cid=<%=rs2("id")%>"><%=unescape(cstr(rs2("name")))%></a><p><%
								end if
								rs2.close
							end if
						end if
						rs1.close
						conn.close
						set rs1=nothing
						set rs2=nothing
						set rs3=nothing
						set conn=nothing
						%>
						</ul>
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