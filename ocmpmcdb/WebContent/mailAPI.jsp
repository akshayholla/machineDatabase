<html>
<head>
<title>Mail API</title>
</head>
<body>
<table border="1" width="50%"  cellpadding="0" cellspacing="0">
  <tr>
  <td width="100%">
  <form method="POST" action="mail.jsp">
  <table border="1" width="100%" cellpadding="0" cellspacing="0">
  <h1>Request Access</h1>
  <tr>
  <%String serial = request.getParameter("serial");
  String sender = request.getParameter("sender");
  String hname = request.getParameter("hname");
  String ipadd = request.getParameter("ipadd");
  System.out.println("Serial is "+ serial+ "Sender is "+sender); %>
  <td width="50%"><b>To:</b></td>
  <%if(sender.equals("free"))
	  {%>
  <td width="50%"><input type="text" name="to" size="30" value="rashmihegde@hp.com"></td>
  <%}%>
  <%if(!sender.equals("free")) 
  {%>
  <td width="50%"><input type="text" name="to" size="30" value="<%=sender%>"></td>
  <%}%>
    </tr>
  <tr>
  <td width="50%"><b>From:</b></td>
  <td width="50%"><input type="text" name="from" size="30" value="ocmpmcdb@ocmpperf04.ind.hp.com"></td>
  </tr>
  <tr>
  <td width="50%"><b>Subject:</b></td>
  <td width="50%"><input type="text" name="subject" size="30" value="Request Machine Access"></td>
  </tr>
  <tr>
  <td width="50%"><b>Description:</b></td>
  <td width="50%"><textarea name="description" type="text" 
     cols="40" rows="15" size=100>
     Hello <%=sender%>,&#13; Please consider this e-mail as a request to free the machine with serial <%=serial%>, hostname <%=hname%> , IP :<%=ipadd%>. As requested by - &#13;&#13;for -&#13;
  </textarea>
  </td>
  </tr>
  <tr>
  <td><p><input type="submit" value="Send Mail" name="sendMail"></td>
  </tr>
  </table>
  </p>
  </form>
  </td>
  </tr>
</table>
<a href="index.jsp">Cancel Sending Mail?</a>
</body>
</html>