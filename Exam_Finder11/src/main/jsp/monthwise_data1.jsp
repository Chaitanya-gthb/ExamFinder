<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Data for Specific Month</title>
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
    .h1 {
        text-align: center;
    }
    #downloadPDF {
        background: transparent;
        padding: 20px 80px;
        border: 1px solid black;
        background-color: black;
        color: white;
        font-size: 22px;
        margin-top: 20px;
    }
    #downloadPDF:hover {
        background-color: grey;
        cursor: pointer;
    }
    form {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
    }
    label {
        font-size: 18px;
        margin-right: 10px;
    }
    input[type="number"] {
        padding: 8px;
        font-size: 16px;
        margin-right: 20px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 150px;
    }
    input[type="submit"] {
        background-color: black;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: grey;
    }
</style>
</head>
<body>

<form method="get" action="">
    <label for="month">Select Month:</label>
    <input type="number" id="month" name="month" min="1" max="12" required>

    <label for="year">Select Year:</label>
    <input type="number" id="year" name="year" min="2000" required>

    <input type="submit" value="Fetch Data">
</form>

<%
    String month = request.getParameter("month");
    String year = request.getParameter("year");

    if (month != null && year != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");

            // Query to fetch data based on month and year
            PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE MONTH(register_at) = ? AND YEAR(register_at) = ?");
            ps.setInt(1, Integer.parseInt(month));
            ps.setInt(2, Integer.parseInt(year));
            ResultSet rs = ps.executeQuery();
            
            out.println("<h1 class='h1'>Registered Users for " + month + "/" + year + "</h1>");
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
    }
%>

</body>
</html>
