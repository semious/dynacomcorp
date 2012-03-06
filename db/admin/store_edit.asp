<!--#include file="conn.asp"-->
<!--#include file="IsAdmin.asp" -->
<html>
<head>
<title>Edit Store</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
Response.Buffer = True 
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = no-cache 	

dim edit,id,sql
dim rs
dim flag
flag=0
set rs =server.createobject("adodb.recordset")
edit=trim(request("action"))
id=trim(cstr(request("id")))
'delete item
if edit = "delete" then
	sql = "delete from distributor where id = " & id
	conn.execute sql
	response.Write("<div style='margin:50px 0 0 200px;font-weight:bold;'>This Store has been deleted.</div>")
	response.End()
end if

%> 
<script language="javascript">
function confirmDel(id,page){
if (confirm("Are you sure?")){
	window.location.href = "store_edit.asp?action=delete&id=" + id+ "&page="+page ;
  	}
}
function checkdata() {
     if (document.DocForm.name.value.length ==0 ) {
       alert("Store should not be left blank!")
       document.DocForm.name.focus()
       return false;
      }
     if (document.DocForm.address.value.length ==0) {
       alert("address should not be left blank!")
       document.DocForm.address.focus()
       return false;
      }
     if (document.DocForm.pic.value.length ==0 ) {
       alert("You must have a picture !")
       document.DocForm.pic.focus()
       return false;
      }
     if (document.DocForm.tel.value.length ==0) {
       alert("telephone number should not be left blank!")
       document.DocForm.tel.focus()
       return false;
      }
     if (document.DocForm.zone.value.length ==0) {
       alert("zone should not be left blank!")
       document.DocForm.zone.focus()
       return false;
      }

     return true;
}
//window.onload = function(){
////	document.forms[0]["des"].value = unescape(document.forms[0]["des"].value);
//}
</script>
<div align="center">
    <p><font size="4"><b>Store Information</b></font></p>
</div> 

<div>
 <%
	if edit="edit" then
		sql="select * from distributor where id = " & id
	else
		sql="select top 1 * from distributor"
	end if
	rs.open sql,conn,1,3
	
	if rs.eof and rs.bof then
		response.write "No Information"
		response.End()
	else
%>
      <table border="1px" cellspacing="0" width="754" bordercolor="#000000" cellpadding="0" align="left" style="margin:0 0 0 10px; font-size:14px;">
        <tr> 
        	<td width="161" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
		  		<strong>Store Name</strong>	</td>
       	  	<td width="241" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<strong>Address</strong></td>
       	  	<td width="120" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<b>Telephone</b></td>
       	  	<td width="80" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<b>Zone</b></td>
       	  	<td width="40" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<b>Del</b></td>
          	<td width="40" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<b>View</b></td>
        </tr>
<%         
	dim curpage,i  
	if request("page")="" then 
		curpage = 1        
	else                        
		curpage = cint(request("page"))         
	end if                                   
		rs.pagesize = 12                 
		rs.absolutepage = curpage         
		for i = 1 to rs.pagesize    
%> 
        <tr> 
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center" bgcolor="#E8E8E8"><%=rs("name")%>
          	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><%=rs("address")%>
          	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><%=rs("tel")%>
          	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><%=rs("zone")%>
          	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><a href='javascript:confirmDel(<%= rs("id")%>,<%=cstr(curpage)%>)'>Del</a>
       	  	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><a href="../distributors.asp#<%=rs("name")%>" target="_blank">View</a> 
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
<p>
  <%                                                           
	rs.close 
 end if  
	if edit="edit" then
		set fs=server.createobject("adodb.recordset")
		sql="select * from distributor where id = " & id
		fs.open sql,conn,1,3
%>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form onSubmit="return checkdata()" name="DocForm" action="store_add2.asp">
    <table border="1" cellspacing="0" width="668" bordercolor="#000000" cellpadding="1" style="margin:0 0 0 20px;font-size:14px;">
		<tr>
			<td width="15%"></td>
			<td width="35%"></td>
			<td width="15%"></td>
			<td width="35%"></td>		
		</tr>
      <tr align="center"> 
        <td colspan="4" height="20" style="border:1px solid #000000; background-color:FEEC85"> 
          <div align="center"><font color="#FF0000"><b>Detail Information</b></font></div> 
        </td>
      </tr>
      <tr align="center"> 
        <td width="110" style="border:1px solid #000000"> 
          	<div align="right">Store Name:</div>
        </td>
        <td colspan="3" style="border:1px solid #000000;padding:0 0 0 10px;">
			<div align="left"><input name="name" value="<%=fs("name")%>" size="60" /></div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1px solid #000000"> 
          <div align="right">Address1:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><textarea name="address" cols="60" rows="1"><%=fs("address")%></textarea></div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1px solid #000000"> 
          <div align="right">Address2:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><textarea name="address1" cols="60" rows="1"><%=fs("address1")%></textarea></div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1px solid #000000"> 
          <div align="right">Address3:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><textarea name="address2" cols="60" rows="1"><%=fs("address2")%></textarea></div>
        </td>
      </tr>
      <tr> 
		<td width="110" style="border:1px solid #000000"> 
			  <div align="right">Picture:</div>
		</td>
        <td width="210" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          	<div align="left"><input name="pic" value="<%=fs("pic")%>" size="20" /></div>
        </td>
        <td width="94" style="border:1px solid #000000"> 
          <div align="right">Telephone:</div>
        </td>
        <td width="244" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><input name="tel" value="<%=fs("tel")%>" size="20" /></div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1px solid #000000"> 
          <div align="right">Zone:</div>
        </td>
        <td width="210" style="border:1px solid #000000;padding:0 0 0 10px;" colspan="3"> 
          <div align="left"><input name="zone" value="<%=fs("zone")%>" size="20" />&nbsp;</div>
        </td>
      </tr>
      <tr> 
        <td colspan="4" width="664" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="center"> 
            <input type="hidden" name="action" value="editsave">
            <input type="hidden" name="id" value=<%=id%>>
            <input type="hidden" name="page" value="<%=curpage%>">
            <input type="submit" name="Submit" value=" Done">
          </div>
        </td>
      </tr>
    </table>
</form>
	
</div> 
 
<%end if%>

</body>
</html>