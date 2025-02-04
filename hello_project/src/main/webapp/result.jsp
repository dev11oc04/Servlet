<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
    <link rel="stylesheet" type="text/css" href="Style.css">
</head>
<body>
    <div class="calculator">
        <h2>Result: <%= request.getAttribute("result") %></h2>
        <a href="index.jsp">Back</a>
    </div>
</body>
</html>