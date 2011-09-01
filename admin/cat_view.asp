<%
	Response.Buffer = True 
	Response.ExpiresAbsolute = Now() - 1 
	Response.Expires = 0 
	Response.CacheControl = no-cache 	
%>
<!--#include file="conn.asp" -->
<html>
<head>
<title>
Dynacom - Affordable Quailty Network Cabling Products
</title>
<style type="text/css">
span{
	font-size:14px;
	font-weight:100;
	text-decoration:underline;
}

li{
	font-weight:bold;
	padding:3px;
	font-size:14px;
}

a{
	text-decoration:none;
	color:#000;

}

a:hover{
	text-decoration:none;
	color:#C00;

}


ul{
	margin:0px;;
	padding:5px;
}

li{
	margin:5px 0px 10px 15px;
	padding:5px 0px 0px 15px ;
	list-style-type:none;
	font-weight:bold;
}

</style>
<script language="javascript" type="text/javascript">
function expandCat(obj){
	if(obj.parentNode.getElementsByTagName("ul")[0].style.display=="none"){
		obj.parentNode.getElementsByTagName("ul")[0].style.display="block";
	}else{
		obj.parentNode.getElementsByTagName("ul")[0].style.display="none";
	}
}

function GetCenterXY(objdiv){
	x = document.body.scrollLeft;
	y = document.body.scrollTop;
	
	availWidth = parseInt(window.screen.availWidth);
	availHeight = parseInt(window.screen.availHeight);
	tblWidth = parseInt(objdiv.width);
	
	y = y + availHeight/4;
	objdiv.style.top = y;
}

function editCat(id,node){
//	location.href="cat_edit.asp?action=get&id="+id;
//	return;

	addOverlay();
	var edit_info = document.createElement("div");
	edit_info.style.position = "absolute";
	edit_info.id="edit_info";
	edit_info.innerHTML="<div style='margin:100px 0 0 100px;'><img src='images/loading.gif' height='16' width='16' />Loading...</div>";
	edit_info.style.top = 0;
	edit_info.style.left = 100;
	edit_info.style.width = 300;
	edit_info.style.height = 200;
	edit_info.style.zIndex = 200;
	edit_info.style.border="1px outset #000000";
	edit_info.style.backgroundColor="#EEEECC";
	document.body.appendChild(edit_info);
	GetCenterXY(document.getElementById("edit_info"));
	
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200 ){
				var edit_a
				var edit
				var rank
				edit_a = xmlHttp.responseText.split("|");
				edit = "<div style='margin:20px 0 0 60px'>Category Infomation<p><table><tr><td>Name:</td><td><input type='text' size='20' id='edit_info_name' /></td></tr><tr><td>Desc.:</td><td><input type='text' size='20' id='edit_info_des' /></td></tr><tr><td>Pic.:</td><td><input type='text' size='20' id='edit_info_pic' /></td></tr><tr><td height='40'><input type='button' value='update' onclick=\"updateCat("+id+",'"+node+"')\" /></td><td><input type='button' value='cancel' onclick='cancelCat()' /></td></tr></table>"
				document.getElementById("edit_info").innerHTML = edit;
				document.getElementById("edit_info_name").value=edit_a[0];
				document.getElementById("edit_info_des").value=edit_a[1];
				document.getElementById("edit_info_pic").value=edit_a[2];
			}else{
				alert("sorry,link out of time,please try again.");
				if(document.getElementById("edit_info")){
					document.getElementById("edit_info").outerHTML="";
					removeOverlay();
				}		
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=get&id="+id);
	xmlHttp.send(null);
}

function updateCat(id,node){
	var name = escape(document.getElementById("edit_info_name").value);
	var des = escape(document.getElementById("edit_info_des").value);
	var pic = escape(document.getElementById("edit_info_pic").value);
//	location.href="cat_edit.asp?action=update&id="+id+"&name="+name+"&des="+des+"&pic"+pic;
//	return;
	var button = document.getElementById("edit_info").getElementsByTagName("input");
	for(var i=0;i<button.length;i++){
		button[i].disabled = "disabled";
	}
	
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200){
				var flag
				flag = xmlHttp.responseText;
				if (flag==1){
					document.getElementById("edit_info").innerHTML="<div style='margin:80px 0 0 80px;'>Update successfully!<p><input type='button' value='close' id='edit_info_close'></div>";
					document.getElementById("edit_info_close").onclick=function(){document.getElementById("edit_info").outerHTML="";removeOverlay();}
					document.getElementById(node).childNodes[0].innerHTML=unescape(name);
				}
			}else{
				alert("sorry,link out of time,please try again.");
				button = document.getElementById("edit_info").getElementsByTagName("input");
				for(var i=0;i<button.length;i++){
					button[i].disabled = null;
				}
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=update&id="+id+"&name="+name+"&des="+des+"&pic="+pic);
	xmlHttp.send(null);

}

function getSubCat(id,node){
//	location.href="cat_edit.asp?action=getsub&id="+id;
//	return;
	if(document.getElementById(node).getElementsByTagName("ul").length!=0){	
		document.getElementById(node).getElementsByTagName("ul")[0].outerHTML="";
	}
	document.getElementById(node).appendChild(document.createElement("ul"));
	document.getElementById(node).getElementsByTagName("ul")[0].innerHTML="<img src='images/loading.gif' height='16' width='16' />";
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200 ){
				var xml	= xmlHttp.responseText.split("@");		
				if (xml[0]==0){
					alert("sorry, this menu has no sub menu");
					document.getElementById(node).childNodes[0].onclick=function(){expandCat(this)};
					document.getElementById(node).getElementsByTagName("ul")[0].outerHTML="";
				}else if(xml[0]==1){
					var menus = xml[1].split("|");
					var menu = "";
					for(var i=0;i<menus.length;i=i+2){
						if (menus[i]!=""){
							menu += "<li id='"+node+"_"+menus[i+1]+"'><a onClick=\"getSubCat("+menus[i+1]+",'"+node+"_"+menus[i+1]+"');\" onMouseOver=\"this.style.cursor='hand';this.style.color='#CC0000'\" onMouseOut=\"this.style.cursor='default';this.style.color='#000000'\">"+menus[i]+"</a>&nbsp;<span  onMouseOver=\"this.style.cursor='hand';this.style.color='#CC0000'\" onMouseOut=\"this.style.cursor='default';this.style.color='#000000'\" onClick=\"editCat("+menus[i+1]+",'"+node+"_"+menus[i+1]+"');\">Edit</span>&nbsp;<span  onMouseOver=\"this.style.cursor='hand';this.style.color='#CC0000'\" onMouseOut=\"this.style.cursor='default';this.style.color='#000000'\" onClick=\"addCat("+menus[i+1]+",'"+node+"_"+menus[i+1]+"');\">Add</span>&nbsp;<span  onMouseOver=\"this.style.cursor='hand';this.style.color='#CC0000'\" onMouseOut=\"this.style.cursor='default';this.style.color='#000000'\" onClick=\"removeCat("+menus[i+1]+",'"+node+"_"+menus[i+1]+"');\">Remove</span></li>"
						}
					}
					document.getElementById(node).getElementsByTagName("ul")[0].innerHTML = menu;
					document.getElementById(node).childNodes[0].onclick=function(){expandCat(this)};
				}else{
					var menus = xml[1].split("|");
					var menu = "";
					for(var i=0;i<menus.length;i=i+2){
						if (menus[i]!=""){
							menu += "<li id='"+node+"_"+menus[i+1]+"' style='font-size:12px;font-weight:100;'><a href='../product.asp?pid="+menus[i+1]+"' target='_blank'>"+menus[i]+"</a></li>"
						}
					}
					document.getElementById(node).getElementsByTagName("ul")[0].innerHTML = menu;
					document.getElementById(node).childNodes[0].onclick=function(){expandCat(this)};
				}
			}else{
				alert("sorry,link out of time,please try again.");
				document.getElementById(node).getElementsByTagName("ul")[0].outerHTML="";
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=getsub&id="+id);
	xmlHttp.send(null);

}



function cancelCat(){
	if(document.getElementById("edit_info")){
		document.getElementById("edit_info").outerHTML="";
		removeOverlay();
	}
	if(document.getElementById("add_cat")){
		document.getElementById("add_cat").outerHTML="";
		removeOverlay();	
	}
	if(document.getElementById("remove_cat")){
		document.getElementById("remove_cat").outerHTML="";
		removeOverlay();
	}
}


function addCat(id,node){
//	alert("cat_edit.asp?action=getrank&id="+id);
//	location.href="cat_edit.asp?action=getrank&id="+id;
//	return;
	addOverlay();
	var add_cat = document.createElement("div");
	add_cat.style.position = "absolute";
	add_cat.id="add_cat";
	add_cat.innerHTML="<div style='margin:100px 0 0 100px;'><img src='images/loading.gif' height='16' width='16' />Loading...</div>";
	add_cat.style.top = 0;
	add_cat.style.left = 100;
	add_cat.style.width = 300;
	add_cat.style.height = 200;
	add_cat.style.zIndex = 200;
	add_cat.style.border="1px outset #000000";
	add_cat.style.backgroundColor="#EEEECC";
	document.body.appendChild(add_cat);
	GetCenterXY(document.getElementById("add_cat"));
	
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200 ){
				var edit_a
				var rank
				edit_a = xmlHttp.responseText.split("|");
//				alert(edit_a.length);
				document.getElementById("add_cat").innerHTML="<div style='margin:50px 0 0 0px;text-align:center'>New Sub Item<p><select id='add_cat_sel' style='width:200px;'></select><p><input type='button' value='Add' onclick=\"updateAddCat("+id+",'"+node+"')\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='Cancel' onclick='cancelCat();'>"
				document.getElementById("add_cat_sel").options.length=0;
				for(var i=0;i<edit_a.length;i=i+2){
					if(edit_a[i]){
						var slt = document.getElementById("add_cat_sel");
						slt.options[slt.length]=new Option(edit_a[i],edit_a[i+1]);
					}
				}
			}else{
				alert("sorry,link out of time,please try again.");
				if(document.getElementById("add_cat")){
					document.getElementById("add_cat").outerHTML="";
					removeOverlay();
				}		
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=getrank&id="+id);
	xmlHttp.send(null);
	
}

function updateAddCat(id,node){
//	alert(id);
//	return;
//	alert(document.getElementById("add_cat_sel").value)
//	return;
	var subi = document.getElementById("add_cat_sel").value;
//	alert("cat_edit.asp?action=updateitem&id="+id+"&subi="+i);
//	return;
//	location.href="cat_edit.asp?action=updateitem&id="+id+"&subi="+subi;
//	return;
	var button = document.getElementById("add_cat").getElementsByTagName("input");
	for(var i=0;i<button.length;i++){
		button[i].disabled = "disabled";
	}
	document.getElementById("add_cat_sel").disabled="disabled";
	
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200 ){
				var flag
				flag = xmlHttp.responseText;
				if (flag==1){
					document.getElementById("add_cat").innerHTML="<div style='margin:80px 0 0 80px;'>Update successfully!<p><input type='button' value='close' id='add_cat_close'></div>";
					document.getElementById("add_cat_close").onclick=function(){document.getElementById("add_cat").outerHTML="";removeOverlay();getSubCat(id,node);}
					
				}
			}else{
				alert("sorry,link out of time,please try again.");
				button = document.getElementById("add_cat").getElementsByTagName("input");
				for(var i=0;i<button.length;i++){
					button[i].disabled = null;
				}
				document.getElementById("add_cat_sel").disabled=null;
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=updateadditem&id="+id+"&subi="+subi);
	xmlHttp.send(null);
}




function updateItem(id,node){
//	alert(id);
//	return;
//	alert(document.getElementById("add_cat_sel").value)
//	return;
	var subi = document.getElementById("remove_cat_sel").value;
//	alert("cat_edit.asp?action=updateitem&id="+id+"&subi="+i);
//	return;
//	location.href="cat_edit.asp?action=updateitem&id="+id+"&subi="+subi;
//	return;
	var button = document.getElementById("remove_cat").getElementsByTagName("input");
	for(var i=0;i<button.length;i++){
		button[i].disabled = "disabled";
	}
	document.getElementById("remove_cat_sel").disabled="disabled";
	
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200 ){
				var flag
				flag = xmlHttp.responseText;
				if (flag==1){
					document.getElementById("remove_cat").innerHTML="<div style='margin:80px 0 0 80px;'>Update successfully!<p><input type='button' value='close' id='remove_cat_close'></div>";
					document.getElementById("remove_cat_close").onclick=function(){document.getElementById("remove_cat").outerHTML="";removeOverlay();getSubCat(id,node);}
					
				}
			}else{
				alert("sorry,link out of time,please try again.");
				button = document.getElementById("remvoe_cat").getElementsByTagName("input");
				for(var i=0;i<button.length;i++){
					button[i].disabled = null;
				}
				document.getElementById("remove_cat_sel").disabled=null;
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=updateitem&id="+id+"&subi="+subi);
	xmlHttp.send(null);
}

function removeCat(id,node){
//	alert("cat_edit.asp?action=getitem&id="+id);
//	location.href="cat_edit.asp?action=getitem&id="+id;
//	return;
	addOverlay();
	var remove_cat = document.createElement("div");
	remove_cat.style.position = "absolute";
	remove_cat.id="remove_cat";
	remove_cat.innerHTML="<div style='margin:100px 0 0 100px;'><img src='images/loading.gif' height='16' width='16' />Loading...</div>";
	remove_cat.style.top = 0;
	remove_cat.style.left = 100;
	remove_cat.style.width = 300;
	remove_cat.style.height = 200;
	remove_cat.style.zIndex = 200;
	remove_cat.style.border="1px outset #000000";
	remove_cat.style.backgroundColor="#EEEECC";
	document.body.appendChild(remove_cat);
	GetCenterXY(document.getElementById("remove_cat"));
	
	var xmlHttp;
	if (window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else if (window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState == 4){
			if(xmlHttp.status == 200 ){
				var edit_a
				if(xmlHttp.responseText!="0"){
					edit_a = xmlHttp.responseText.split("|");
	//				alert(edit_a.length);
					document.getElementById("remove_cat").innerHTML="<div style='margin:50px 0 0 0px;text-align:center'>Choose One Item<p><select id='remove_cat_sel' style='width:200px;'></select><p><input type='button' value='Remove' onclick=\"updateItem("+id+",'"+node+"')\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='Cancel' onclick='cancelCat();'>"
					document.getElementById("remove_cat_sel").options.length=0;
					for(var i=0;i<edit_a.length;i=i+2){
						if(edit_a[i]){
							var slt = document.getElementById("remove_cat_sel");
							slt.options[slt.length]=new Option(edit_a[i],edit_a[i+1]);
						}
					}
				}else{
					alert("sorry,this menu has no item.");
					if(document.getElementById("remove_cat")){
						document.getElementById("remove_cat").outerHTML="";
						removeOverlay();
					}		
				}
			}else{
				alert("sorry,link out of time,please try again.");
				if(document.getElementById("remove_cat")){
					document.getElementById("remove_cat").outerHTML="";
					removeOverlay();
				}		
			}
		}
	}
	xmlHttp.open("GET","cat_edit.asp?action=getitem&id="+id);
	xmlHttp.send(null);
}



function addOverlay(){
	if(!document.getElementById("overlay")){
		var overlay = document.createElement("div");
		overlay.style.position = "absolute";
		overlay.id="overlay";
	//	overlay.innerHTML="overlay";
		overlay.style.top = 0;
		overlay.style.left = 0;
		overlay.style.width = document.body.clientWidth;
		overlay.style.height = document.body.scrollHeight;
		overlay.style.zIndex = 100;
		overlay.style.backgroundColor="#000000";
		overlay.style.filter = "Alpha(opacity=30)";
		document.body.appendChild(overlay);
	}
}

function removeOverlay(){
	if(document.getElementById("overlay")){
		document.getElementById("overlay").outerHTML="";
	}
}

</script>
</head>
<body>
	<%
	Response.Buffer = True 
	Response.ExpiresAbsolute = Now() - 1 
	Response.Expires = 0 
	Response.CacheControl = no-cache 	
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
	rs1.open "select * from cat where rank = '0'",conn
	if not rs1.eof then
		%><ul><%
		while not rs1.eof
			%><li id='<%=rs1("id")%>'><a onClick="expandCat(this);" onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'"><%=unescape(cstr(trim(rs1("name"))))%></a>
				<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="addCat(<%=cstr(trim(rs1("id")))%>,'<%=cstr(trim(rs1("id")))%>');">Add</span>
				<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="removeCat(<%=cstr(trim(rs1("id")))%>,'<%=cstr(trim(rs1("id")))%>');">Remove</span><%
			if rs1("dncat")<>"0" and rs1("dncat")<>"" then
				%><ul><%
				ary=split(cstr(trim(rs1("dncat"))),"|")
				for i=lbound(ary) to ubound(ary)
					dim tid
					if len(cstr(ary(i))) = 0 then
						tid = -9999
					else
						tid = cint(ary(i))
					end if
					rs2.open "select * from cat where id = " & tid,conn
					if not rs2.eof then
						while not rs2.eof
							%>
							<li id='<%=rs1("id")%>_<%=rs2("id")%>'><a onClick="expandCat(this);" onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'"><%=unescape(cstr(trim(rs2("name"))))%></a>
								<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="editCat(<%=rs2("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>');">Edit</span>
								<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="addCat(<%=rs2("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>')">Add</span>
								<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="removeCat(<%=rs2("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>')">Remove</span>
							<ul style="display:none;">
							<%
								if trim(rs2("dncat"))<>"" then
									ary1=split(cstr(trim(rs2("dncat"))),"|")
									for j=lbound(ary1) to ubound(ary1)
										dim rs3id
										if len(cstr(ary1(j))) = 0 then
											rs3id = -9999
										else
											rs3id = cint(ary1(j))
										end if
										rs3.open "select * from cat where id=" & rs3id,conn
										if not rs3.eof then
											while not rs3.eof
												%>
												<li id='<%=rs1("id")%>_<%=rs2("id")%>_<%=rs3("id")%>'>
													<a onClick="getSubCat(<%=rs3("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>_<%=rs3("id")%>');" onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'"><%=unescape(cstr(rs3("name")))%>
													</a>
													<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="editCat(<%=rs3("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>_<%=rs3("id")%>');">Edit</span>
													<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="addCat(<%=rs3("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>_<%=rs3("id")%>')">Add</span>
													<span  onMouseOver="this.style.cursor='hand';this.style.color='#CC0000'" onMouseOut="this.style.cursor='default';this.style.color='#000000'" onClick="removeCat(<%=rs3("id")%>,'<%=rs1("id")%>_<%=rs2("id")%>_<%=rs3("id")%>')">Remove</span>
												</li>
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
				%></ul><%
			end if
			%></li><%
			rs1.movenext
		wend
		%></ul><%	
	end if
	rs1.close
	%>
</body>
</html>
