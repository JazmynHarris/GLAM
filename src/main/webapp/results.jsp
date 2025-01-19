<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="app.css" />


<meta charset="UTF-8">
<title>User Budget</title>

<style>
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

<h1>Budget Generator</h1>


<body>

	<%
	Double income = Double.parseDouble(request.getParameter("income"));
	Double housing = income * 0.3;
	Double utilities = income * 0.07;
	Double groceries = income * 0.1;
	Double transportation = income * 0.08;
	Double entertainment = income * 0.1;
	Double travel = income * 0.08;
	Double shopping = income * 0.07;
	Double hobbiesRec = income * 0.05;
	Double emergency = income * 0.05;
	Double retirement = income * 0.08;
	Double investments = income * 0.02;
	%>

	<table>
		<tbody>
			<tr>
				<td>Housing:</td>
				<td><%="$" + String.format("%.2f", housing)%></td>
			</tr>

			<tr>
				<td>Utilities:</td>
				<td><%="$" + String.format("%.2f", utilities)%></td>
			</tr>

			<tr>
				<td>Groceries:</td>
				<td><%="$" + String.format("%.2f", groceries)%></td>
			</tr>

			<tr>
				<td>Transportation:</td>
				<td><%="$" + String.format("%.2f", transportation)%></td>
			</tr>

			<tr>
				<td>Entertainment:</td>
				<td><%="$" + String.format("%.2f", entertainment)%></td>
			</tr>

			<tr>
				<td>Travel:</td>
				<td><%="$" + String.format("%.2f", travel)%></td>
			</tr>

			<tr>
				<td>Shopping:</td>
				<td><%="$" + String.format("%.2f", shopping)%></td>
			</tr>

			<tr>
				<td>Hobbies and Recreation:</td>
				<td><%="$" + String.format("%.2f", hobbiesRec)%></td>
			</tr>

			<tr>
				<td>Emergency Fund:</td>
				<td><%="$" + String.format("%.2f", emergency)%></td>
			</tr>

			<tr>
				<td>Retirement Savings:</td>
				<td><%="$" + String.format("%.2f", retirement)%></td>
			</tr>

			<tr>
				<td>Investments:</td>
				<td><%="$" + String.format("%.2f", investments)%></td>
			</tr>

		</tbody>
	</table>


</body>
</html>