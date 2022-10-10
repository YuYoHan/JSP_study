<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-09
  Time: 오후 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>paramTest</title>
</head>
<body>
  <h2>아이예뻐</h2>
  <jsp:forward page="paramResult.jsp">
      <jsp:param name="userid" value="apple"/>
      <jsp:param name="userpw" value="abcd1234"/>
      <jsp:param name="김사과" value="username"/>
  </jsp:forward>
</body>
</html>
