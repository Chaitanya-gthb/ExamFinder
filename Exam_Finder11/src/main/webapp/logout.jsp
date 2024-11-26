<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Logout</title>
</head>
<body>
<%
    // Invalidate the current session to log out the user
    HttpSession session1 = request.getSession(false); // Get the existing session
    if (session != null) {
        session.invalidate(); // Invalidate the session
    }

    // Redirect to the login page
    response.sendRedirect("index.html");
%>
</body>
</html>
