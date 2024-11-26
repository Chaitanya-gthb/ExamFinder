<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Page</title>
    <link rel="stylesheet" href="welcome1.css" />
    <link rel="icon" href="https://yt3.ggpht.com/a/AGF-l78km1YyNXmF0r3-0CycCA0HLA_i6zYn_8NZEg=s900-c-k-c0xffffffff-no-rj-mo" type="image/gif" sizes="16x16">
</head>
<body>
    <%
        // Retrieve the session and get the username
        HttpSession session1 = request.getSession(false); // Get existing session, but do not create a new one
        String username = (session != null) ? (String) session.getAttribute("username") : null;

        if (username == null) {
            // If the user is not logged in, redirect them to the login page
            response.sendRedirect("login.jsp");
            return; // Stop further processing
        }
    %>

   <div class="main_box">
		<div class="navbar">
			<h1 class="logo">EXAMNET</h1>
			<p class="pipe">|</p>
			<ul>
				<li class="li"><a href="#"> HOME </a></li>
				<li class="li outer_li"><a href="exam11.html"> EXAMS </a>
					<ul class="inner_ul">
						<li><a href="exam11.html"> 10th pass </a></li>
						<li><a href="exam11.html"> 12th pass </a></li>
						<li><a href="exam11.html"> Graduates </a></li>
					</ul></li>
				<li class="li"><a href="feedback.html"> FEEDBACK </a></li>
				<li class="li"><a href="about.html"> ABOUT US </a></li>
			</ul>
			<div class="user-info">
                <span class="idx_user">Welcome, <%= username %>!</span>
                <form action="logout.jsp" method="post" style="display:inline;">
                    <button type="submit" class="login btn">LOGOUT</button>
                </form>
            </div>
		</div>

		<div class="content">
			<div class="box">
				<div class="main">
					<h1 class="head">WELCOME TO EXAMNET</h1>
					<p class="descrip">Find Your Perfect Exam Instantly with Our
						Comprehensive Exam Finder.</p>
					<a href="exam11.html">
						<button class="ex_btns">Find Exams</button>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="services">
		<p>
			One platform,<br /> Many exams
		</p>
		<div class="outer_box">
			<div class="box">
				<h2>High-School level</h2>
				<br>
				<p class="info1">After completing the 10th grade in India,
					several exams can help students to pursue specific career paths or
					gain admission into various courses.</p>
			</div>
			<div class="box ">
				<h2>Junior college level</h2>
				<br>
				<p class="info2">After completing the Junior college level in
					India, several exams can help students to pursue specific career
					paths or gain admission into various courses.</p>
			</div>
			<div class="box">
				<h2>Senior college level</h2>
				<br>
				<p class="info3">After completing the Senior college level in
					India, several exams can help students to pursue specific career
					paths or gain admission into various courses.</p>
			</div>

			<div class="features">
				<p class="head">System features</p>
				<br>
				<br>
				<div class="head-area">
					<div class="area a1">
						<h2 class="heading1">Reminder through email</h2>
						<br>
						<p>
							Never miss an important deadline with our Email Reminder service.
							At ExamFinder, we understand that keeping track of multiple exam
							dates can be challenging. That’s why we offer personalized email
							reminders to ensure you stay ahead of your schedule. <br>
							<br>&#x2022; Customized Alerts<br>
							<br> &#x2022; Timely Notifications<br>
							<br> &#x2022; Easy to Manage
						</p>
					</div>
					<div class="area a2">
						<h2 class="heading2">Personalised exam finder</h2>
						<br>
						<p>
							Discover exams tailored to your goals with our Personalized Exam
							Finder. At ExamFinder, we know that every student's journey is
							unique. That’s why we’ve created a smart, personalized exam
							search tool that matches exams. <br>
							<br>&#x2022; Tailored Recommendations<br>
							<br> &#x2022; Advanced Filters<br>
							<br> &#x2022; Seamless Experience
						</p>
					</div>
				</div>
			</div>

			<div class="feedback_box">
				<div class="box1">
					<h1>Feedback</h1>
				</div>
				<div class="box2">
					<p>
						Share your thoughts! We're committed to providing the<br>
						best possible experience for our users. Your feedback is<br>
						essential in helping us achieve this goal. Take a minute to<br>
						tell us what you think and help us make our <b>EXAMNET</b><br>
						website even better.
					</p>
					<a href="feedback.html">
						<button>Give Us Feedback</button>
					</a>
				</div>
			</div>

			<footer>
				<h1>Stay Connected</h1>
				<div class="cmp">
					<h1>EXAMNET</h1>
				</div>
				<div class="content">
					<div class="box1">
						<p>HOME - EXAMS - FEEDBACK - ABOUT US</p>
						<p class="grey">EXAMNET@2024</p>
					</div>
					<div class="box2">
						<p>ABOUT THE COMPANY</p>
						<p class="grey">FIND EXAMS QUICKLY WITH OUR SERVICES.</p>
						<p class="mail">examnet@gmail.com</p>
					</div>
				</div>
				<div class="social">
					<img src="icons8-facebook-48.png"> <img
						src="icons8-linkedin-48.png"> <img
						src="icons8-instagram-48.png">
				</div>
			</footer>

</body>
</html>
