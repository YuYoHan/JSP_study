<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-09
  Time: 오후 8:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>paramResult</title>
</head>
<body>
    <h2>이동된 페이지</h2>
    <p>
        아이디 : <%=request.getParameter("userid")%>>
    </p>
    <p>
        비밀번호 : <%=request.getParameter("userpw")%>>
    </p>
    <p>
        이름 : <%=request.getParameter("username")%>
    </p>
</body>
</html>
