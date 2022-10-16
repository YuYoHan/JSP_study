<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-16
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update_check</title>
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

            if(cookie.getName().equals("crash_strawberry")) {
                // 생명주기
                // remove메소드가 없기 때문에 생명주기로 삭제해야 한다.
                // 초단위로 지정하고 음수를 입력하면 브라우저 종료시 쿠키 삭제(default)
                cookie.setMaxAge(0);
                // 쿠키를 삭제한 것은 원본에 넣어주는 것이다.
                response.addCookie(cookie);
            }
            }


    }

%>
    <a href="getCookie.jsp">쿠키 삭제 확인하기~ </a>
</body>
</html>
