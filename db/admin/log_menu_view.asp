<!--#include file="conn.asp"-->
<!--#include file="IsAdmin.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>View Log</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = no-cache 	

dim edit,id,sql
dim rs,rs1
dim flag
set rs =server.createobject("adodb.recordset")
set rs1 =server.createobject("adodb.recordset")
edit=trim(request("action"))
id=trim(cstr(request("id")))
rs.open "select * from log where kind = 'menu' order by dates desc",conn
	if not rs.eof then
		rs1.open "select * from log where kind = 'menu' and dates = '"+rs("dates")+"' order by counts desc",conn,1,3
		if not rs1.eof then
			%>
			<div style="width:100%">
				<table border="0" cellspacing="0" width="701" bordercolor="#000000" cellpadding="0" align="left" style="margin:0 0 0 10px; font-size:14px;">
					<thead>
						<th colspan="4">
							<font size="4"><b>View menu Log</b></font>
						</th>
					</thead>
					<tr> 
						<td width="442" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid"><strong>Menu Number</strong>	
						</td>
						<td width="96" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid"><strong>Counts</strong>
						</td>
						<td width="89" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid"><b>Date</b>
						</td>
						<td width="72" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid"><b>Detail</b>
						</td>
					</tr>
					<%         
					dim curpage,i  
					if request("page")="" then 
						curpage = 1        
					else                        
						curpage = cint(request("page"))         
					end if                                   
					rs1.pagesize = 10                 
					rs1.absolutepage = curpage         
					for i = 1 to rs1.pagesize    
					%> 
					<tr> 
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center" ><%=rs1("name")%>
						</td>
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center"><%=rs1("counts")%>
						</td>
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center"><%=rs1("dates")%>
						</td>
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center"><a href="log_menu_view.asp?action=search&name=<%=rs1("name")%>">View</a> 
						</td>
					</tr>
					<%
					rs1.movenext
					if rs1.eof then       
						i = i + 1              
						exit for               
					end if                      
					next
					%> 
					<tfoot>
						<td colspan="4" align="right" style="border:0px; text-align:right;">
						  <%                                                           
						response.write cstr(curpage) + " page/Total " + cstr(rs1.pagecount) + " page(s)<p>"      
						if curpage = 1 then
							response.write "&nbsp;&nbsp;"                                      
						else                                                                    
							response.write "<a href='log_menu_view.asp?&page=1'>First</a> <a href='log_menu_view.asp?page=" + cstr(curpage-1) + "'>Previous</a> "                    
						end if                                                     
		
						if  curpage = rs1.pagecount then                            
							response.write "&nbsp;&nbsp;"                           
						else                                                  
							response.write "<a href='log_menu_view.asp?page=" + cstr(curpage+1) + "'>Next</a> <a href='log_menu_view.asp?page=" + cstr(rs1.pagecount)  + "'>Last</a></span>"
						end if                                                      
			end if
			rs1.close
						%></td>
						</tfoot>
					</table>
				</div>
				<%
	end if
rs.close
	
	action=trim(request("action"))
	if action="search" then
		set fs=server.createobject("adodb.recordset")
		dim name 
		name = trim(request("name"))
		sql="select * from log where name = '"+ trim(cstr(name)) +"' order by dates desc"
		fs.open sql,conn
		if not fs.eof then
%>
	<div style="float:left">
    <table border="1" cellspacing="0" width="600" bordercolor="#000000" cellpadding="1" align="left" style="margin:0 0 0 10px; font-size:14px;">
      <tr align="center"> 
        <td colspan="12" height="20" style="border:1px solid #000000"> 
          <div align="center"><font color="#FF0000"><b>Detail Information</b></font></div> 
        </td>
      </tr>
      <tr align="center"> 
			<td width="20%" style="border:1px solid #000000"> 
				<div align="right">Part_number:</div>
		</td>
			<td colspan="3" style="border:1px solid #000000;padding:0 0 0 10px;" width="45%">
				<div align="left"><%=fs("name")%></div>
			</td>
			<td width="65" style="border:1px solid #000000" width="5%"> 
				<div align="right">Counts:</div>
		</td>
			<td colspan="3" style="border:1px solid #000000;padding:0 0 0 10px;" width="10%">
				<div align="left"><%=fs("counts")%></div>
			</td>
			<td width="41" style="border:1px solid #000000" width="10%"> 
				<div align="right">Date:</div>
		</td>
			<td width="73" colspan="3" style="border:1px solid #000000;" width="10%">
				<div align="left"><%=fs("dates")%></div>
		</td>
			
      </tr>
    </table>
</div> 
 
<%
	end if
	fs.close
	end if
%>
				




</body>
</html>