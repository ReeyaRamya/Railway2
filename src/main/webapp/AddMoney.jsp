<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Money</title>
</head>
<body>

<%User user=(User)session.getAttribute("user");%>
<%if(user==null){
response.getWriter().print("<h1>Session Expired login again</h1>");
request.getRequestDispatcher("Login.html").include(request, response);
}
else
{
	
}
%>

<h1>Add Money to Wallet</h1>
<br>
<form action="addmoney">
Enter Amount to add:
<input type="number" name="amount"><br>
<button>add</button>
</form><br>
<a href="UserHome.html"><button>Back</button></a>
</form>

</body>
</html>