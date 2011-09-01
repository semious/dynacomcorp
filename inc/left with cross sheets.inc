			<div id="search_frame">
			<form action="search.asp">
				<div id="search">Quick Search:<br />
					<input type="text" size="16" name="words" style="border:1px solid #7f9db9;" />&nbsp;&nbsp;&nbsp;<input type="submit" value="Go!"/>
					<ul style="margin-top:5px;">
						<li><a href="sheets.asp">Parts Index/Spec. Sheets</a></li>
					</ul>
				</div>
			</form>
			</div>
			<div id="menu1" class="menu">
				<div class="search_title">Search Product by Type</div>
				<div class="menu_main">
				<ul>
				<%
				dim rs1
				dim rs2
				dim rs3
				dim ary
				dim ary1
				dim i
				dim j
				set rs1=server.createobject("adodb.recordset")
				set rs2=server.createobject("adodb.recordset")
				set rs3=server.createobject("adodb.recordset")
				rs1.open "select * from cat where name='general1'",conn
				if not rs1.eof then
					ary=split(cstr(trim(rs1("dncat"))),"|")
					for i=lbound(ary) to ubound(ary)
						rs2.open "select * from cat where id='"+ary(i)+"'",conn
						if not rs2.eof then
							while not rs2.eof
								%>
								<li><a href="javascript:;" class="a_show_cat" id="m1_catId_<%=cstr(trim(rs2("id")))%>"><%=unescape(cstr(trim(rs2("name"))))%></a>
								<ul style="display:none">
								<%
									if trim(rs2("dncat"))<>"" then
										ary1=split(cstr(trim(rs2("dncat"))),"|")
										for j=lbound(ary1) to ubound(ary1)
											rs3.open "select * from cat where id='"+ary1(j)+"'",conn
											if not rs3.eof then
												while not rs3.eof
													%>
													<li><a class="submenu" href="category.asp?cid=<%=cstr(trim(rs3("id")))%>"><%=unescape(cstr(trim(rs3("name"))))%></a></li>
													<%
													rs3.movenext
												wend
											end if
											rs3.close
										next
									end if
								%>
								</ul>
								</li>
								<%
								rs2.movenext
							wend
						end if
						rs2.close
					next
				end if
				rs1.close
				%>
				</ul>
				</div>
				<div class="menu_bottom"></div>
			</div>

			<div id="menu4" class="menu">
				<div class="search_title">Resource Center</div>
				<div class="menu_main">						
				<ul>
					<li>
						<a href="pdf/rohs.pdf">RoHS Certification</a>
					</li>
					<li>
						<a href="pdf/warranty.pdf">25-Year Warranty</a>
					</li>
					<li>
						<a href="pdf/line_card.pdf">Our Line Card</a>
					</li>				
					<li>
						<a href="javascript:;" class="a_show_cat">Cross-Reference Guides</a>
						<ul style="display:none;">
							<li style="font-size:12px;text-align:left"><a href="pdf/allen_tel.pdf">Allen Tel</a></li>
						</ul>
					</li>	
					<li>
						<a href="javascript:;" class="a_show_cat">Cat6 Cable Test Results</a>
						<ul style="display:none;">
							<li style="font-size:12px;text-align:left;"><a href="pdf/Cat6 Permanent Link Test for ABA Elite1000X 400CMR Cable + Dynacom Component Compliant Connectivity.pdf" >ABA Elite1000X Cat6 UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Cat6 Permanent Link Test for LS C6 250CMR Cable + Dynacom Component Compliant Connectivity.pdf" >LS Cat6 UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Cat6 Permanent Link Test for Mohawk Cat6CMR + Dynacom Component Complient Connectivity.pdf" >Mohawk Cat6 UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Cat6 Permanent Link Test for WaveNet 550CMR + Dynacom Component Compliant Connectivity.pdf">WaveNet Cat6E UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Cat6 Permenant Link Test for Media Max Cable + Dynacom Component Compliant Connectivity.pdf">Media Max Cat6 UTP</a></li>


						</ul>
					</li>				
				</ul>
				</div>
				<div class="menu_bottom"></div>
			</div>

			<div id="menu5" class="menu" style="width:200px;">
				<div class="search_title">New Products</div>
				<div class="menu_main">						
				<ul>
					<li style="font-size:12px;margin:0 0 0 10px;">
						<a href="pdf/K Tool-K jack.pdf" style="text-decoration:none;" target="_blank"><img src="images/3190.a.jpg" width="150" height="150" /><br />KwikTool & KwikJacks</a>
					</li>
				</ul>
				</div>
				<div class="menu_bottom"></div>
			</div>
		
	