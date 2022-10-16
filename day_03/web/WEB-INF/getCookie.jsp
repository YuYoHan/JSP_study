<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-16
  Time: 오전 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>getCookie</title>
</head>
<body>
  <%
    // 헤더에 Cookie라는것이 있니?
    // 요청에 있는 header중에서 Cookie라는 이름의 헤더가 있는지 확인
    // null이라면 전송된 쿠키가 없다는 뜻
    String check = request.getHeader("Cookie");

    // null이 아니라면
    if(check != null) {
      // cookie는 요청에 담겨져 있기때문에 request로 받아올 수 있다.
      // 전송된 쿠키 객체들의 배열
      Cookie[] cookies = request.getCookies();

      for (Cookie cookie : cookies) {
            out.print(cookie.getName() + " : ");
            out.print(cookie.getValue() + "<br>");
      }

    }

  %>
</body>
</html>
