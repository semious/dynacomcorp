<!--#include file="IsAdmin.asp" -->

<html>
<head>
<title>Add New Category</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>
<form name="form1" method="post" action="cat_add2.asp">
  <table border="1" cellspacing="0" width="346" bordercolor="#000000" cellpadding="2" align="center" style="margin:100px 0px 0px 50px;">
	<thead>
		<th colspan="2" bgcolor="#FFFFCC"  style="border:1px solid #000000;">
			Add New Category
		</th>
	</thead>
    <tr> 
      <td width="117" style="border:1px solid #000000;"> 
        <div style="margin:0 0 0 20px;" align="left">name£º</div>
      </td>
      <td width="211" style="border:1px solid #000000;"> 
        <div align="center"><input type="text" name="name" size="30" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:1px solid #000000;margin:0 0 0 20px;"> 
        <div style="margin:0 0 0 20px;" align="left">picture£º</div>
      </td>
      <td style="border:1px solid #000000;"> 
        <div align="center"><input type="text" name="pic" size="30" maxlength="50"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:1px solid #000000;"> 
        <div style="margin:0 0 0 20px;" align="left">description£º</div>
      </td>
      <td style="border:1px solid #000000;"> 
        <div align="center"><input type="text" name="des" size="30" maxlength="100"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:1px solid #000000;margin:0 0 0 20px;"> 
        <div style="margin:0 0 0 20px;" align="left">level£º</div>
      </td>
      <td style="border:1px solid #000000;"> 
      	<div align="left"><select name="rank"><option>1</option><option>2</option><option>3</option></select></div>
      </td>
    </tr>
    <tr> 
      <td style="border:1px solid #000000;margin:0 0 0 20px;" colspan="2"> 
        <input type="submit" value="done" />
      </td>
    </tr>

  </table>   
</form>


</body>
</html>