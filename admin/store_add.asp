<!--#include file="IsAdmin.asp" -->
<html>
<head>
<title>Add New Product</title>
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<script type="text/javascript" language="javascript">
function selPic(_obj){
	document.getElementById("pic_a").href=_obj.src;
	document.getElementById("pic_src").src=_obj.src;
	document.getElementById("pic_src").alt=_obj.alt;
}
function validate(){
	alert();
	return false;
}

</script>
</head>

<body>
<form name="form1" method="post" action="store_add2.asp">
  <table border="1" cellspacing="0" width="346" bordercolor="#000000" cellpadding="2" align="center" style="margin:100px 0px 0px 0px;">
	<thead>
		<th colspan="2" bgcolor="#FFFFCC"  style="border:0px;">
			Add New Store
		</th>
	</thead>
    <tr> 
      <td width="200" style="border:0px;"> 
        <div align="center">Store name：</div>
      </td>
      	<td width="200" style="border:0px;"> 
        <div align="center"><input type="text" name="name" size="15" maxlength="50"></div>
		</td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">Picture：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="pic" size="15" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">Address1：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="address" size="15" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">Address2：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="address1" size="15" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">Address3：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="address2" size="15" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">Telephone：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="tel" size="15" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">Zone：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="zone" size="15" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
		<td style="border:0px;"> 
      		<div align="center"> 
        		<input type="submit" name="submit" value="add">
			</div>
		</td>
		<td style="border:0px;">
			<div align="center">
          		<input type="reset" name="submit2" value="reset">
			</div>
		</td>
    </tr>
  </table>   
</form>

</body>
</html>
