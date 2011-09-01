<!--#include file="conn.asp"-->
<%
if session("user")="" and session("pass")="" then
response.write "你不是管理员，请返回重新登陆!!! <br><br>"
response.write "<a href='adminlogin.asp'>返回</a>" 
response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理员工作界面</title>
<link rel="stylesheet" href="inc/style1.CSS">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
</head>

<%

dim edit,id
edit=trim(request("action"))
id=cstr(request("id"))
'删除记录
if edit = "delete" then
	sql = "DELETE FROM users WHERE id=" + id
	conn.execute sql
	if err.number <> 0 then
		response.write "数据库操作错误：" + err.description
		err.clear
	end if
end if

'保存记录
if edit = "editsave" then

		sql = "UPDATE users SET "
		sql = sql + "密码='" + trim(request("password"))+"'," 
		sql = sql + "姓名='" +trim(request("name")) + "',"
		sql = sql + "性别='" +trim(request("sex")) + "',"
		sql = sql + "地址='" + trim(request("address"))+"'," 
		sql = sql + "邮箱='" +trim(request("mail")) + "',"
		sql = sql + "问题='" + trim(request("question")) + "',"
		sql = sql + "回答='" + trim(request("ok"))+"'," 
        sql = sql + "邮编='" + trim(request("zip"))+"'," 
        sql = sql + "注册日期='" + trim(request("data1"))+"'," 
        sql = sql + "开通日期='" + trim(request("data2"))+"'," 
        sql = sql + "有效日期='" + trim(request("data3"))+"',"
        sql = sql + "VIP='" + trim(request("vip"))+"'," 
        sql = sql + "登陆次数='" + trim(request("member"))+"' " 
   		sql = sql + " WHERE ID = " + cstr(id)

		conn.execute sql
		if err.number <> 0 then
			response.write "无法保存,数据库操作出错:" + err.description
		end if
end if
%>
<script language="javascript">
function confirmDel(id,page){
if ( confirm("你确定要删除吗？")) {
window.location.href = "admin_edit.asp?action=delete&id=" + id+"&page="+page
  }
}

function checkdata() {
     if (document.DocForm.password.value.length ==0 ) {
       alert("密码不能为空")
       document.DocForm.password.focus()
       return false;
      }
     if (document.DocForm.name.value.length ==0) {
       alert("姓名不能为空")
       document.DocForm.name.focus()
       return false;
      }
     if (document.DocForm.mail.value.length ==0) {
       alert("邮箱不能为空")
       document.DocForm.mail.focus()
       return false;
      }
     if (document.DocForm.question.value.length ==0) {
       alert("密码问题不能为空")
       document.DocForm.question.focus()
       return false;
      }
     if (document.DocForm.ok.value.length ==0) {
       alert("密码答案不能为空")
       document.DocForm.ok.focus()
       return false;
      }
     if (document.DocForm.data1.value.length ==0) {
       alert("注册日期不能为空")
       document.DocForm.data1.focus()
       return false;
      }
     if (document.DocForm.data2.value.length ==0) {
       alert("开通日期不能为空")
       document.DocForm.data2.focus()
       return false;
      }
     if (document.DocForm.data3.value.length ==0) {
       alert("有效日期不能为空")
       document.DocForm.data3.focus()
       return false;
      }
     return true;
}

</script>
<div align="center"><center>
    <br>
    <p><font size="2"><b>员 工 清 单</b></font></p> 
    <p></p>
  </center>
</div> 
<div align="center">

<div align="center"><center> 
 <%set rs=server.createobject("adodb.recordset")
if edit="search" then
sql="select * from users where 用户名 like '%"+trim(request("search"))+"%'"
else
sql="select * from users order by id desc "
end if

rs.open sql,conn,1,3
if rs.eof and rs.bof then
response.write "没有记录"
else
%>
      <table border="1" cellspacing="0" width="536" bordercolorlight="#000000" 
bordercolordark="#FFFFFF" cellpadding="0" align="center">
        <tr> 
          <td width="15%" align="center" bgcolor="#FEEC85"><strong>用户名</strong></td>
          <td width="28%" align="center" bgcolor="#FEEC85"><strong>邮 箱</strong></td>
          <td width="22%" align="center" bgcolor="#FEEC85"><strong>有效日期</strong></td>
          <td width="16%" align="center" bgcolor="#FEEC85" height="20"><b>删除</b></td>
          <td width="19%" align="center" bgcolor="#FEEC85"><b>查看/修改</b></td>
        </tr>
        <%         
		dim curpage, i  
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
          <td bgcolor="#FFFCD9" height="17" width="15%"> 
            <p align="center" bgcolor="#E8E8E8"><%=rs("用户名")%>
          </td>
          <td bgcolor="#FFFCD9" height="17" width="28%"> 
            <p align="center"><%=rs("邮箱")%>&nbsp 
          </td>
          <td bgcolor="#FFFCD9" height="17" width="22%"> 
            <p align="center"><%=rs("有效日期")%>&nbsp
          </td>
          <td bgcolor="#FFFCD9" height="17" width="16%"> 
            <p align="center"><a href='javascript:confirmDel(<%= rs("ID")%>,<%=cstr(curpage)%>)'>删除</a>
          </td>
          <td bgcolor="#FFFCD9" height="17" width="19%"> 
            <p align="center"><a href="admin_edit.asp?action=edit&id=<%=rs("ID")%>&page=<%=curpage%>">查看/修改</a> 
          </td>
        </tr>
        <%rs.movenext
 if rs.eof then       
	i = i + 1              
	exit for               
 end if                      
next
%> 
      </table> 
</center></div>
  <%                                                           
	response.write "<hr noshade size=1 color=#000000><center><font face=宋体 size=2>" 
		response.write "第" + cstr(curpage) + "页/总" + cstr(rs.pagecount) + "页 "   
		response.write "本页" + cstr(i-1) + "条/总" + cstr(rs.recordcount) + "条 "    
		if curpage = 1 then                                                        
			response.write "首页 上一页 "                                          
		else                                                                    
			response.write "<a href='admin_edit.asp?page=1'>首页</a> <a href='admin_edit.asp?page=" + cstr(curpage-1) + "'>上一页</a> "                                                             
		end if                                                     
		if  curpage = rs.pagecount then                            
			response.write "下一页 末页"                           
		else                                                  
			response.write "<a href='admin_edit.asp?page=" + cstr(curpage+1) +"'>下一页</a> <a href='admin_edit.asp?page=" + cstr(rs.pagecount)  + "'>末页</a>"                      
		end if                                                      
		response.write "</font>" 
rs.close 
 end if  
%>
<%if edit="edit" then
set fs=server.createobject("adodb.recordset")
sql="select * from users where ID="+id
fs.open sql,conn,1,3%>
<form onsubmit="return checkdata()" name="DocForm" mothed=admin_edit.asp >
    <table border="1" cellspacing="0" width="551" bordercolorlight="#000000" 
bordercolordark="#FFFFFF" cellpadding="0" align="center">
      <tr> 
        <td colspan="4" height="20"> 
          <div align="center"><font color="#FF0000"><b>编 辑 记 录</b></font></div>
        </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">用户名：</div>
        </td>
        <td width="133"><%=fs("用户名")%></td>
        <td width="83"> 
          <div align="right">密码问题：</div>
        </td>
        <td width="249"> 
          <input type="text" name="question" value='<%=fs("问题")%>' size="20" maxlength="20">
        </td>
      </tr>
      <tr> 
        <td width="76" height="24"> 
          <div align="right">密 码：</div>
        </td>
        <td width="133" height="24"> 
          <input type="text" name="password" value='<%=fs("密码")%>' size="15" maxlength="15">
        </td>
        <td width="83" height="24"> 
          <div align="right">问题答案：</div>
        </td>
        <td width="249" height="24"> 
          <input type="text" name="ok" value='<%=fs("回答")%>' size="20" maxlength="20">
        </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">姓 名：</div>
        </td>
        <td width="133"> 
          <input type="text" name="name" size="10" value='<%=fs("姓名")%>' maxlength="10">
        </td>
        <td width="83"> 
          <div align="right">邮 编：</div>
        </td>
        <td width="249"> 
          <input type="text" name="zip" value='<%=fs("邮编")%>' size="6" maxlength="6">
        </td>
      </tr>
      <tr> 
        <td width="76" height="30"> 
          <div align="right">性 别：</div>
        </td>
        <td width="133" height="30"> 
          <input type="text" name="sex" size="5" value='<%=fs("性别")%>' maxlength="5">
        </td>
        <td width="83" height="30"> 
          <div align="right">注册日期：</div>
        </td>
        <td width="249" height="30"> 
          <input type="text" name="data1" value='<%=fs("注册日期")%>' size="15" maxlength="15">
          （格式：2002-08-1） </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">地 址：</div>
        </td>
        <td width="133"> 
          <input type="text" name="address" size="20" value='<%=fs("地址")%>' maxlength="30">
        </td>
        <td width="83"> 
          <div align="right">开通日期：</div>
        </td>
        <td width="249"> 
          <input type="text" name="data2" value='<%=fs("开通日期")%>' size="15" maxlength="15">
          （格式：2002-08-1） </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">邮 箱：</div>
        </td>
        <td width="133"> 
          <input type="text" name="mail" value='<%=fs("邮箱")%>' size="20" maxlength="30">
        </td>
        <td width="83"> 
          <div align="right">有效日期：</div>
        </td>
        <td width="249"> 
          <input type="text" name="data3" value='<%=fs("有效日期")%>' size="15" maxlength="15">
          （格式：2002-08-1） </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">VIP会员：</div>
        </td>
        <td width="133"> 
          <input type="text" name="vip" size="3" value='<%=fs("VIP")%>' maxlength="3">
          (是/否) </td>
        <td width="83"> 
          <div align="right">登陆次数：</div>
        </td>
        <td width="249"> 
          <input type="text" name="member" size="5" value='<%=fs("登陆次数")%>' maxlength="5">
        </td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <div align="center"> 
            <input type="hidden" name="action" value="editsave">
            <input type="hidden" name="id" value=<%=id%>>
            <input type="hidden" name="page" value="<%=curpage%>">
            <input type="submit" name="Submit" value=" 修 改">
            <input type="reset" name="Submit2" value=" 重 填 ">
          </div>
        </td>
      </tr>
    </table>
  </form>
</div> 
 
<%end if%>
