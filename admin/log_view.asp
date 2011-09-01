<!--#include file="conn.asp"-->
<!--#include file="IsAdmin.asp" -->
<html>
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
				<table border="0" cellspacing="0" width="701" bordercolor="#000000" cellpadding="0" align="left" style="margin:0 0 0 10px; font-size:14px;">
					<thead>
				  <th colspan="4">
							<font size="4"><b>View product Log</b></font>
					</th>
					</thead>
					<tr> 
						<td width="442" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid"><strong>Part Number</strong>	
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
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center" bgcolor="#E8E8E8"><%=rs1("name")%>
						</td>
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center"><%=rs1("counts")%>
						</td>
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center"><%=rs1("dates")%>
						</td>
						<td bgcolor="#FFFCD9" style="border:1px #000000 solid"><p align="center"><a href="../distributors.asp#<%=rs1("name")%>" target="_blank">View</a> 
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
							response.write "<a href='log_view.asp?&page=1'>First</a> <a href='log_view.asp?page=" + cstr(curpage-1) + "'>Previous</a> "                                                       
						end if                                                     
		
						if  curpage = rs.pagecount then                            
							response.write "&nbsp;&nbsp;"                           
						else                                                  
							response.write "<a href='log_view.asp?page=" + cstr(curpage+1) + "'>Next</a> <a href='log_view.asp?page=" + cstr(rs1.pagecount)  + "'>Last</a></span>"                      
						end if                                                      
						%>
						</p>
						<%
					end if
				rs1.close
			end if
		rs.close
		%> 
						
						</td>
					</tfoot>

				</table>




</body>
</html>