<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam Data</title>
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
    #downloadPDF, #printPage {
      background: transparent;
      height: fit-content;
      padding: 20px;
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
    .h1{
    text-align: center;}
    
</style>
</head>
<body>


<button id="printPage">Print Data</button>

<h1 class="h1">EXAM DATA</h1>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder", "root", "");
	PreparedStatement ps = con.prepareStatement("select * from examdata");
	ResultSet rs = ps.executeQuery();
	
	 	out.println("<table>");
	    out.println("<tr>");
	    out.println("<th>Exam Code</th>");
	    out.println("<th>Exam Name</th>");
	    out.println("<th>Application Start Date</th>");
	    out.println("<th>Application End Date</th>");
	    out.println("<th>Eligible Age</th>");
	    out.println("<th>Eligible Field</th>");
	    out.println("<th>Exam Type</th>");
	    out.println("<th>Exam Fees</th>");
	    out.println("<th>Exam Syllabus</th>");
	    out.println("<th>Exam Date</th>");
	    out.println("<th>Highest Qualification</th>");
	    out.println("</tr>");
	    
	    while(rs.next())
	    {
	    	out.println("<tr>");
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
            out.println("</tr>");
	    }
	    
	    out.println("</table>");
%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<script>
// PDF Download functionality

// Print functionality
let printBtn = document.getElementById('printPage');
printBtn.addEventListener('click', () => {
    window.print();  // This will open the browser's print dialog
});
</script>

</body>
</html>
