<%@ page import="com.koreait.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  UserDAO udao = new UserDAO();
  String userid = request.getParameter("userid");

  if(udao.checkId(userid)) {
    out.println("O");
  } else {
    out.println("X");
  }
%>
