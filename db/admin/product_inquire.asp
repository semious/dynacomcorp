<!--#include file="conn.asp" -->
<!--#include file="IsAdmin.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<title>Products information</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%	
response.buffer="true"
dim rs1,sql
dim name,des,id

name=trim(cstr(request("name")))
des=trim(cstr(request("des")))
id=trim(cstr(request("id")))
name = replace(name,"'","''")
des = replace(des,"'","''")

set rs1 =server.createobject("adodb.recordset")
sql = "" 
if name <> "" then 
	sql = "select * from product where name like '%" + name + "%' "
end if

if des <> "" then 
	if sql = ""  and name = "" then 
		sql = "select * from product where des like '%" + des + "%' "
	else 
		sql = sql + " and des like '%" + des + "%' "
	end if
end if
	
if sql = "" then 
	sql = "select * from product"
end if


rs1.open sql,conn

if rs1.eof or rs1.bof then
	response.write"<script>alert('sorry£¬can't find what you want£¡');history.back(-1);</script>"
	response.end
end if

rs1.close
%>

<p>&nbsp;</p>
<div align="center"><center>
    <p><font size="4"><b>Product Information</b></font></p>                                  
  </center>
</div> 
<div align="center" style="width:892px; height:260px">

<div style="width:892px; height:45px; margin:0 0 0 20px;">
	<%
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,3
	if rs.eof or rs.bof then
		response.write "No infomation"
		response.End()
	else
	%>
	<table border="1" cellspacing="0" width="754" bordercolor="#000000" cellpadding="0" align="left">
		<tr> 
			<td align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><strong>Part_Num</strong></td>
			<td align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><strong>Description</strong></td>
			<td align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><b>Edit</b></td>
			<td align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><b>View</b></td>
		</tr>
	<%         
	dim curpage, i  
	if request("page")="" then 
		curpage = 1        
	else                        
		curpage = cint(request("page"))         
	end if                                   
	rs.pagesize = 15                 
	rs.absolutepage = curpage         
	for i = 1 to rs.pagesize    
	%> 
		<tr> 
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:left" bgcolor="#E8E8E8"><%=rs("name")%>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:left" ><a href="product_inquire.asp?action=search&id=<%=rs("id")%>&page=<%=curpage%>&name=<%=replace(name,"''","'")%>&des=<%=replace(unescape(des),"''","'")%>"><%=unescape(rs("des"))%></a>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:left" ><a href="product_edit.asp?action=edit&id=<%=rs("id")%>">Edit</a> 
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:left" ><a href="../product.asp?pid=<%=rs("id")%>" target="_blank">View</a> 
		  	</td>
		</tr>
		<%
		rs.movenext
		if rs.eof then       
		i = i + 1              
		exit for               
		end if                      
		next
		%> 
	</table> 
</div>
  		<%                                                           
		response.write "<hr /><span style='text-align:right;font-size:12px;'>" 
		response.write cstr(curpage) + " page/Total " + cstr(rs.pagecount) + " page(s)<p>"      
		if curpage = 1 then                                                        
			response.write "&nbsp;&nbsp;"                                      
		else                                                                    
			response.write "<a href='product_inquire.asp?name="+name+"&des="+des+"&id="+id+"&page=1'>First</a> <a href='product_inquire.asp?name="+name+"&des="+des+"&id="+id+"&page=" + cstr(curpage-1) + "'>Previous</a> "                                                       
		end if                                                     
		if  curpage = rs.pagecount then                            
			response.write "&nbsp;&nbsp;"                           
		else                                                  
			response.write "<a href='product_inquire.asp?name="+name+"&des="+des+"&id="+id+"&page=" + cstr(curpage+1) + "'>Next</a> <a href='product_inquire.asp?name="+name+"&des="+des+"&id="+id+"&page=" + cstr(rs.pagecount)  + "'>Last</a></span>"                      
		end if                                                      
	rs.close 
 end if  
%>

<%
	action=trim(request("action"))
	if action="search" then
		set fs=server.createobject("adodb.recordset")
		sql="select * from product where id = "+ id +""
		fs.open sql,conn,1,3
%>

    <table border="1" cellspacing="0" width="668" bordercolor="#000000" cellpadding="1" align="left" style="margin:0 0 0 10px; font-size:14px;">
		<tr>
			<td width="15%"></td>
			<td width="35%"></td>
			<td width="15%"></td>
			<td width="35%"></td>		
		</tr>
      <tr align="center"> 
        <td colspan="4" height="20" style="border:1 solid #000000"> 
          <div align="center"><font color="#FF0000"><b>Detail Information</b></font></div> 
        </td>
      </tr>
      <tr align="center"> 
        <td width="110" style="border:1 solid #000000"> 
          	<div align="right">Part_number:</div>
        </td>
        <td colspan="3" style="border:1 solid #000000;padding:0 0 0 10px;">
			<div align="left"><%=fs("name")%></div>
        </td>
       </tr>
	   <tr>
		<td width="94" style="border:1 solid #000000"> 
          <div align="right">Description:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><%=unescape(fs("des"))%></div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1 solid #000000"> 
          <div align="right">Short Desc.:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><%=fs("s_des")%>&nbsp;</div>
        </td>
      </tr>
      <tr> 
		<td width="110" style="border:1 solid #000000"> 
			  <div align="right">Picture1:</div>
		</td>
        <td width="210" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          	<div align="left"><%=fs("pic1")%>&nbsp;</div>
        </td>
        <td width="94" style="border:1 solid #000000"> 
          <div align="right">Picture2:</div>
        </td>
        <td width="244" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><%=fs("pic2")%>&nbsp;</div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1 solid #000000"> 
          <div align="right">Picture3:</div>
        </td>
        <td width="210" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><%=fs("pic3")%>&nbsp;</div>
        </td>
        <td width="94" style="border:1 solid #000000"> 
          <div align="right">Picture4:</div>
        </td>
        <td width="244" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><%=fs("pic4")%>&nbsp;</div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1 solid #000000"> 
          <div align="right">Picture5:</div>
        </td>
        <td width="210" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><%=fs("pic5")%>&nbsp;</div>
        </td>
        <td width="94" style="border:1 solid #000000"> 
          <div align="right">Picture6:</div>
        </td>
        <td width="244" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><%=fs("pic6")%>&nbsp;</div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1 solid #000000"> 
          <div align="right">Introduction:</div>
        </td>
        <td width="210" style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3"> 
          <div align="left"><%=unescape(fs("intro"))%>&nbsp;</div>
        </td>
      </tr>
		<tr> 
			<td width="110" style="border:1 solid #000000"> 
				<div align="right">Video:</div>
			</td>
			<td style="border:1 solid #000000;padding:0 0 0 10px;"> 
				<div align="left"><%=fs("video")%>&nbsp;</div>
			</td>                  
			<td style="border:1 solid #000000"> 
				<div align="right">Cut Sheet:</div>
			</td>                  
			<td style="border:1 solid #000000;padding:0 0 0 10px;"> 
				<div align="left"><%=fs("pdf")%>&nbsp;</div>
			</td>                  
		</tr>
	  	<tr>
			<td style="border:1 solid #000000"> 
				<div align="right">Menu1:</div>
			</td>
			<td style="border:1 solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
			  <%
			  if not len(fs("menu1")) = 0  then
				  rs1.open "select * from cat where id="+fs("menu1")+"",conn
					if not rs1.eof then
						%><%=rs1("name")%><%
					else
						%>&nbsp;<%
				  end if
				  rs1.close
			  else
			  	%>&nbsp;<%
			  end if
			  %>
			</td>
			<td style="border:1 solid #000000"> 
			  <div align="right">Menu2:</div>
			</td>
			<td style="border:1 solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">			  
			  <%
			  if not len(fs("menu2")) = 0  then
				  rs1.open "select * from cat where id="+cint(fs("menu2"))+"",conn
					if not rs1.eof then
						%><%=rs1("name")%><%
					else
						%>&nbsp;<%
				  end if
				  rs1.close
			  else
			  	%>&nbsp;<%
			  end if
			  %>
			</div>
			</td>
		</tr>   
	  	<tr>
			<td style="border:1 solid #000000"> 
				<div align="right">Menu3:</div>
			</td>
			<td style="border:1 solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
			  <%
			  if not len(trim(fs("menu3"))) = 0  then
				  rs1.open "select * from cat where id="+fs("menu3")+"",conn
					if not rs1.eof then
						%><%=rs1("name")%><%
					else
						%>&nbsp;<%
				  end if
				  rs1.close
			  end if
			  %>
			  </div>
			</td>
			<td style="border:1 solid #000000"> 
			  <div align="right">Menu4:</div>
			</td>
			<td style="border:1 solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
			  <%
			  if not len(fs("menu4")) = 0  then
				  rs1.open "select * from cat where id="+fs("menu4")+"",conn
					if not rs1.eof then
						%><%=rs1("name")%><%
					else
						%>&nbsp;<%
				  end if
				  rs1.close
			  end if
			  %>			  
			  </div>
			</td>
		</tr>   
	  	<tr>
			<td style="border:1 solid #000000"> 
				<div align="right">Avail. Color:</div>
			</td>
			<td colspan="3" style="border:1 solid #000000;padding:0 0 0 10px;"> 
			  <div align="left"><%=join(split(fs("color"),"|")," ")%>&nbsp;</div>
			</td>
		</tr>
    </table>
</div> 
 
<%
	fs.close
	end if
%>
</body>
</html>