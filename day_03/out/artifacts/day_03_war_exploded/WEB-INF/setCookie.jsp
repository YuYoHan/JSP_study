<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>setCookie</title>
</head>
<body>
    <%
        Cookie cookie1 = new Cookie("cereal", "good");
        Cookie cookie2 = new Cookie("crash_strawberry", "bad");

        response.addCookie(cookie1);
        response.addCookie(cookie2);
    %>
</body>
</html>
