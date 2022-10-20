<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-20
  Time: 오후 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>session</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    Class.forName("com.mysql.cj.jdbc.Driver");

    String url = "jdbc:mysql://localhost:3306/jsp";
    String user = "root";
    String password = "1234";

    Connection conn = DriverManager.getConnection(url, user, password);

    String sql = "select * from test_user where userid=? and userpw=?";
    PreparedStatement ps = conn.prepareStatement(sql);

    String userid = request.getParameter("userId");
    String userpw = request.getParameter("userPw");
    ps.setString(1, userid);
    ps.setString(2, userpw);

    // ResultSet은 ResultSet타입으로 반환을 해주어 결과값을 저장할 수 있다.
    // 저장된 값을 한 행 단위로 불러올 수 있고 한 행에서 값을 가져올 때는 타입을 지정해 불러올 수 있다.
    // executeQuery는 select구문을 수행할 때 사용되는 함수이다.
    // 수행결과로 ResultSet 객체의 값을 반환합니다.
    ResultSet rs = ps.executeQuery();

    // 위에서 한행 단위로 불러온 것을 next메소드를 통해 선택되는 행을 바꿀 수 있다.
    // 그리고 내려갈 다음행이 있을 경우 true를 반환
    // 없으면 false를 반환한다.
    if(rs.next()) {
        session.setAttribute("loginUser", userid);
        response.sendRedirect("main.jsp");
    } else {
        out.println("<script>");
        out.println("alert('로그인을 실패했습니다!')");
        out.println("location.href= 'login.jsp'");
        out.println("</script>");
    }
%>
</body>
</html>
