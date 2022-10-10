<%@ page import="test.TestDTO" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-10
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>beenResult</title>
</head>
<body>
<%--  아래는 이거와 같은 의미이다.
      TestDTO dto = new TestDTO();
      id는 객체명--%>
  <jsp:useBean id="dto" class="test.TestDTO"/>
  <%--여기서 name이 세팅해줄 객체명 --%>
<!--    실제 파라미터의 name과 dto의 필드명이 동일하다면 param, value 속성을 생략
        생략시 알아서 같은 name을 가지고 있는 param의 값으로 세팅-->
  <jsp:setProperty name="dto" property="intdata" param="num1"/>
  <jsp:getProperty name="dto" property="intdata"/>
</body>
</html>
