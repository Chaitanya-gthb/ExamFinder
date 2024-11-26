<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Exam Data</title>
</head>
<body>
<%
    // Retrieve form parameters
    String exam_name = request.getParameter("exam_name");
    int eligible_starting_age = Integer.parseInt(request.getParameter("eligible_starting_age"));
    int eligible_ending_age = Integer.parseInt(request.getParameter("eligible_ending_age"));
    String eligible_field = request.getParameter("eligible_field");
    String application_start_date = request.getParameter("application_start_date");
    String application_end_date = request.getParameter("application_end_date");
    String exam_type = request.getParameter("exam_type");
    int exam_fees = Integer.parseInt(request.getParameter("exam_fees"));
    String exam_syllabus = request.getParameter("exam_syllabus");
    String exam_date = request.getParameter("exam_date");
    String highest_qualification = request.getParameter("highest-qualification"); // New addition

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam_finder", "root", "");
        
        // Prepare the SQL statement with placeholders
        String query = "INSERT INTO examdata (e_name, e_start_date, e_eligible_startAge, e_eligible_endAge, e_eligible_field, e_type, e_fees, e_syllabus, e_date, highest_quaification) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        
        // Set parameters in the PreparedStatement
        ps.setString(1, exam_name);
        ps.setString(2, application_start_date);
        ps.setInt(3, eligible_starting_age);
        ps.setInt(4, eligible_ending_age);
        ps.setString(5, eligible_field);
        ps.setString(6, exam_type);
        ps.setInt(7, exam_fees);
        ps.setString(8, exam_syllabus);
        ps.setString(9, exam_date);
        ps.setString(10, highest_qualification); // Set highest qualification
        
        // Execute the SQL update
        int result = ps.executeUpdate();
        
        if (result > 0) {
            out.println("<script>alert('Exam Data Inserted Successfully');</script>");
        } else {
            out.println("<script>alert('Failed to Insert Exam Data');</script>");
        }
        
        // Close the PreparedStatement and connection
        ps.close();
        con.close();
        
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "');</script>");
    }
%>
</body>
</html>
