<!--#include file="conn.asp"-->
<%
if session("user")="" and session("pass")="" then
response.write "�㲻�ǹ���Ա���뷵�����µ�½!!! <br><br>"
response.write "<a href='adminlogin.asp'>����</a>" 
response.end
end if
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����Ա��������</title>
<link rel="stylesheet" href="inc/style1.CSS">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
</head>

<%

dim edit,id
edit=trim(request("action"))
id=cstr(request("id"))
'ɾ����¼
if edit = "delete" then
	sql = "DELETE FROM users WHERE id=" + id
	conn.execute sql
	if err.number <> 0 then
		response.write "���ݿ��������" + err.description
		err.clear
	end if
end if

'�����¼
if edit = "editsave" then

		sql = "UPDATE users SET "
		sql = sql + "����='" + trim(request("password"))+"'," 
		sql = sql + "����='" +trim(request("name")) + "',"
		sql = sql + "�Ա�='" +trim(request("sex")) + "',"
		sql = sql + "��ַ='" + trim(request("address"))+"'," 
		sql = sql + "����='" +trim(request("mail")) + "',"
		sql = sql + "����='" + trim(request("question")) + "',"
		sql = sql + "�ش�='" + trim(request("ok"))+"'," 
        sql = sql + "�ʱ�='" + trim(request("zip"))+"'," 
        sql = sql + "ע������='" + trim(request("data1"))+"'," 
        sql = sql + "��ͨ����='" + trim(request("data2"))+"'," 
        sql = sql + "��Ч����='" + trim(request("data3"))+"',"
        sql = sql + "VIP='" + trim(request("vip"))+"'," 
        sql = sql + "��½����='" + trim(request("member"))+"' " 
   		sql = sql + " WHERE ID = " + cstr(id)

		conn.execute sql
		if err.number <> 0 then
			response.write "�޷�����,���ݿ��������:" + err.description
		end if
end if
%>
<script language="javascript">
function confirmDel(id,page){
if ( confirm("��ȷ��Ҫɾ����")) {
window.location.href = "admin_edit.asp?action=delete&id=" + id+"&page="+page
  }
}

function checkdata() {
     if (document.DocForm.password.value.length ==0 ) {
       alert("���벻��Ϊ��")
       document.DocForm.password.focus()
       return false;
      }
     if (document.DocForm.name.value.length ==0) {
       alert("��������Ϊ��")
       document.DocForm.name.focus()
       return false;
      }
     if (document.DocForm.mail.value.length ==0) {
       alert("���䲻��Ϊ��")
       document.DocForm.mail.focus()
       return false;
      }
     if (document.DocForm.question.value.length ==0) {
       alert("�������ⲻ��Ϊ��")
       document.DocForm.question.focus()
       return false;
      }
     if (document.DocForm.ok.value.length ==0) {
       alert("����𰸲���Ϊ��")
       document.DocForm.ok.focus()
       return false;
      }
     if (document.DocForm.data1.value.length ==0) {
       alert("ע�����ڲ���Ϊ��")
       document.DocForm.data1.focus()
       return false;
      }
     if (document.DocForm.data2.value.length ==0) {
       alert("��ͨ���ڲ���Ϊ��")
       document.DocForm.data2.focus()
       return false;
      }
     if (document.DocForm.data3.value.length ==0) {
       alert("��Ч���ڲ���Ϊ��")
       document.DocForm.data3.focus()
       return false;
      }
     return true;
}

</script>
<div align="center"><center>
    <br>
    <p><font size="2"><b>Ա �� �� ��</b></font></p> 
    <p></p>
  </center>
</div> 
<div align="center">

<div align="center"><center> 
 <%set rs=server.createobject("adodb.recordset")
if edit="search" then
sql="select * from users where �û��� like '%"+trim(request("search"))+"%'"
else
sql="select * from users order by id desc "
end if

rs.open sql,conn,1,3
if rs.eof and rs.bof then
response.write "û�м�¼"
else
%>
      <table border="1" cellspacing="0" width="536" bordercolorlight="#000000" 
bordercolordark="#FFFFFF" cellpadding="0" align="center">
        <tr> 
          <td width="15%" align="center" bgcolor="#FEEC85"><strong>�û���</strong></td>
          <td width="28%" align="center" bgcolor="#FEEC85"><strong>�� ��</strong></td>
          <td width="22%" align="center" bgcolor="#FEEC85"><strong>��Ч����</strong></td>
          <td width="16%" align="center" bgcolor="#FEEC85" height="20"><b>ɾ��</b></td>
          <td width="19%" align="center" bgcolor="#FEEC85"><b>�鿴/�޸�</b></td>
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
            <p align="center" bgcolor="#E8E8E8"><%=rs("�û���")%>
          </td>
          <td bgcolor="#FFFCD9" height="17" width="28%"> 
            <p align="center"><%=rs("����")%>&nbsp 
          </td>
          <td bgcolor="#FFFCD9" height="17" width="22%"> 
            <p align="center"><%=rs("��Ч����")%>&nbsp
          </td>
          <td bgcolor="#FFFCD9" height="17" width="16%"> 
            <p align="center"><a href='javascript:confirmDel(<%= rs("ID")%>,<%=cstr(curpage)%>)'>ɾ��</a>
          </td>
          <td bgcolor="#FFFCD9" height="17" width="19%"> 
            <p align="center"><a href="admin_edit.asp?action=edit&id=<%=rs("ID")%>&page=<%=curpage%>">�鿴/�޸�</a> 
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
	response.write "<hr noshade size=1 color=#000000><center><font face=���� size=2>" 
		response.write "��" + cstr(curpage) + "ҳ/��" + cstr(rs.pagecount) + "ҳ "   
		response.write "��ҳ" + cstr(i-1) + "��/��" + cstr(rs.recordcount) + "�� "    
		if curpage = 1 then                                                        
			response.write "��ҳ ��һҳ "                                          
		else                                                                    
			response.write "<a href='admin_edit.asp?page=1'>��ҳ</a> <a href='admin_edit.asp?page=" + cstr(curpage-1) + "'>��һҳ</a> "                                                             
		end if                                                     
		if  curpage = rs.pagecount then                            
			response.write "��һҳ ĩҳ"                           
		else                                                  
			response.write "<a href='admin_edit.asp?page=" + cstr(curpage+1) +"'>��һҳ</a> <a href='admin_edit.asp?page=" + cstr(rs.pagecount)  + "'>ĩҳ</a>"                      
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
          <div align="center"><font color="#FF0000"><b>�� �� �� ¼</b></font></div>
        </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">�û�����</div>
        </td>
        <td width="133"><%=fs("�û���")%></td>
        <td width="83"> 
          <div align="right">�������⣺</div>
        </td>
        <td width="249"> 
          <input type="text" name="question" value='<%=fs("����")%>' size="20" maxlength="20">
        </td>
      </tr>
      <tr> 
        <td width="76" height="24"> 
          <div align="right">�� �룺</div>
        </td>
        <td width="133" height="24"> 
          <input type="text" name="password" value='<%=fs("����")%>' size="15" maxlength="15">
        </td>
        <td width="83" height="24"> 
          <div align="right">����𰸣�</div>
        </td>
        <td width="249" height="24"> 
          <input type="text" name="ok" value='<%=fs("�ش�")%>' size="20" maxlength="20">
        </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">�� ����</div>
        </td>
        <td width="133"> 
          <input type="text" name="name" size="10" value='<%=fs("����")%>' maxlength="10">
        </td>
        <td width="83"> 
          <div align="right">�� �ࣺ</div>
        </td>
        <td width="249"> 
          <input type="text" name="zip" value='<%=fs("�ʱ�")%>' size="6" maxlength="6">
        </td>
      </tr>
      <tr> 
        <td width="76" height="30"> 
          <div align="right">�� ��</div>
        </td>
        <td width="133" height="30"> 
          <input type="text" name="sex" size="5" value='<%=fs("�Ա�")%>' maxlength="5">
        </td>
        <td width="83" height="30"> 
          <div align="right">ע�����ڣ�</div>
        </td>
        <td width="249" height="30"> 
          <input type="text" name="data1" value='<%=fs("ע������")%>' size="15" maxlength="15">
          ����ʽ��2002-08-1�� </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">�� ַ��</div>
        </td>
        <td width="133"> 
          <input type="text" name="address" size="20" value='<%=fs("��ַ")%>' maxlength="30">
        </td>
        <td width="83"> 
          <div align="right">��ͨ���ڣ�</div>
        </td>
        <td width="249"> 
          <input type="text" name="data2" value='<%=fs("��ͨ����")%>' size="15" maxlength="15">
          ����ʽ��2002-08-1�� </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">�� �䣺</div>
        </td>
        <td width="133"> 
          <input type="text" name="mail" value='<%=fs("����")%>' size="20" maxlength="30">
        </td>
        <td width="83"> 
          <div align="right">��Ч���ڣ�</div>
        </td>
        <td width="249"> 
          <input type="text" name="data3" value='<%=fs("��Ч����")%>' size="15" maxlength="15">
          ����ʽ��2002-08-1�� </td>
      </tr>
      <tr> 
        <td width="76"> 
          <div align="right">VIP��Ա��</div>
        </td>
        <td width="133"> 
          <input type="text" name="vip" size="3" value='<%=fs("VIP")%>' maxlength="3">
          (��/��) </td>
        <td width="83"> 
          <div align="right">��½������</div>
        </td>
        <td width="249"> 
          <input type="text" name="member" size="5" value='<%=fs("��½����")%>' maxlength="5">
        </td>
      </tr>
      <tr> 
        <td colspan="4"> 
          <div align="center"> 
            <input type="hidden" name="action" value="editsave">
            <input type="hidden" name="id" value=<%=id%>>
            <input type="hidden" name="page" value="<%=curpage%>">
            <input type="submit" name="Submit" value=" �� ��">
            <input type="reset" name="Submit2" value=" �� �� ">
          </div>
        </td>
      </tr>
    </table>
  </form>
</div> 
 
<%end if%>
