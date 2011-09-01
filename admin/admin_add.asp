<!--#include file="IsAdmin.asp" -->

<html>
<head>
<title>Add Administrator</title>
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<form name="form1" method="post" action="admin_add2.asp">
  <table border="1" cellspacing="0" width="346" bordercolor="#000000" cellpadding="2" align="center" style="margin:100px 0px 0px 0px;">
	<thead>
		<th colspan="2" bgcolor="#FFFFCC"  style="border:0px;">
			Add New Administrator
		</th>
	</thead>
    <tr> 
      <td width="200" style="border:0px;"> 
        <div align="center">user name：</div>
      </td>
      <td width="200" style="border:0px;"> 
        <div align="center"><input type="text" name="username" size="15" maxlength="10"></div>
        <font size="2"><b> 
        <input type="hidden" name="method" value="add">
        </b></font> </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">password：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="password" name="password" size="15" maxlength="15"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">password again：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="password" name="password1" size="15" maxlength="15"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">question：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="question" size="15" maxlength="30"></div>
      </td>
    </tr>
    <tr> 
      <td style="border:0px;"> 
        <div align="center">answer：</div>
      </td>
      <td style="border:0px;"> 
        <div align="center"><input type="text" name="answer" size="15" maxlength="30"></div>
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