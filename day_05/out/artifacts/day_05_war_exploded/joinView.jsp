<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-22
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<form name="joinForm" method="post" action="join_db.jsp">
    <table>
        <tr>
            <td id="result" colspan="2"></td>
        </tr>
        <tr>
            <th><label for="userid">아이디</label> </th>
            <td>
                <input type="text" name="userid" id="userid">
                <input type="button" value="중복검사" onclick="chekId()">
            </td>

        </tr>
    </table>
</form>
</body>
</html>
