<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-10
  Time: 오후 1:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>joinview</title>
</head>
<body>
  <!--  1. 아이디, 비밀번호, 이름 ,핸드폰 번호를 입력받아서 "가입하기" 버튼 클릭
        2. join_db.jsp로 제출
        3. join_db.jsp는 제출된 데이터들을 하나의 객체로 포장
  -->
  <form action="join_db.jsp" method="post">
    아이디 : <input type="text" name="userid"><br/>
    비밀번호 : <input type="password" name="userpw"> <br/>
    휴대폰번호 : <input type="tel" name="phone_number"><br/>
    <input type="submit" value="가입하기">
  </form>
</body>
</html>
