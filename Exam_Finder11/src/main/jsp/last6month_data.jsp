<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Last 6 Months Registrations</title>
<style>
 body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: grey;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: black;
        color: white;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    .h1{
    text-align: center;
    }
    #downloadPDF{
      background: transparent;
      padding: 20px 80px;
      border: 1px solid black;
      background-color: black;
      color: white;
      font-size: 22px;
     margin-top: 20px;
            
      &:hover{
         background-color: grey;
         cursor: pointer;
      }
    }
    
</style>
</head>
<body>

<h1 class="h1">Registered Users in the Last 6 Months</h1>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");

        // Query to fetch data for the last 6 months
        PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE register_at >= DATE_SUB(NOW(), INTERVAL 6 MONTH)");
        ResultSet rs = ps.executeQuery();

        out.println("<table>");
        out.println("<tr>");
        out.println("<th>User_id</th>");
        out.println("<th>Name</th>");
        out.println("<th>Email</th>");
        out.println("<th>Username</th>");
        out.println("<th>Register On</th>");
        out.println("</tr>");
        
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("user_id") + "</td>");
            out.println("<td>" + rs.getString("name") + "</td>");
            out.println("<td>" + rs.getString("email") + "</td>");
            out.println("<td>" + rs.getString("username") + "</td>");
            out.println("<td>" + rs.getTimestamp("register_at") + "</td>");
            out.println("</tr>");
        }
        
        out.println("</table>");
    } catch (Exception ex) {
        out.println("Error: " + ex.getMessage());
    }
%>

</body>
</html>
