<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Exam Reminder Email</title>
    <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 600px;
            width: 100%;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        p {
            font-size: 16px;
            color: #555;
        }
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .home-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            color: #333;
            cursor: pointer;
        }
    </style>
    <script>
        // Initialize EmailJS
        (function(){
            emailjs.init("H0K0vhyqzGbWJMFzr"); // Replace with your EmailJS public key
        })();

        function sendEmail(recipientName, userEmail, examName, startDate, endDate, examDate) {
            const templateParams = {
                name: recipientName,
                email: userEmail,
                exam_name: examName,
                start_date: startDate,
                end_date: endDate,
                exam_date: examDate
            };

            emailjs.send("service_i40evrw", "template_s9thzob", templateParams)
                .then(function(response) {
                    console.log('SUCCESS!', response.status, response.text);
                    document.getElementById("emailStatus").innerHTML = "<div class='success-message'>Email sent successfully!</div>";
                }, function(error) {
                    console.log('FAILED...', error);
                    document.getElementById("emailStatus").innerHTML = "<div class='error-message'>Failed to send email. Please try again.</div>";
                });
        }
    </script>
</head>
<body>

<div class="container">
    <i class="fas fa-home home-icon" onclick="window.location.href='index.html'"></i>
    <h1>Exam Reminder</h1>

<%
    String examCodeStr = request.getParameter("examCode");
    String recipientName = request.getParameter("name");
    String userEmail = request.getParameter("email");

    out.println("<p>Exam Code: " + examCodeStr + "</p>");
    out.println("<p>Name: " + recipientName + "</p>");
    out.println("<p>Email: " + userEmail + "</p>");

    String url = "jdbc:mysql://localhost:3307/exam_finder";
    String username = "root"; // Your database username
    String password = ""; // Your database password

    String examName = "";
    Date applicationStartDate = null;
    Date applicationEndDate = null;
    Date examDate = null;

    if (examCodeStr == null || examCodeStr.isEmpty()) {
        out.println("<div class='error-message'>Error: Exam code is missing.</div>");
    } else {
        try {
            int examCode = Integer.parseInt(examCodeStr);
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);

            String query = "SELECT e_name, e_start_date, e_end_date, e_date FROM examdata WHERE e_code = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, examCode);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                examName = rs.getString("e_name");
                applicationStartDate = rs.getDate("e_start_date");
                applicationEndDate = rs.getDate("e_end_date");
                examDate = rs.getDate("e_date");
            } else {
                out.println("<div class='error-message'>No exam found for the provided code.</div>");
            }
            con.close();
        } catch (NumberFormatException e) {
            out.println("<div class='error-message'>Error: Invalid exam code format.</div>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='error-message'>Error fetching exam details: " + e.getMessage() + "</div>");
        }
    }
%>

<script>
    if ("<%= examName %>" !== "") {
        sendEmail("<%= recipientName %>", "<%= userEmail %>", "<%= examName %>", 
                   "<%= applicationStartDate %>", "<%= applicationEndDate %>", "<%= examDate %>");
    }
</script>

<div id="emailStatus"></div>
</div>

</body>
</html>
