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
<title>View DB Page</title>
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


						<h4>Please contact CPE Manager before accessing any machine</h4>
						<!--  ADD into TABLE -->
						<p>
							<%
								if (request.getParameter("submit").equals("add")) {
							%>
							You have added entry
							<%
							dbConn.enterMsg(request.getParameter("serial"),
									request.getParameter("hno"),
									request.getParameter("hname"),
									request.getParameter("ipaddr"),
									request.getParameter("rack"),
									request.getParameter("sysd"),
									request.getParameter("osver"),
									request.getParameter("ocver"),
									request.getParameter("cowner"),
									request.getParameter("remarks"));
							%>
						
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
								<th>Remarks/Booking Period(from-to)</th>
							</tr>
							<tr>

								<%
									ResultSet rs = dbConn.getRset();
										while (rs.next()) {
											String a = rs.getString("serial");
											out.write("<td><a href=\"editElement.jsp?serial=" + a + "\">"
													+ a + "</a></td>");
											out.write("<td>" + rs.getString("hno") + "</td>");
											String hn = rs.getString("hname");
											out.write("<td>" + hn + "</td>");
											String ip = rs.getString("ipaddr");
											out.write("<td>" + ip + "</td>");
											out.write("<td>" + rs.getString("rack") + "</td>");
											out.write("<td>" + rs.getString("sysd") + "</td>");
											out.write("<td>" + rs.getString("osver") + "</td>");
											out.write("<td>" + rs.getString("ocver") + "</td>");
											String b = rs.getString("cowner");
											out.write("<td><a href=\"mailAPI.jsp?serial="+ a + "&sender="+ b + "&hname="+ hn+ "&ipadd="+ip+"\">"+ b +"</a></td>");
											out.write("<td>" + rs.getString("remarks") + "</td>");
											out.write("</tr><tr>");
										}
								%>
							</tr>
						</table>
						<%
							}
						%>
						<!-- end of ADD into TABLE -->

						<!--  VIEW ALL TABLE -->
						<%
							if (request.getParameter("submit").equals("viewAll")) {
						%>
						You have selected to View All
						<table border="1" align="center">
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
								<th>Remarks/Booking Period(from-to)</th>
							</tr>
							<tr>

								<%
									ResultSet rs = dbConn.getRset();

										while (rs.next()) {
											String a = rs.getString("serial");
											out.write("<td><a href=\"editElement.jsp?serial=" + a + "\">"
													+ a + "</a></td>");
											out.write("<td>" + rs.getString("hno") + "</td>");
											String hn = rs.getString("hname");
											out.write("<td>" + hn + "</td>");
											String ip = rs.getString("ipaddr");
											out.write("<td>" + ip + "</td>");
											out.write("<td>" + rs.getString("rack") + "</td>");
											out.write("<td>" + rs.getString("sysd") + "</td>");
											out.write("<td>" + rs.getString("osver") + "</td>");
											out.write("<td>" + rs.getString("ocver") + "</td>");
											String b = rs.getString("cowner");
											out.write("<td><a href=\"mailAPI.jsp?serial="+ a + "&sender="+ b + "&hname="+ hn+ "&ipadd="+ip+"\">"+ b +"</a></td>");
											out.write("<td>" + rs.getString("remarks") + "</td>");
											out.write("</tr><tr>");

										}
								%>
							</tr>
						</table>
						<%
							}
						%>
						<!-- end of VIEW ALL TABLE -->

						<!--  Search TABLE -->
						<%
							if (request.getParameter("submit").equals("search")) {
								
									dbConn.searchEntry(request.getParameter("serial"),
											request.getParameter("hno"),
											request.getParameter("hname"),
											request.getParameter("ipaddr"),
											request.getParameter("rack"),
											request.getParameter("sysd"),
											request.getParameter("osver"),
											request.getParameter("ocver"),
											request.getParameter("cowner"),
											request.getParameter("remarks"));
								
						%>
						You have selected search
						<table border="1" align="center">
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
								<th>Remarks/Booking Period(from-to)</th>
							</tr>
							<tr>

								<%
									ResultSet rs = dbConn.getRset();

										while (rs.next()) {
											String a = rs.getString("serial");
											out.write("<td><a href=\"editElement.jsp?serial=" + a + "\">"
													+ a + "</a></td>");
											out.write("<td>" + rs.getString("hno") + "</td>");
											String hn = rs.getString("hname");
											out.write("<td>" + hn + "</td>");
											String ip = rs.getString("ipaddr");
											out.write("<td>" + ip + "</td>");
											out.write("<td>" + rs.getString("rack") + "</td>");
											out.write("<td>" + rs.getString("sysd") + "</td>");
											out.write("<td>" + rs.getString("osver") + "</td>");
											out.write("<td>" + rs.getString("ocver") + "</td>");
											String b = rs.getString("cowner");
											out.write("<td><a href=\"mailAPI.jsp?serial="+ a + "&sender="+ b + "&hname="+ hn+ "&ipadd="+ip+"\">"+ b +"</a></td>");
											out.write("<td>" + rs.getString("remarks") + "</td>");
											out.write("</tr><tr>");
										}
								%>
							</tr>
						</table>
						<%
							}
						%>
						<!-- end of Search TABLE -->

						<%
							if (request.isUserInRole("terminator"))
								if (request.getParameter("submit").equals("flushAll")) {
									dbConn.fulshTable();
								}
						%>
						<p>
							<%
								if (request.isUserInRole("cpeadm"))
									if (request.getParameter("submit").equals("flushAll")) {
										out.write("Akshay says: I knew it, You would press this one day! relogin as terminator:akushay to flush all!!");
									}
							%>
<br>
							<%
								out.write("Total Number of Machine entries in this table are :"
										+ Dbconnect.entries);
							%>
							<!--  do not touch from here to -->
						<hr>
						<a href="index.jsp">back?</a>
				<br class="clearfix" />
			</div>
		</div>
	</div>
	<!--  to here xxx -->
</body>
</html>