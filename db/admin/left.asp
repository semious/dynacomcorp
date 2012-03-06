<html>
<head>
<link href="css/style.css" rel="stylesheet">
</head>
<body>

<p>&nbsp;</p>
<%
	if session("admin_name")<> "" then
%>
	<ul>
		<li>
			Admin Managerment
			<ul>
				<li>
					<a href="admin_add.asp" target="right">Add Administrator</a>
				</li>
				<li>
					<a href="changpass.asp" target="right">Edit Password</a>
				</li>
			</ul>
		</li>
	</ul>
	
	<ul>
		<li>
			Product Management
			<ul>
				<li>
					<a href="product_add.asp" target="right">Add Product</a>
				</li>
				<li>
					<a href="product_view.asp" target="right">View Product</a>
				</li>
			</ul>
		</li>
	</ul>
	
	<ul>
		<li>	
			Menu Management
			<ul>
				<li>
					<a href="cat_add.asp" target="right">Add Menu</a>
				</li>
				<li>
					<a href="cat_view.asp" target="right">View Menu</a>
				</li>
				<li>
					<a href="cat_del.asp" target="right">Del Menu</a>
				</li>
			</ul>
		</li>
	</ul>

	<ul>
		<li>	
			Stores Management
			<ul>
				<li>
					<a href="store_add.asp" target="right">Add Store</a>
				</li>
				<li>
					<a href="store_view.asp" target="right">View Store</a>
				</li>
			</ul>
		</li>
	</ul>

	<ul>
		<li>	
			Log Management
			<ul>
				<li>
					<a href="log_product_view.asp" target="right">Product Log</a>
				</li>
				<li>
					<a href="log_menu_view.asp" target="right">Menu Log</a>
				</li>
			</ul>
		</li>
	</ul>

				
    <ul>
		<li>
			Log out
    		<ul>
				<li>
					<a href="logout.asp" target=_top>Exit</a>
				</li>
			</ul>
		</li>
	</ul>
</html>
<% end if%>






















































