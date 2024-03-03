<%-- 
    Document   : checkAnswers
    Created on : Mar 3, 2024, 5:13:57 PM
    Author     : Bailey
--%>

<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
</head>
<body>
    <h1>Quiz Result</h1>
    
    <%-- Check answers and display result --%>
    <%
        List<String> questions = (List<String>) session.getAttribute("questions");
        List<String> answers = (List<String>) session.getAttribute("answers");
        int correctCount = 0;
        
        for (int i = 0; i < questions.size(); i++) {
            String userAnswer = request.getParameter("answer" + i);
            String correctAnswer = answers.get(i);
            boolean isCorrect = userAnswer.equals(correctAnswer);
            
            if (isCorrect) {
                correctCount++;
            }
    %>
    <p><%= questions.get(i) %> = <%= userAnswer %> (<%= isCorrect ? "Correct" : "Wrong" %>)</p>
    <% } %>
    
    <p>The total correct count is <%= correctCount %>.</p>
</body>
</html>
