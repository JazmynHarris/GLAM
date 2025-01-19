<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="app.css" />
<meta charset="UTF-8">
<title>Budget Generator</title>
<style>
.container {
	text-align: center;
	width: 50%;
	margin: 50px auto;
	padding: 20px;
	background: #a3c3e0;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	position: relative;
	width: 50%;
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
	<h1>Budget Generator</h1>

	<form name="budgetGenForm" action="results.jsp" method="post">
		<div class="container">
			<table>
				<tbody>
					<tr>
						<td>Income</td>
						<td><input type="text" name="income" value=0 size="50"></td>
					</tr>
				</tbody>
			</table>
			<button type="reset" value="Clear" id="clear">Clear</button>
			<button type="submit" value="Submit" id="submit">Submit</button>
		</div>



	</form>

</body>
</html>