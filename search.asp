<!--#include file="conn_access.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
Dynacom - Affordable Quailty Network Cabling Products
</title>
<meta name="keywords" content="Dynacom, Wire Management, 110 Cross Connect, Wire, Management, 110, Cross-connect, cross, connect, connections, wire, management, backboard management, residential cabeling, structured wiring, home network management, structured cabling">
<meta name="description" content="Dynacom, is a manufacturer of Wire Management, 110 Cross Connect, Wire, Management, 110, Cross-connect, wire management, backboard management, residential cabling, structured wiring, home network management, structured cabling for the voice and data industries.">
<link rel="stylesheet" type="text/css" href="css/search.css">
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
			<h3>Search Result:</h3>
			<%
			response.buffer="true"
			dim words
			dim word
			dim sql
			dim p_n
			dim des
			dim t_w
			dim p_n2
			t_w=""
			sql=""
			words=trim(cstr(request("words")))
			if words="" then
				response.Write("<script>alert('Sorry,you must input a letter at least!');history.go(-1)</script>")
				response.End()
			end if
			word = split(words," ")
			
			for i = lbound(word) to ubound(word)
				if trim(word(i))<>"" then
					t_w = t_w + word(i) + "|"
				end if
			next
			
			word = split(t_w,"|")
'			response.Write(ubound(word))
			for i = lbound(word) to ubound(word)
				if sql = "" then
					sql = "select * from product where (name like '%"+word(i)+"%' or des like '%"+word(i)+"%' or intro like '%"+word(i)+"%' or pq like '%"+word(i)+"%' or color like '%"+word(i)+"%' or pdf like '%"+word(i)+"%') "
				else
					sql = sql + " (name like '"+word(i)+"' or des like '%"+word(i)+"%' or intro like '%"+word(i)+"%' or pq like '%"+word(i)+"%' or color like '%"+word(i)+"%' or pdf like '%"+word(i)+"%') "
				end if
				if i <> ubound(word) then
					sql = sql + " and "
				end if
			next
'			response.Write(sql)
			rs1.open sql,conn
			if not rs1.eof then
				%><ul><%
				while not rs1.eof
					p_n = rs1("name")
					des = rs1("des")
					for i = lbound(word) to ubound(word)
						if trim(word(i))<>"" then
							p_n = replace(p_n,word(i),"<font color='#CC0000'>"+word(i)+"</font>")
							p_n = replace(p_n,lcase(word(i)),"<font color='#CC0000'>"+lcase(word(i))+"</font>")						
							p_n = replace(p_n,ucase(word(i)),"<font color='#CC0000'>"+ucase(word(i))+"</font>")						
							p_n = replace(p_n,ucase(left(trim(word(i)),1))+right(trim(word(i)),len(trim(word(i)))-1),"<font color='#CC0000'>"+ucase(left(trim(word(i)),1))+right(trim(word(i)),len(trim(word(i)))-1)+"</font>")						
							des = replace(des,word(i),"<font color='#CC0000'>"+word(i)+"</font>")
							des = replace(des,lcase(word(i)),"<font color='#CC0000'>"+lcase(word(i))+"</font>")
							des = replace(des,ucase(word(i)),"<font color='#CC0000'>"+ucase(word(i))+"</font>")
							des = replace(des,ucase(word(i)),"<font color='#CC0000'>"+ucase(word(i))+"</font>")
							des = replace(des,ucase(left(word(i),1))+right(trim(word(i)),len(trim(word(i)))-1),"<font color='#CC0000'>"+ucase(left(trim(word(i)),1))+right(trim(word(i)),len(word(i))-1)+"</font>")						
						end if
					next

					%>
					<li>
						<a  href="product.asp?pid=<%=rs1("id")%>"><span class="item_head"><%=p_n%></span><%=des%></a>
					</li><%
					rs1.movenext
				wend
				%></ul><%
			end if
			rs1.close
			
			sql=""
			for i = lbound(word) to ubound(word)
				if sql = "" then
					sql = "select * from cat where ( name like '%"+word(i)+"%' or des like '%"+word(i)+"%' ) "
				else
					sql = sql + " ( name like '%"+word(i)+"%' or des like '%"+word(i)+"%' ) "
				end if
				if i <> ubound(word) then
					sql = sql + " and "
				end if
			next
'			response.Write(sql)
			rs1.open sql,conn
			if not rs1.eof then
				%><ul><%
				while not rs1.eof
					p_n = rs1("name")
					des = rs1("des")
					for i = lbound(word) to ubound(word)
						if trim(word(i))<>"" then
							p_n = replace(p_n,word(i),"<font color='#CC0000'>"+word(i)+"</font>")
							p_n = replace(p_n,lcase(word(i)),"<font color='#CC0000'>"+lcase(word(i))+"</font>")						
							p_n = replace(p_n,ucase(word(i)),"<font color='#CC0000'>"+ucase(word(i))+"</font>")						
							p_n = replace(p_n,ucase(left(trim(word(i)),1))+right(trim(word(i)),len(trim(word(i)))-1),"<font color='#CC0000'>"+ucase(left(trim(word(i)),1))+right(trim(word(i)),len(trim(word(i)))-1)+"</font>")						
							des = replace(des,word(i),"<font color='#CC0000'>"+word(i)+"</font>")
							des = replace(des,lcase(word(i)),"<font color='#CC0000'>"+lcase(word(i))+"</font>")
							des = replace(des,ucase(word(i)),"<font color='#CC0000'>"+ucase(word(i))+"</font>")
							des = replace(des,ucase(left(word(i),1))+right(trim(word(i)),len(trim(word(i)))-1),"<font color='#CC0000'>"+ucase(left(trim(word(i)),1))+right(trim(word(i)),len(word(i))-1)+"</font>")						
						end if
					next

					%><li>
					<%
					if cstr(rs1("rank"))="1" then
						%>
							<a href="dynacom.asp"><%=rs1("name")%></a>				
						<%
					end if
					if cstr(rs1("rank"))="2" then
						%>
							<a href="category.asp?cid=<%=rs1("id")%>"><%=rs1("name")%></a>				
						<%
					end if
					if cstr(rs1("rank"))="3" then
						rs2.open "select * from cat where dncat like '%|"+cstr(rs1("id"))+"|%'",conn
						if not rs2.eof then
							p_n2 = rs2("name")
							for i = lbound(word) to ubound(word)
								if trim(word(i))<>"" then
									p_n2 = replace(p_n2,word(i),"<font color='#CC0000'>"+word(i)+"</font>")
									p_n2 = replace(p_n2,lcase(word(i)),"<font color='#CC0000'>"+lcase(word(i))+"</font>")						
									p_n2 = replace(p_n2,ucase(word(i)),"<font color='#CC0000'>"+ucase(word(i))+"</font>")						
									p_n2 = replace(p_n2,ucase(left(trim(word(i)),1))+right(trim(word(i)),len(trim(word(i)))-1),"<font color='#CC0000'>"+ucase(left(trim(word(i)),1))+right(trim(word(i)),len(trim(word(i)))-1)+"</font>")						
								end if
							next
							%>
							<a href="category.asp?cid=<%=cstr(rs2("id"))%>#<%=p_n%>"><%=p_n2%> - <%=p_n%></a>				
							<%
						end if
						rs2.close
					end if
					%>
					</li><%
					rs1.movenext
				wend
				%></ul><%
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