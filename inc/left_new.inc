			<script type="text/javascript" src="js/jquery.blockUI.js"></script>
			<div id="search_frame">
			    <form action="search.asp">
				<div id="search">
					<div class="search_title" style="text-align:left">Quick Product Search:</div>
					<div class="menu_main" style="padding:5px 0 0 10px;width:186px;">
                        <input type="text" size="15" name="words" style="border:1px solid #7f9db9;" />&nbsp;&nbsp;&nbsp;<input type="submit" value="Go!"/>
                        <ul style="margin-top:5px;">
                            <li style="margin-left:-7px;"><a href="sheets.asp">Parts Index/Spec. Sheets</a></li>
                        </ul>
					</div>
					<div class="menu_bottom"></div>
				</div>
			</form>
			</div>
            <!--			<div id="menu1" class="menu" >
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
						dim uid
						if len(ary(i)) = 0 then
							uid = -9999
						else
							uid = ary(i)
						end if
						rs2.open "select * from cat where id = " & uid,conn
						if not rs2.eof then
							while not rs2.eof
								%>
								<li><a href="javascript:;" class="a_show_cat" id="m1_catId_<%=cstr(trim(rs2("id")))%>"><%=unescape(cstr(trim(rs2("name"))))%></a>
								<ul style="display:none">
								<%
									if trim(rs2("dncat"))<>"" then
										ary1=split(cstr(trim(rs2("dncat"))),"|")									
										for j=lbound(ary1) to ubound(ary1)
											dim uuid
											if len(ary1(j)) = 0 then
												uuid = -9999
											else
												uuid = ary1(j)
											end if	
											rs3.open "select * from cat where id = " & uuid , conn
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
			</div>-->
			<div id="menu6" class="menu">
				<div class="search_title">Dynacom Community</div>
				<div class="menu_main">
				<ul>
					<li>
						<a href="javascript:popupWindow();void(0);" >Contractor Registration</a>
					</li>
					<li>
						<a href="pdf/rewardsprogram.pdf">Rewards Program</a>
					</li>
					<li>
						<a href="http://www.facebook.com/pete.bach" target="_blank">Like Us <img align="bottom" src="images/likeus.gif"/></a>
					</li>
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
						<a href="javascript:;" class="a_show_cat">Cat6 Cable Test Results</a>
						<ul style="display:none;">
							<li style="font-size:12px;text-align:left;"><a href="pdf/Permanent Link Test for ABA Elite1000X 400CMR.pdf" >ABA Elite1000X Cat6 UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Permanent Link Test for LS 250CMR.pdf" >LS Cat6 UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Permanent Link Test for Mohawk C6CMR.pdf" >Mohawk Cat6 UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Permanent Link Test for WaveNet 550CMR.pdf">WaveNet Cat6E UTP</a></li>
							<li style="font-size:12px;text-align:left"><a href="pdf/Permenant Link Test for Media Max C6CMR.pdf">Media Max Cat6 UTP</a></li>
						</ul>
					</li>				
				</ul>
				</div>
				<div class="menu_bottom"></div>
			</div>

			<div id="menu5" class="menu" style="width:200px;">
				<div class="search_title">New Products</div>
				<div class="menu_main" style="text-align: center">
				    <div style="margin: 0 auto;width: 170px; height:148px; overflow:hidden">
					<ul class="slide_show_container">
				        <li class="slide_show_item">
				            <img src="images/slideshow_demo1.jpg" />
				        </li>
				        <li class="slide_show_item"><a href="product.asp?id=XXXX" target="_blank"><img src="images/slideshow_demo2.jpg" /></a></li>
				        <li class="slide_show_item"><img src="images/slideshow_demo3.jpg" /></li>
				        <li class="slide_show_item"><img src="images/slideshow_demo2.jpg" /></li>      
						<li class="slide_show_item"><img src="images/slideshow_demo1.jpg" /></li>
				    </ul>
				        <!--<iframe width="180" height="135" src="http://www.youtube.com/embed/wau7jqDHZ5c?rel=0" frameborder="0" allowfullscreen></iframe>-->
			        </div>
			            <!--<a href="http://youtu.be/y4fMIodxJjY" target="_blank">
						<span class="video_play"></span>
						<img style="border-radius: 5px;" width="180" src="http://img.youtube.com/vi/y4fMIodxJjY/2.jpg">
					</a>-->
				</div>
				<div class="menu_bottom"></div>
			</div>
			<div style="margin-top: 20px;"><img width="200" src="images/reward.jpg" /></div>
			<div id="surveyMonkeyInfo">
			    <div>
			        <h1 class="surveyTitle" style="color:#16387C;margin: 3px 0">Contractor Registration</h1>
			        <a href="javascript:$.unblockUI();void(0);" style="font-size:14px;position:absolute;right: 5px; top:2px;">close</a>
			        <script src="http://www.surveymonkey.com/jsEmbed.aspx?sm=AWGgjKu_2bPfqED6EYgQ9Dxg_3d_3d"> </script>
			    </div>
			</div>
		<script type="text/javascript">
			function initSlideShow(){
				var count = 0;
				$('.slide_show_item').hide();
				$('.slide_show_item').eq(count++).fadeIn();
				startSlideShow(count);
			}
			function startSlideShow(count){
		//        console.log(count);
				window.setTimeout(function(){
					var size = $('.slide_show_item').length;
					count = count>=size?0:count;
					$('.slide_show_item').eq(count-1).fadeOut("slow");
					$('.slide_show_item').eq(count).fadeIn("slow");
					startSlideShow(++count);
				 },5000);
			}
			initSlideShow();
		</script>