<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-25
  Time: 오후 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  if(session.getAttribute("loginUser") != null) {
    // session에 있는 데이터 전부 날려줌
    session.invalidate();
    response.sendRedirect("request.getContextPath()");
  }
%>