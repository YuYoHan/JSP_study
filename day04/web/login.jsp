<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
  <%
    Cookie[] cookies = request.getCookies();
    String joinId = null;

    for (Cookie cookie : cookies) {
      if(cookie.getName().equals("joinId")) {
        joinId = cookie.getValue();

        // 사용자 컴퓨터에 있는 것을 지워주는 것이다.
        // 쿠키를 다 사용했으니 사용자 컴퓨터에 있는 쿠키를 지워주는 것이다.
        cookie.setMaxAge(0);
        response.addCookie(cookie);
      }
    }
  %>
  <hr>
  <form name="loginForm">
    아이디 : <input type="text" name="userId" placeholder="아이디를 입력하세요" value="<%=joinId == null ? "":joinId %>">
    비밀번호 : <input type="password" name="userPw" placeholder="비밀번호를 입력하세요">
    <input type="submit" value="로그인">
  </form>
</body>
<%
  if(joinId != null) {
%>
<script>document.loginForm.userPw.focus();</script>
<%
  }
%>
</html>
