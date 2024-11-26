<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form Submission</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            color: #343a40;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        p {
            margin: 15px 0;
            line-height: 1.6;
        }
        strong {
            color: #495057;
        }
        .home-icon {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 24px;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s;
        }
        .home-icon:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.html" class="home-icon" title="Home"><i class="fas fa-home"></i></a>
        <h2>Feedback Submitted</h2>
        
        <%
            // Get form data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String stars = request.getParameter("result");
            String text = request.getParameter("comments");

            // JDBC connection variables
            String jdbcURL = "jdbc:mysql://localhost:3307/exam_finder";  // Replace with your database URL
            String dbUser = "root";  // Replace with your database username
            String dbPassword = "";  // Replace with your database password

            Connection connection = null;
            PreparedStatement preparedStatement = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Establish the connection
                connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                // SQL query to insert data into the feedback table
                String sql = "INSERT INTO feedback (name, email, rating, comment, recorded_on) VALUES (?, ?, ?, ?, NOW())";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, stars);
                preparedStatement.setString(4, text);

                // Execute the insert
                int result = preparedStatement.executeUpdate();

                if (result > 0) {
                    out.println("<p>Data stored successfully!</p>");
                } else {
                    out.println("<p>Failed to store data.</p>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error occurred: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (preparedStatement != null) preparedStatement.close();
                    if (connection != null) connection.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>

        <p><strong>Name:</strong> <%= name %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Star:</strong> <%= stars %></p>
        <p><strong>Comments:</strong> <%= text %></p>
    </div>
</body>
</html>
