<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-25
  Time: 오후 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>mainView</title>
</head>
<body>
  <table>
    <%
      String loginUser = null;
      loginUser = (String)session.getAttribute("loginUser");
      if(loginUser == null){
    %>
      <script>
        alert("로그인 후 이용하세요!");
        location.href = "loginView.jsp";
      </script>
    <%
      } else {
    %>
    <tr>
      <td><%=loginUser%> 님 방문을 환영합니다~!</td>
      <td><a href="logout_session.jsp"> 로그아웃</a></td>
    </tr>
  </table>
  <%
    }
  %>
</body>
</html>
