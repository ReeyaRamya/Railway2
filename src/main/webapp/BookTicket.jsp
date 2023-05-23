<%@page import="dto.Train"%>
<%@page import="dao.TrainDao"%>
<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book ticket</title>
</head>
<body>

<%User user=(User)session.getAttribute("user");%>
<%if(user==null){
response.getWriter().print("<h1>Session Expired login again</h1>");
request.getRequestDispatcher("Login.html").include(request, response);
}
else
{
%>
<h1>Hello <%=user.getFirstname()+" "+user.getLastname() %></h1>
<br>
<% 
int trainnumber=Integer.parseInt(request.getParameter("tn"));
TrainDao dao= new TrainDao();
Train train = dao.fetch(trainnumber);
if(train==null)
{
response.getWriter().print("<h1 style='red'>Invalid Train Number</h1>");
request.getRequestDispatcher("UserHome.html").include(request, response);
}
else
{
%>
<h1>
Hello
<%=user.getFirstname() + " "+user.getLastname() %>
</h1>
<br>
<from action="" method="post">
User Id: <input type="text" name="uid" value="<%=user.getId()%>" readonly="readonly">
Train Number: <input type="text" name="tn" value="<%=trainnumber%>" readonly="readonly">
From: <select name="from">
<%for(int i=0;i<train.getStation().length-1;i++)
{%>
<option><%=train.getStation()[i] %></option>
<%} %>
</select><br>

To: <select name="to">
<%for(int i=1;i<train.getStation().length-1;i++)
{%>
<option><%=train.getStation()[i] %></option>
<%} %>
</select><br> 
Date of Journey: <input type="date" name="doj"><br>
Number of Seats: <input type="number" name="seats"><br>
<button type="reset">Cancel</button>
<button>Book</button>
</from>
<br>
<a href="UserHome.html"><button>Back</button></a>
<% 
}
}
%>


</body>
</html>