<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="com.google.gson.*"%>
<!-- Include Gson for JSON parsing -->
<%
// Path to the JSON file
String jsonFilePath = application.getRealPath("/financialVocab.json");

// Read the JSON file into a string
String jsonData = new String(Files.readAllBytes(Paths.get(jsonFilePath)), "UTF-8");

// Parse JSON string into a Map
Gson gson = new Gson();
Map<String, String> flashcards = gson.fromJson(jsonData, Map.class);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Financial Flashcards</title>
<link rel="stylesheet" href="app.css" />
<style>
/* Add your CSS here (same as before) */
.flashcards-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: center;
	margin-top: 20px;
	text-align: center;
}

.flashcard {
	width: 200px;
	height: 150px;
	perspective: 1000px;
	cursor: pointer;
}

.flashcard-inner {
	width: 100%;
	height: 100%;
	position: relative;
	transform-style: preserve-3d;
	transition: transform 0.6s;
}

.flashcard.flip .flashcard-inner {
	transform: rotateY(180deg);
}

.flashcard-front, .flashcard-back {
	width: 100%;
	height: 100%;
	position: absolute;
	backface-visibility: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 18px;
	font-weight: bold;
	border: 1px solid #ccc;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.flashcard-front {
	background-color: #4c7ea9;
	color: #fff;
}

.flashcard-back {
	background-color: #a3c3e0;
	color: #333;
	transform: rotateY(180deg);
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
	
	
	<h1>Financial Flashcards</h1>
	<div class="flashcards-container">
		<%
		for (Map.Entry<String, String> entry : flashcards.entrySet()) {
		%>
		<div class="flashcard" onclick="flipCard(this)">
			<div class="flashcard-inner">
				<div class="flashcard-front">
					<%=entry.getKey()%>
				</div>
				<div class="flashcard-back">
					<%=entry.getValue()%>
				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>

	<script>
		function flipCard(card) {
			card.classList.toggle("flip");
		}
	</script>
</body>
</html>
