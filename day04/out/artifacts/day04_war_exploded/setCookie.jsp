<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>setCookie</title>
</head>
<body>
<%
    Cookie cookie1 = new Cookie("cereal", "good");
    Cookie cookie2 = new Cookie("crash_strawberry", "bad");

    // 사용자 컴퓨터에 저장해야 하므로 응답을 통해서 생성한
    // 쿠키를 보내 저장해야 한다.
    response.addCookie(cookie1);
    response.addCookie(cookie2);
%>
<a href="getCookie.jsp">생성된 쿠키 확인</a>
</body>
</html>
