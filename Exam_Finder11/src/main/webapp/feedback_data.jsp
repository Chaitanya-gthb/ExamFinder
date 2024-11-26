<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback Data</title>
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
    #downloadPDF, #printPage {
        background: transparent;
        padding: 10px 30px;
        border: 1px solid black;
        background-color: black;
        color: white;
        font-size: 18px;
        margin-top: 20px;
        cursor: pointer;
    }
    #downloadPDF:hover, #printPage:hover {
        background-color: grey;
    }
</style>
</head>
<body>
<div class="data">
    <button id="printPage">Print Data</button>
    <h1 class="h1">FEEDBACK DATA</h1>
    <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");
            ps = con.prepareStatement("SELECT * FROM feedback");
            rs = ps.executeQuery();
            
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>Name</th>");
            out.println("<th>Email</th>");
            out.println("<th>Rating </th>");
            out.println("<th>Comment</th>");
            out.println("<th>Recorded On</th>");
            out.println("</tr>");
        	
        	while(rs.next()) {
        		 out.println("<tr>");
        	        out.println("<td>" + rs.getString("name") + "</td>");
        	        out.println("<td>" + rs.getString("email") + "</td>");
        	        out.println("<td>" + rs.getString("rating") + "</td>");
        	        out.println("<td>" + rs.getString("comment") + "</td>");
        	        out.println("<td>" + rs.getTimestamp("recorded_on") + "</td>");
        	        out.println("</tr>");
        	}
        	out.println("</table>");
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("Error closing resources: " + e.getMessage());
            }
        }
    %>
</div>

<script type="text/javascript">
let printBtn = document.getElementById('printPage');
printBtn.addEventListener('click', () => {
    // Temporarily hide the button
    printBtn.style.display = 'none';
    
    // Trigger the print dialog
    window.print();
    
    // Show the button again after printing
    setTimeout(() => {
        printBtn.style.display = 'block';
    }, 500);  // Slight delay to ensure the print dialog is shown before restoring the button
});
</script>
</body>
</html>
