<!--#include file="conn.asp" -->
<!--#include file="IsAdmin.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<title>Stores information</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%	
response.buffer="true"
dim rs1,sql
dim name,des,id

name=trim(cstr(request("name")))
zone=trim(cstr(request("zone")))
id=trim(cstr(request("id")))
set rs1 =server.createobject("adodb.recordset")
sql = "" 
if name <> "" then 
	sql = "select * from distributor where name like '%" + name + "%' "
end if

if zone <> "" then 
	if sql = ""  and name = "" then 
		sql = "select * from distributor where [zone] like '%" + zone + "%' "
	else 
		sql = sql + " and [zone] like '%" + zone + "%' "
	end if
end if
	
if sql = "" then 
	sql = "select * from distributor"
end if

sql = sql + " order by [zone]"

rs1.open sql,conn,1,3

if rs1.eof then
	response.write"<script>alert('sorry£¬can't find what you want£¡');history.back(-1);</script>"
	response.end
end if

rs1.close
%>

<p>&nbsp;</p>
<div align="center"><center>
    <p><font size="4"><b>Store Information</b></font></p>                                  
  </center>
</div> 
<div align="center" style="width:892px; height:260px">

<div style="width:892px; height:45px; margin:0 0 0 20px;">
	<%
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,3
	if rs.eof and rs.bof then
		response.write "No infomation"
	else
	%>
	<table border="1" cellspacing="0" width="754" bordercolor="#000000" cellpadding="0" align="left">
		<tr> 
			<td width="162" align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><strong>Store Name</strong></td>
			<td width="282" align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><strong>Address</strong></td>
			<td width="120" align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><strong>Telphone</strong></td>

			<td width="80" align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><strong>Zone</strong></td>
			<td width="48" align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><b>Edit</b></td>
			<td width="48" align="center" bgcolor="#FEEC85" style="border:1 solid #000000"><b>View</b></td>
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
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:center" bgcolor="#E8E8E8"><a href="store_inquire.asp?action=search&id=<%=rs("id")%>&page=<%=curpage%>&name=<%=name%>&zone=<%=zone%>"><%=rs("name")%></a></p>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:left" ><%=rs("address")%></p>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:center" ><%=rs("tel")%></p>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:center" ><%=rs("zone")%></p>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:center" ><a href="store_edit.asp?action=edit&id=<%=rs("id")%>">Edit</a></p>
		  	</td>
			<td bgcolor="#FFFCD9" style="border:1 solid #000000"> 
				<p style="font-size:12px;padding:2px 0 2px 10px;text-align:center" ><a href="../distributors.asp#<%=rs("name")%>" target="_blank">View</a> </p>
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
			response.write "<a href='store_inquire.asp?name="+name+"&zone="+zone+"&id="+id+"&page=1'>First</a> <a href='store_inquire.asp?name="+name+"&zone="+zone+"&id="+id+"&page=" + cstr(curpage-1) + "'>Previous</a> "                                                       
		end if                                                     
		if  curpage = rs.pagecount then                            
			response.write "&nbsp;&nbsp;"                           
		else                                                  
			response.write "<a href='store_inquire.asp?name="+name+"&zone="+zone+"&id="+id+"&page=" + cstr(curpage+1) + "'>Next</a> <a href='store_inquire.asp?name="+name+"&zone="+zone+"&id="+id+"&page=" + cstr(rs.pagecount)  + "'>Last</a></span>"                      
		end if                                                      
	rs.close 
 end if  
%>

<%
	action=trim(request("action"))
	if action="search" then
		set fs=server.createobject("adodb.recordset")
		sql="select * from distributor where id = " & id
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
          	<div align="right">Store Name:</div>
        </td>
        <td colspan="3" style="border:1 solid #000000;padding:0 0 0 10px;">
			<div align="left"><%=fs("name")%></div>
        </td>
       </tr>
	   <tr>
		<td width="94" style="border:1 solid #000000"> 
          <div align="right">Address1:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><%=unescape(fs("address"))%>&nbsp;</div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1 solid #000000"> 
          <div align="right">Address2:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><%=unescape(fs("address1"))%>&nbsp;</div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1 solid #000000"> 
          <div align="right">Address3:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><%=unescape(fs("address2"))%>&nbsp;</div>
        </td>
      </tr>
      <tr> 
		<td width="110" style="border:1 solid #000000"> 
			  <div align="right">Picture:</div>
		</td>
        <td width="210" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          	<div align="left"><%=fs("pic")%>&nbsp;</div>
        </td>
        <td width="94" style="border:1 solid #000000"> 
          <div align="right">Telephone:</div>
        </td>
        <td width="244" style="border:1 solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><%=fs("tel")%>&nbsp;</div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1 solid #000000"> 
          <div align="right">Zone:</div>
        </td>
        <td width="210" style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3"> 
          <div align="left"><%=fs("zone")%>&nbsp;</div>
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