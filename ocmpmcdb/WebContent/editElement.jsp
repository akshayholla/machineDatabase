<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="dbimp.Dbconnect"%>
<%@ page import="java.sql.ResultSet"%>
<%
	Dbconnect dbConn = Dbconnect.getInstance();
	dbConn.resetRset();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Entry</title>
<link rel="stylesheet" type="text/css" href="style2.css" />

</head>
<body>
	<!--  do not touch from here to -->
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
						<a href="#">Open Call Media Platform</a>
					</h1>
				</div>

			</div>

			<div id="page">
						<!--  to here xxx -->
						<h3>This is an Edit Page!</h3>
						<h4>
							You have requested to edit the element with sl No.
							<%
							out.write(request.getParameter("serial"));
						%>
						</h4>
						<!--  to here xxx -->
						Present values are :
						<table border="1">
							<tr>
								<th>Serial</th>
								<th>HeightNumber </th>
								<th>Hostname </th>
								<th>Ip-Address </th>
								<th>RackDetails  </th>
								<th>System Make/Model </th>
								<th>OperatingSystem </th>
								<th>OCMP Version </th>
								<th>Current Owner </th>
								<th>Remarks</th>
							</tr>
							<tr>

								<%
									ResultSet rs = dbConn.getElementDetails(request
											.getParameter("serial"));
										out.write("<td>" + dbConn.serial + "</td>");
										out.write("<td>" + dbConn.hno + "</td>");
										out.write("<td>" + dbConn.hname + "</td>");
										out.write("<td>" + dbConn.ipaddr + "</td>");
										out.write("<td>" + dbConn.rack + "</td>");
										out.write("<td>" + dbConn.sysd + "</td>");
										out.write("<td>" + dbConn.osver + "</td>");
										out.write("<td>" + dbConn.ocver + "</td>");
										out.write("<td>" + dbConn.cowner + "</td>");
										out.write("<td>" + dbConn.remarks + "</td>");
										out.write("</tr>");

								%>
						</table>

						<%
							if (request.isUserInRole("cpeadm")) {
						%>
						<br> <br> Edit Fields Below : <br>
						<hr>
						
						<form method="post" action="Dbconnect">
							<input type="hidden" name="serial" value="<%out.write(dbConn.serial);%>" /> 
							<input name="hno" type="text" value="<%out.write(dbConn.hno);%>" />
							<input name="hname" type="text" value="<%out.write(dbConn.hname);%>" />  
							<input name="ipaddr" type="text" value="<%out.write(dbConn.ipaddr);%>" />
							<input name="rack" type="text" value="<%out.write(dbConn.rack);%>" /> 
							<input name="sysd" type="text" value="<%out.write(dbConn.sysd);%>" /> 
							<input name="osver" type="text" value="<%out.write(dbConn.osver);%>" /> 
							<input name="ocver" type="text" value="<%out.write(dbConn.ocver);%>" /> 
							<input name="cowner" type="text" value="<%out.write(dbConn.cowner);%>" /> 
							<input name="remarks" type="text" value="<%out.write(dbConn.remarks);%>" />					
							<input type="submit" name="update" value="UpdateDb" /> 
							<input type="submit" name="remove" value="Delete Entry" />
						</form>
						<%
							}
						%>
						<!--  do not touch from here to -->
						<hr>
						<a href="index.jsp">back?</a>
				<br class="clearfix" />
	<!--  to here xxx -->
		</div>
				</div>
					</div>
</body>
</html>