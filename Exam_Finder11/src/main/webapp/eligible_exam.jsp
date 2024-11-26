<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <title>Eligible Exams</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://plus.unsplash.com/premium_photo-1669550788590-859353c91996?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
            background-size: cover;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            overflow-y: scroll;
            overflow-x: hidden;
        }
        .container {
            width: 75%;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.3);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.9);
            border-radius: 8px;
            color: white;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: white;
            width: fit-content;
            font-size: 25px;
            margin-left: 430px;
            background: rgba(0, 0, 0, 0.3);
            padding: 20px;
        }
        table {
            width: 100%;
            background: rgba(0, 0, 0, 0.5);
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: rgba(0, 0, 0, 0.5);
            color: white;
            font-weight: bolder;
        }
        tr {
            color: white;
        }
        .send-reminder {
            background-color: #28a745;
            color: white;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
        }
        .send-reminder:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Eligible Exams for You</h2>

    <%
        int i = 1;
        // Retrieve form data
        String age = request.getParameter("age");
        String field = request.getParameter("field");
        String qualification = request.getParameter("qualification");
        String gender = request.getParameter("gender");
        String examtype = request.getParameter("examType");

        // Initialize database connection variables
        String url = "jdbc:mysql://localhost:3307/exam_finder";
        String username = "root";
        String password = "";

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            Connection con = DriverManager.getConnection(url, username, password);

            // Insert the form data into the table
            String insertQuery = "INSERT INTO eligible_user (age, field, qualification, gender, exam_type) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement insertPs = con.prepareStatement(insertQuery);
            insertPs.setInt(1, Integer.parseInt(age));
            insertPs.setString(2, field);
            insertPs.setString(3, qualification);
            insertPs.setString(4, gender);
            insertPs.setString(5, examtype);
            insertPs.executeUpdate(); // Execute the insert query

            // SQL query to select eligible exams based on user input
            String query = "SELECT * FROM examdata WHERE ? BETWEEN e_eligible_startAge AND e_eligible_endAge " +
                           "AND ( e_eligible_field = 'All Streams' OR e_eligible_field='General' OR e_eligible_field = ?) " + 
                           "AND ((? = 'Graduate' AND (qualification IN ('Graduate', '12th Pass', '10th Pass'))) " +
                           "OR (? = '12th Pass' AND (qualification IN ('12th Pass', '10th Pass'))) " +
                           "OR (? = '10th Pass' AND qualification = '10th Pass'))";
            
            
            // Additional logic to handle Science with Maths and Bio combination
            if (field.equals("Science with Maths and Bio")) {
                query += " OR e_eligible_field IN ('Science with Maths', 'Science with Bio')";
            }

            // Create a prepared statement for the select query
            PreparedStatement ps = con.prepareStatement(query);

            // Set parameters for the prepared statement
            ps.setInt(1, Integer.parseInt(age));
            ps.setString(2, field);
            ps.setString(3, qualification);
            ps.setString(4, qualification);
            ps.setString(5, qualification);

            // Execute query and get result set
            ResultSet rs = ps.executeQuery();

            // Check if any exams match the criteria
            if (!rs.isBeforeFirst()) {
                out.println("<p>No exams found for your criteria.</p>");
            } else {
    %>
                <table>
                    <tr>
                        <th>Sr No.</th>
                        <th>Exam Code</th>
                        <th>Exam Name</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Eligible Age</th>
                        <th>Eligible Field</th>
                        <th>Exam Type</th>
                        <th>Fees</th>
                        <th>Syllabus</th>
                        <th>Exam Date</th>
                        <th>Highest Qualification</th>
                        <th>Action</th>
                    </tr>
    <%
                // Loop through the result set and display exam details
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + i + "</td>");
                    out.println("<td>" + rs.getInt("e_code") + "</td>");
                    out.println("<td>" + rs.getString("e_name") + "</td>");
                    out.println("<td>" + rs.getDate("e_start_date") + "</td>");
                    out.println("<td>" + rs.getDate("e_end_date") + "</td>");
                    out.println("<td>" + rs.getInt("e_eligible_startAge") + "-" + rs.getInt("e_eligible_endAge") + "</td>");
                    out.println("<td>" + rs.getString("e_eligible_field") + "</td>");
                    out.println("<td>" + rs.getString("e_type") + "</td>");
                    out.println("<td>" + rs.getFloat("e_fees") + "</td>");
                    out.println("<td>" + rs.getString("e_syllabus") + "</td>");
                    out.println("<td>" + rs.getDate("e_date") + "</td>");
                    out.println("<td>" + rs.getString("qualification") + "</td>");
                    out.println("<td><a href='index11.html?examCode=" + rs.getInt("e_code") + "&examName=" + URLEncoder.encode(rs.getString("e_name"), "UTF-8") + "' class='send-reminder'>Send Reminder</a></td>");
                    out.println("</tr>");
                    i++;
                }
    %>
                </table>
    <%
            }

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
</div>
</body>
</html>
