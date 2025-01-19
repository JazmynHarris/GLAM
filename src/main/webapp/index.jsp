<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="app.css" />

<meta charset="UTF-8">
<title>GLAM</title>

<style>
.center-logo {
	text-align: center;
}

img {
	width: 700px;
	height: auto;
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

	<div class="center-logo">
		<img src="logo.jpg" alt="GLAM Logo">
	</div>



</body>
</html>