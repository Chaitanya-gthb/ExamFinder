<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String u,p,U,P;
	u=request.getParameter("Username");
	p=request.getParameter("password");
	
	U="Admin123";
	P="Admin@123";
	
	if(u.equals(U) && p.equals(P))
	{
		out.println("<script>");
		out.println("window.alert('Admin Login Successful!!')");
		out.println("window.location.href='admin01.html'");
		out.println("</script>");
	}
	else
	{
		out.println("<script>");
		out.println("window.alert('Admin Login UnSuccessfull')");
		out.println("window.history.back()");
		out.println("</script>");
	}
%>
</body>
</html>