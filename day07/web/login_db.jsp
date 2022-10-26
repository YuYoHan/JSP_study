<%@ page import="com.koreait.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  UserDAO udao = new UserDAO();

  // input에서 작성햇던 데이터들을 아래의 메소드를 통해서 가져올 수 있다.
  String userid = request.getParameter("userid");
  String userpw = request.getParameter("userpw");

  if(udao.login(userid, userpw)) {
    session.setAttribute("loginUser", userid);
    response.sendRedirect("mainView.jsp");
  } else{
    response.sendRedirect("loginView.jsp?l=f");
  }

%>