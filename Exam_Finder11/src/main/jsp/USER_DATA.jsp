<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Admin</title>
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
    .h1{
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

<h1 class="h1">REGISTRATION DATA</h1>

<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3307/exam_finder","root","");
	PreparedStatement ps=con.prepareStatement("select user_id, name, email, username, register_at from reg");
	ResultSet rs=ps.executeQuery();
	
	out.println("<table id='responseTable'>");
    out.println("<thead><tr>");
    out.println("<th>User ID</th>");
    out.println("<th>Name</th>");
    out.println("<th>Email</th>");
    out.println("<th>Username</th>");
    out.println("<th>Response Time</th>");  
    out.println("</tr></thead>");
    out.println("<tbody>");
	
	while(rs.next())
	{
		 out.println("<tr>");
		 out.println("<td>" + rs.getString("user_id") + "</td>");
		 out.println("<td>" + rs.getString("name") + "</td>");
         out.println("<td>" + rs.getString("email") + "</td>");
         out.println("<td>" + rs.getString("username") + "</td>");
         out.println("<td>" + rs.getTimestamp("register_at") + "</td>");  
	   		out.println("</tr>");
	}
    out.println("</tbody>");
	out.println("</table>");
%>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<script>
// Print functionality
let printBtn = document.getElementById('printPage');
printBtn.addEventListener('click', () => {
    // Temporarily hide the button
    printBtn.style.display = 'none';
    
    // Trigger the print dialog
    window.print();
    
    // Show the button again after printing
    setTimeout(() => {
        printBtn.style.display = 'block';
    }, 300);  // Slight delay to ensure the print dialog is shown before restoring the button
});
// PDF Download functionality

</script>

</body>
</html>
