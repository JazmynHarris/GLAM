<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%
String goalParam = request.getParameter("goal");
String currentSavingsParam = request.getParameter("currentSavings");
String monthlyContributionParam = request.getParameter("monthlyContribution");

double goal = goalParam != null ? Double.parseDouble(goalParam) : 0;
double currentSavings = currentSavingsParam != null ? Double.parseDouble(currentSavingsParam) : 0;
double monthlyContribution = monthlyContributionParam != null ? Double.parseDouble(monthlyContributionParam) : 0;

double progress = currentSavings / goal * 100;
int monthsToGoal = (goal > currentSavings) ? (int) Math.ceil((goal - currentSavings) / monthlyContribution) : 0;

String message;
if (progress >= 100) {
	message = "🎉 Congratulations! You've reached your savings goal!";
} else if (progress >= 75) {
	message = "You're almost there! Keep going!";
} else if (progress >= 50) {
	message = "You're halfway to your goal. Great progress!";
} else if (progress > 0) {
	message = "Good start! Keep saving to reach your goal.";
} else {
	message = "Enter your savings details to get started.";
}

double progressBarWidth = progress > 100 ? 100 : progress;
String progressColor = progress < 50 ? "#ffc107" : (progress < 100 ? "#28a745" : "#007bff");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Savings Progress Tracker</title>
<link rel="stylesheet" href="app.css">
<style>
.container {
	width: 50%;
	margin: 50px auto;
	padding: 20px;
	background: #a3c3e0;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

label {
	font-weight: bold;
}

input {
	padding: 10px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button {
	padding: 10px;
	font-size: 1rem;
	background: #1f4b7a;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background 0.3s;
}

button:hover {
	background: #4c7ea9;
}

.results {
	margin-top: 20px;
	padding: 15px;
	background: #f6dae6;
	border-radius: 4px;
}

.progress-container {
	width: 100%;
	background-color: #e9ecef;
	border: 1px solid #ccc;
	border-radius: 8px;
	overflow: hidden;
	margin-top: 20px;
}

.progress-bar {
	height: 30px;
	background-color: #28a745;
	text-align: center;
	color: white;
	line-height: 30px; /* Align text vertically */
	font-weight: bold;
	transition: width 0.4s ease; /* Smooth animation */
}

.logo {
	width: 200px;
	height: auto;
}

.header {
	 display: flex;
    align-items: center; /* Vertically aligns items */
    gap: 10px;
}
</style>

</head>
<body>

	<div class="header">
		<h1>Girls Learning About Money</h1>
		<div class="center-logo">
			<img src="minilogo.png" alt="GLAM Logo2" class="logo">
		</div>

	</div>

	<!-- <img alt="img-logo" src="img/finhackLogo.jpg" alt="my eye">  -->

	<ul>
		<li><a class="active" href="index.jsp">Home</a></li>
		<li><a href="savings.jsp">Goal Tracker</a></li>
		<li><a href="flashCards.jsp">Flashcards</a></li>
		<li><a href="budgetGen.jsp">Budget Generator</a></li>
		<li><a href="about.jsp">About</a></li>
	</ul>
	
	<h1>GOAL TRACKER</h1>

	<div class="container">

		<form method="get" action="savings.jsp">
			<label for="goal">Savings Goal ($):</label> <input type="number"
				step="0.01" id="goal" name="goal" value="<%=goal%>" required>

			<label for="currentSavings">Current Savings ($):</label> <input
				type="number" step="0.01" id="currentSavings" name="currentSavings"
				value="<%=currentSavings%>" required> <label
				for="monthlyContribution">Monthly Contribution ($):</label> <input
				type="number" step="0.01" id="monthlyContribution"
				name="monthlyContribution" value="<%=monthlyContribution%>" required>

			<button type="submit">Track Progress</button>
		</form>

		<%
		if (goal > 0 && currentSavings >= 0 && monthlyContribution > 0) {
		%>
		<div class="results">
			<h2>Progress</h2>

			<div class="progress-container">
				<div class="progress-bar"
					style="width: <%=progressBarWidth%>%; background-color: <%=progressColor%>;">
					<%=new DecimalFormat("#0.00").format(progressBarWidth)%>%
				</div>
			</div>
			<p>
				Savings Goal: $<%=new DecimalFormat("#,##0.00").format(goal)%></p>
			<p>
				Current Savings: $<%=new DecimalFormat("#,##0.00").format(currentSavings)%></p>
			<p>
				Progress:
				<%=new DecimalFormat("#0.00").format(progress)%>%
			</p>
			<p>
				Estimated Time to Reach Goal:
				<%=monthsToGoal%>
				month(s)
			</p>
			<h3><%=message%></h3>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>
