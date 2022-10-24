<%@ page import="com.koreait.dto.UserDTO" %>
<%@ page import="com.koreait.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="newUser" class="com.koreait.dto.UserDTO"></jsp:useBean>

<jsp:setProperty name="newUser" property="*"></jsp:setProperty>

<%
    String[] hobbies = newUser.getUserhobby();
//    for(int i=0; i < hobbies.length; i++) {
//        System.out.println(hobbies[i]);
//    }
    UserDAO udao = new UserDAO();
    if(udao.join(newUser)) {
%>
    <script>
        alert("회원가입을 성공했습니다");
        location.href = "loginview.jsp"
    </script>
<%
    } else {
 %>
    <script>
        alert("잠시후에 시도하세요");
        location.href = "joinView.jsp"
    </script>
<%
}
%>
