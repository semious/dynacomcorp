<!--#include file="conn.asp"-->
<!--#include file="IsAdmin.asp" -->
<html>
<head>
<meta http-equiv="content-type" content="text/html">
<title>Edit Product page</title>
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
	rs.open "select * from cat where p_id like '%|"+id+"|%'",conn
	if not rs.eof then
		response.Write("<script>alert('sorry£¬a menu named "+trim(cstr(rs("name")))+" has this product which you want to delete,so you must remove this product from this menu first£¡');history.back(-1);</script>")
		response.End()
	else
		sql = "delete from product where id = " & id
		conn.execute sql
		response.Write("<div style='margin:50px 0 0 200px;font-weight:bold;'>Product has been deleted.</div>")
		response.End()
	end if
	rs.close
end if

%> 
<script language="javascript">
function confirmDel(id,page){
if (confirm("Are you sure?")){
	window.location.href = "product_edit.asp?action=delete&id=" + id+ "&page="+page ;
  	}
}
function checkdata() {
     if (document.DocForm.name.value.length ==0 ) {
       alert("part_num should not be left blank!")
       document.DocForm.name.focus()
       return false;
      }
     if (document.DocForm.des.value.length ==0) {
       alert("description should not be left blank!")
       document.DocForm.des.focus()
       return false;
      }
     if (document.DocForm.pic1.value.length ==0 ) {
       alert("You must have a picture at least!")
       document.DocForm.pic1.focus()
       return false;
      }
     if (document.DocForm.pdf.value.length ==0) {
       alert("Lack of a pdf file!")
       document.DocForm.pdf.focus()
       return false;
      }
     return true;
}
//window.onload = function(){
////	document.forms[0]["des"].value = unescape(document.forms[0]["des"].value);
//}
</script>
<div align="center">
    <p><font size="4"><b>Product Information</b></font></p>
</div> 

<div>
 <%
	if edit="edit" then
		sql="select * from product where id = " + id + " "
	else
		sql="select top 1 * from product"
	end if
	rs.open sql,conn,1,3
	
	if rs.eof and rs.bof then
		response.write "No product"
		response.End()
	else
%>
      <table border="1px" cellspacing="0" width="696" bordercolor="#000000" cellpadding="0" align="left" style="margin:0 0 0 10px; font-size:14px;">
        <tr> 
        	<td width="100" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
		  		<strong>Part_Num</strong></td>
       	  	<td width="436" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<strong>Description</strong></td>
       	  	<td width="50" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
				<b>Del</b></td>
          	<td width="48" align="center" bgcolor="#FEEC85" style="border:1px #000000 solid">
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
            	<p align="center"><a href="product_edit.asp?action=edit&id=<%=rs("id")%>"><%=unescape(rs("des"))%></a>
          	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><a href='javascript:confirmDel(<%= rs("id")%>,<%=cstr(curpage)%>)'>Del</a>
       	  	</td>
          	<td bgcolor="#FFFCD9" style="border:1px #000000 solid"> 
            	<p align="center"><a href="../product.asp?pid=<%=rs("id")%>" target="_blank">View</a> 
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
		sql="select * from product where id = "+ id +""
		fs.open sql,conn,1,3
%>
</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<form onSubmit="return checkdata()" name="DocForm" action="product_add2.asp">
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
          	<div align="right">Part_Number:</div>
        </td>
        <td colspan="3" style="border:1px solid #000000;padding:0 0 0 10px;">
			<div align="left"><input name="name" value="<%=fs("name")%>" size="60" maxlength="50" /></div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1px solid #000000"> 
          <div align="right">Description:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><textarea name="des" cols="60" rows="1"><%=unescape(fs("des"))%></textarea></div>
        </td>
      </tr>
	   <tr>
		<td width="94" style="border:1px solid #000000"> 
          <div align="right">Short Desc.:</div>
        </td>
        <td style="border:1 solid #000000;padding:0 0 0 10px;" colspan="3" align="left"> 
          	<div align="left"><textarea name="s_des" cols="60" rows="1"><%=fs("s_des")%></textarea></div>
        </td>
      </tr>
      <tr> 
		<td width="110" style="border:1px solid #000000"> 
			  <div align="right">Picture1:</div>
		</td>
        <td width="210" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          	<div align="left"><input name="pic1" value="<%=fs("pic1")%>" size="20" maxlength="50" /></div>
        </td>
        <td width="94" style="border:1px solid #000000"> 
          <div align="right">Picture2:</div>
        </td>
        <td width="244" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><input name="pic2" value="<%=fs("pic2")%>" size="20" maxlength="50" /></div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1px solid #000000"> 
          <div align="right">Picture3:</div>
        </td>
        <td width="210" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><input name="pic3" value="<%=fs("pic3")%>" size="20" maxlength="50" /></div>
        </td>
        <td width="94" style="border:1px solid #000000"> 
          <div align="right">Picture4:</div>
        </td>
        <td width="244" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><input name="pic4" value="<%=fs("pic4")%>" size="20" maxlength="50" /></div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1px solid #000000"> 
          <div align="right">Picture5:</div>
        </td>
        <td width="210" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><input name="pic5" value="<%=fs("pic5")%>" size="20" maxlength="50" /></div>
        </td>
        <td width="94" style="border:1px solid #000000"> 
          <div align="right">Picture6:</div>
        </td>
        <td width="244" style="border:1px solid #000000;padding:0 0 0 10px;"> 
          <div align="left"><input name="pic6" value="<%=fs("pic6")%>" size="20" maxlength="50" /></div>
        </td>
      </tr>
      <tr> 
        <td width="110" style="border:1px solid #000000"> 
          <div align="right">Introduction:</div>
        </td>
        <td width="210" style="border:1px solid #000000;padding:0 0 0 10px;" colspan="3"> 
		  <%dim intro 
		  intro=replace(fs("intro"),"<pre>","") 
		  intro=replace(intro,"</pre>","")
		  %>
          <div align="left"><textarea rows="10" id="intro" cols="60" name="intro"><%=intro%></textarea></div>
        </td>
      </tr>
		<tr> 
			<td width="110" style="border:1px solid #000000"> 
				<div align="right">Video:</div>
			</td>
			<td style="border:1px solid #000000;padding:0 0 0 10px;"> 
				<div align="left"><input name="video" value="<%=fs("video")%>" size="20" maxlength="100"/></div>
			</td>                  
			<td style="border:1px solid #000000"> 
				<div align="right">Specification:</div>
			</td>                  
			<td style="border:1px solid #000000;padding:0 0 0 10px;"> 
				<div align="left"><input name="pdf" value="<%=fs("pdf")%>" size="20" maxlength="50" /></div>
			</td>                  
		</tr>
	  	<tr>
			<td style="border:1px solid #000000"> 
				<div align="right">Menu1:</div>
			</td>
			<td style="border:1px solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
				<%
				rs.open "select * from cat where rank = '2'",conn
				if not rs.eof then
					%><select name="menu1" style="width:150px;"><option value=" ">   </option><%
					while not rs.eof
						if cstr(rs("id"))=cstr(fs("menu1")) then
							%><option value="<%=trim(cstr(rs("id")))%>" selected="selected"><%=rs("name")%></option><%
						else
							%><option value="<%=trim(cstr(rs("id")))%>"><%=rs("name")%></option><%							
						end if
						rs.movenext
					wend
					%></select><%
				end if
				rs.close
				%>			  
			</td>
			<td style="border:1px solid #000000"> 
			  <div align="right">Menu2:</div>
			</td>
			<td style="border:1px solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
				<%
				rs.open "select * from cat where rank = '2'",conn
				if not rs.eof then
					%><select name="menu2" style="width:150px;"><option value=" ">   </option><%
					while not rs.eof
						if cstr(rs("id"))=cstr(fs("menu2")) then
							%><option value="<%=trim(cstr(rs("id")))%>" selected="selected"><%=rs("name")%></option><%
						else
							%><option value="<%=trim(cstr(rs("id")))%>"><%=rs("name")%></option><%							
						end if
						rs.movenext
					wend
					%></select><%
				end if
				rs.close
				%>			  
			  </div>
			</td>
		</tr>   
	  	<tr>
			<td style="border:1px solid #000000"> 
				<div align="right">Menu3:</div>
			</td>
			<td style="border:1px solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
				<%
				rs.open "select * from cat where rank = '2'",conn
				if not rs.eof then
					%><select name="menu3" style="width:150px;"><option value=" ">   </option><%
					while not rs.eof
						if cstr(rs("id"))=cstr(fs("menu3")) then
							%><option value="<%=trim(cstr(rs("id")))%>" selected="selected"><%=rs("name")%></option><%
						else
							%><option value="<%=trim(cstr(rs("id")))%>"><%=rs("name")%></option><%	
						end if						
						rs.movenext
					wend
					%></select><%
				end if
				rs.close
				%>			  
			  </div>
			</td>
			<td style="border:1px solid #000000"> 
			  <div align="right">Menu4:</div>
			</td>
			<td style="border:1px solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
				<%
				rs.open "select * from cat where rank = '2'",conn
				if not rs.eof then
					%><select name="menu4" style="width:150px;"><option value=" ">   </option><%
					while not rs.eof
						if cstr(rs("id"))=cstr(fs("menu4")) then
							%><option value="<%=trim(cstr(rs("id")))%>" selected="selected"><%=rs("name")%></option><%
						else
							%><option value="<%=trim(cstr(rs("id")))%>"><%=rs("name")%></option><%	
						end if						
						rs.movenext
					wend
					%></select><%
				end if
				rs.close
				%>			  
			  </div>
			</td>
		</tr>   
	  	<tr>
			<td style="border:1px solid #000000"> 
				<div align="right">Avail. Color:</div>
			</td>
			<td colspan="3" style="border:1px solid #000000;padding:0 0 0 10px;"> 
			  <div align="left">
			  		<%
						if InStr(fs("color"),"BK") >0 then
							%>
							<input type="checkbox" name="bk" id="bk" value="BK" checked="checked">BK
							<%
							else
							%>
							<input type="checkbox" name="bk" id="bk" value="BK">BK
							<%
						end if
						if InStr(fs("color"),"WH") >0 then
							%>
							<input type="checkbox" name="wh" id="wh" value="WH" checked="checked">WH
							<%
							else
							%>
							<input type="checkbox" name="wh" id="wh" value="WH">WH
							<%
						end if
						if InStr(fs("color"),"PR") >0 then
							%>
							<input type="checkbox" name="pr" id="pr" value="PR" checked="checked">PR
							<%
							else
							%>
							<input type="checkbox" name="pr" id="pr" value="PR">PR
							<%
						end if
						if InStr(fs("color"),"BL") >0 then
							%>
							<input type="checkbox" name="bl" id="bl" value="BL" checked="checked">BL
							<%
							else
							%>
							<input type="checkbox" name="bl" id="bl" value="BL">BL
							<%
						end if
						if InStr(fs("color"),"AL") >0 then
							%>
							<input type="checkbox" name="al" id="al" value="AL" checked="checked">AL
							<%
							else
							%>
							<input type="checkbox" name="al" id="al" value="AL">AL
							<%
						end if
						if InStr(fs("color"),"GN") >0 then
							%>
							<input type="checkbox" name="gn" id="gn" value="GN" checked="checked">GN
							<%
							else
							%>
							<input type="checkbox" name="gn" id="gn" value="GN">GN
							<%
						end if
						if InStr(fs("color"),"GY") >0 then
							%>
							<input type="checkbox" name="gy" id="gy" value="GY" checked="checked">GY
							<%
							else
							%>
							<input type="checkbox" name="gy" id="gy" value="GY">GY
							<%
						end if

						if InStr(fs("color"),"IV") >0 then
							%>
							<input type="checkbox" name="iv" id="iv" value="IV" checked="checked">IV
							<%
							else
							%>
							<input type="checkbox" name="iv" id="iv" value="IY">IV
							<%
						end if

						if InStr(fs("color"),"OR") >0 then
							%>
							<input type="checkbox" name="orange" id="or" value="OR" checked="checked">OR
							<%
							else
							%>
							<input type="checkbox" name="oragne" id="or" value="OR">OR
							<%
						end if

						if InStr(fs("color"),"RD") >0 then
							%>
							<input type="checkbox" name="rd" id="rd" value="RD" checked="checked">RD
							<%
							else
							%>
							<input type="checkbox" name="rd" id="rd" value="RD">RD
							<%
						end if

						if InStr(fs("color"),"YL") >0 then
							%>
							<input type="checkbox" name="yl" id="yl" value="YL" checked="checked">YL
							<%
							else
							%>
							<input type="checkbox" name="yl" id="yl" value="YL">YL
							<%
						end if
					%>
</div>
			</td>
		</tr>   

      <tr> 
        <td colspan="4" width="664"> 
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