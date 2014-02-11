<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dbimp.Dbconnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OCMP MC DB</title>
<link rel="stylesheet" type="text/css" href="style.css" />


</head>
<body>
	<div id="outer">
		<div id="wrapper">
			<div id="menu">
				<ul>
					<li class="first">OCMP Machine DataBase</li>
				</ul>
				<br class="clearfix" />
			</div>
			<div id="header">
				<div id="logo">
					<h1>
						<a href="#">HP Open Call Media Platform</a>
					</h1>

				</div>

			</div>
			<div id="page">
			<form method="post" action="LogOut">
						<input type="submit" name="submit" value="logout" /></form>

				<hr>
						<h4>You are successfully logged in!</h4>
						<hr>
						<form method="post" action="Dbconnect">
						<h4>Search Element <%
								if (request.isUserInRole("cpeadm")) {
							%>
							/ Add
							<%} %>:</h4>
						<hr>
							<p><b>
							<!-- Table Params -->
							<div id="searchtbl">
							Serial: <input type="text" name="serial" /><br>
							HeightNumber : <input type="text" name="hno" /><br>
							Hostname : <input type="text" name="hname" /><br>
							Ip-Address : <input type="text" name="ipaddr" /><br>
							RackDetails : <input type="text" name="rack" /><br>
							System Make/Model : <input type="text" name="sysd" /><br>
							OperatingSystem : <input type="text" name="osver" /><br>
							OCMP Version : <input type="text" name="ocver" /><br>
							Current Owner : <input type="text" name="cowner" /><br>
							Remarks : <input type="text" name="remarks" /><br>
							
							<!-- end of Table Params -->
							<input type="submit" name="submit" value="viewAll" />
							<input type="submit" name="submit" value="search" />
							</b>
							</p>
							<%
								if (request.isUserInRole("cpeadm")||request.isUserInRole("terminator")) {
							%>
							<br>
							<hr>
							<hr>
							Admin previlages:
							<input type="submit" name="submit" value="add" />
							<%
								for (int i = 0; i <= 100; i++) {
							%>
							<br>
							<%
								}
							%>
							
							<hr>
							<br>
							<input type="submit" name="submit" value="flushAll" />
</div>
							<%
								}
							%>
						</form>

				<br class="clearfix" />
			</div>
		</div>
	</div>

	<br>
	<br>

</body>
</html>
