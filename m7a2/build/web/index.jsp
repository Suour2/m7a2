<%-- 
    Document   : additionQuiz
    Created on : Mar 3, 2024, 5:12:59 PM
    Author     : Bailey
--%>

<%@ page import="java.util.Random" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Addition Quiz</title>
</head>
<body>
    <h1>Addition Quiz</h1>
    
    <%-- Generate random addition questions --%>
    <%
        Random random = new Random();
        List<String> questions = new ArrayList<>();
        List<String> answers = new ArrayList<>();
        int totalQuestions = 10;
        
        for (int i = 0; i < totalQuestions; i++) {
            int num1 = random.nextInt(100);
            int num2 = random.nextInt(100);
            int sum = num1 + num2;
            
            questions.add(num1 + " + " + num2);
            answers.add(String.valueOf(sum));
        }
        
        session.setAttribute("questions", questions);
        session.setAttribute("answers", answers);
    %>
    
    <form action="checkAnswers.jsp" method="post">
        <%-- Display random addition questions --%>
        <% for (int i = 0; i < questions.size(); i++) { %>
        <p><%= questions.get(i) %> = <input type="text" name="answer<%= i %>" /></p>
        <% } %>
        
        <input type="submit" value="Submit" />
    </form>
    
    <p>Click the browser's refresh button to get a new quiz.</p>
</body>
</html>

