<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Data for Date Range</title>
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
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
    }
    label {
        font-size: 18px;
        margin-bottom: 10px;
    }
    input[type="number"] {
        padding: 8px;
        font-size: 16px;
        margin-bottom: 20px;
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
    <label for="startMonth">Start Month:</label>
    <input type="number" id="startMonth" name="startMonth" min="1" max="12" required>

    <label for="startYear">Start Year:</label>
    <input type="number" id="startYear" name="startYear" min="2000" required>

    <label for="endMonth">End Month:</label>
    <input type="number" id="endMonth" name="endMonth" min="1" max="12" required>

    <label for="endYear">End Year:</label>
    <input type="number" id="endYear" name="endYear" min="2000" required>

    <input type="submit" value="Fetch Data">
</form>

<%
    String startMonth = request.getParameter("startMonth");
    String startYear = request.getParameter("startYear");
    String endMonth = request.getParameter("endMonth");
    String endYear = request.getParameter("endYear");

    if (startMonth != null && startYear != null && endMonth != null && endYear != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");

            // Convert start and end months and years into valid dates
            String startDate = startYear + "-" + startMonth + "-01";
            String endDate = endYear + "-" + endMonth + "-31";  // Last day of the end month

            // Query to fetch data based on a range of months
            PreparedStatement ps = con.prepareStatement("SELECT * FROM reg WHERE register_at BETWEEN ? AND ?");
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ResultSet rs = ps.executeQuery();
            
            out.println("<h1 class='h1'>Registered Users from " + startMonth + "/" + startYear + " to " + endMonth + "/" + endYear + "</h1>");
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
