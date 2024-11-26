<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Login</title>
</head>
<body>
<%
    String u = request.getParameter("Username");
    String e = request.getParameter("email");
    String p = request.getParameter("password");

    boolean recordFound = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");

        // Use PreparedStatement to prevent SQL injection
        String query = "SELECT * FROM reg WHERE username = ? AND email = ? AND password = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, u);
        ps.setString(2, e);
        ps.setString(3, p);
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // If a record is found
            recordFound = true;
            // Set the username in session
            HttpSession session1 = request.getSession();
            session.setAttribute("username", u); // Store the username in the session
            
            out.println("<script>");
            out.println("window.alert('Login Successful');");
            out.println("window.location.href='welcome.jsp';"); // Redirect to welcome.jsp
            out.println("</script>");
        } else {
            // If no record is found
            out.println("<script>");
            out.println("window.alert('Record Not Found');");
            out.println("window.location.href='register.html';"); // Make sure to correct the spelling to "register.html"
            out.println("</script>");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception ex) {
        ex.printStackTrace();
        out.println("<script>");
        out.println("window.alert('Error: " + ex.getMessage() + "');");
        out.println("window.location.href='login.html';");
        out.println("</script>");
    }
%>
</body>
</html>
