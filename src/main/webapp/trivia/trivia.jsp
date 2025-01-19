
<%@ page import="java.util.List" %>



<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finance Trivia</title>
    <link rel ="stylesheet" href="app.css"/>
</head>

<body>
    <div class="container">
        <h1>Trivia Game</h1>
        <div class="question">
            <h2><%= request.getAttribute("question") != null ? ((trivia.Question) request.getAttribute("question")).getCategory() : "No Category" %></h2>
            <p><%= request.getAttribute("question") != null ? ((trivia.Question) request.getAttribute("question")).getQuestionText() : "No Questions" %></p>
        </div>
        <form method="post" action="trivia">
            <ul class="options">
                <%
                    if (request.getAttribute("options") != null) {
                        String[] options = (String[]) request.getAttribute("options");
                        for (String option : options) {
                %>
                            <li>
                                <button type="submit" name="answer" value="<%= option %>"><%= option %></button>
                            </li>
                <%
                        }
                    }
                %>
            </ul>
        </form>
    </div>
</body>


</html>