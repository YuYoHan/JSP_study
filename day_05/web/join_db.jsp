<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="newUser" class="com.koreait.dto.UserDTO"></jsp:useBean>

<jsp:setProperty name="newUser" property="*"></jsp:setProperty>

<%
    String[] hobbies = newUser.getUserhobby();
//    for(int i=0; i < hobbies.length; i++) {
//        System.out.println(hobbies[i]);
//    }


%>