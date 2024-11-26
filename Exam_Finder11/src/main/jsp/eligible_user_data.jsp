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
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_finder", "root", "");
PreparedStatement ps = con.prepareStatement("select * from eligible_user");
ResultSet rs = ps.executeQuery();

out.println("<table>");
out.println("<tr>");
out.println("<th>Age</th>");
out.println("<th>Qualification</th>");
out.println("<th>Field</th>");
out.println("<th>Exam Type</th>");
out.println("<th>Gender</th>");
out.println("</tr>");

while(rs.next()) {
    out.println("<tr>");
    out.println("<td>" + rs.getString("age") + "</td>");
    out.println("<td>" + rs.getString("qualification") + "</td>");
    out.println("<td>" + rs.getString("field") + "</td>");
    out.println("<td>" + rs.getString("exam_type") + "</td>");
    out.println("<td>" + rs.getString("gender") + "</td>");
    out.println("</tr>");
}

out.println("</table>");
%>
</body>
</html>