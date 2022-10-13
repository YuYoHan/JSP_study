<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
  Class.forName("com.mysql.cj.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/jsp";
  String user = "root";
  String password = "1234";


  Connection conn = DriverManager.getConnection(url, user, password);

  String sql = "insert into test_user values(?,?,?)";
  PreparedStatement ps = conn.prepareStatement(sql);

  ps.setString(1, request.getParameter("userId"));
  ps.setString(2, request.getParameter("userPw"));
  ps.setString(3, request.getParameter("userName"));

  int result = ps.executeUpdate();

  if(result == 1) {
    // 성공
    response.sendRedirect("join_success.jsp");
  } else {
    // 실패
    response.sendRedirect("join_fail.jsp");
  }
%>