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
	String a,b,c,d,e;
	a=request.getParameter("age");
	b=request.getParameter("qualification");
	c=request.getParameter("field");
	d=request.getParameter("gender");
	e=request.getParameter("examType");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder","root","");
	PreparedStatement ps = con.prepareStatement("insert into eligible_user values('"+a+"','"+b+"','"+c+"','"+d+"','"+e+"')");
	int i=ps.executeUpdate();
	if(i!=0)
	{
		out.println("<script>");
		out.println("window.alert('Record Inserted')");
		out.println("</script>");
	}
%>
</body>
</html>