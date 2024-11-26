<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%
    String n = request.getParameter("name");
    String e = request.getParameter("email");
    String u = request.getParameter("Username");
    String p = request.getParameter("password");
    String re = request.getParameter("re_password");

    // Regular expression to check if the name contains only alphabets
    String namePattern = "^[a-zA-Z\\s]+$";

    if (!n.matches(namePattern)) {
        out.println("<script>");
        out.println("window.alert('Name cannot contain numbers or special characters!');");
        out.println("window.history.back();");  
        out.println("</script>");
    } else if (!p.equals(re)) {
        out.println("<script>");
        out.println("window.alert('Passwords do not match!');");
        out.println("window.history.back();");  
        out.println("</script>");
    } else {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");

            PreparedStatement checkUser = con.prepareStatement("SELECT * FROM reg WHERE username = ? OR email = ?");
            checkUser.setString(1, u);
            checkUser.setString(2, e);
            ResultSet rs = checkUser.executeQuery();

            if (rs.next()) {
                // If username or email already exists, show an error message
                out.println("<script>");
                out.println("window.alert('Username or Email already exists!');");
                out.println("window.history.back();");  // Redirect back to the registration page
                out.println("</script>");
            } else {
                // If username and email are unique, proceed with insertion
                PreparedStatement ps = con.prepareStatement("insert into reg (name, email, username, password, repass, register_at) values (?, ?, ?, ?, ?, NOW())");
                ps.setString(1, n);
                ps.setString(2, e);
                ps.setString(3, u);
                ps.setString(4, p);
                ps.setString(5, re);

                int i = ps.executeUpdate();
                if (i != 0) {
                    out.println("<script>");
                    out.println("window.alert('Registered Successfully!!');");
                    out.println("window.location.href='login.html';");
                    out.println("</script>");
                }
            }
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        }
    }
%>
</body>
</html>
