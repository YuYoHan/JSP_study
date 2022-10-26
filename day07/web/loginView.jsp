<%@page import="com.koreait.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<style>
    body{
        background-color:rgb(245,246,247);
    }
    #wrap{
        width:600px;
        margin:0 auto;
    }
    #wrap > tr, #wrap > td{
        padding:10px;
    }
    #wrap > tr{
        width:200px;
    }
    #wrap > td{
        width:350px;
    }
    input[type=text], input[type=password]{
        padding:10px;
        width:200px;
        margin-left:20px;
        border:1px solid #ccc;
        outline:none;
    }
    input[type=submit]{
        margin-top:30px;
        padding:10px 20px;
        width:100px;
        border:none;
        background-color:rgb(0,200,80);
        border-radius:5px;
        color:#fff;
        font-weight:bold;
        font-size:18px;
    }
</style>
<body>
<%
    // session		 : 세션(session)은 웹 서버 쪽의 웹 컨테이너에 상태를 유지하기 위한 정보를 저장한다.
    // .getAttribute : 선택한 요소(element)의 특정 속성의 값을 가져옵니다.
    UserDTO joinUser = (UserDTO)session.getAttribute("joinUser");
    String userid = null;
    if(joinUser != null){
        userid = joinUser.getUserid();
        session.removeAttribute("joinUser");
    }
    String check = request.getParameter("l");
    if(check != null && check.equals("f")){
%>
<script>alert("로그인 실패!");</script>
<%
    }
%>
<div id="wrap">
    <form name="loginForm" action="login_db.jsp" method="post" onsubmit="return sendit();">
        <table>
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="userid" placeholder="아이디를 입력하세요" value="<%=userid==null?"":userid%>">
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" name="userpw" placeholder="비밀번호를 입력하세요">
                </td>
            </tr>
            <tr>
                <th colspan="2"><input type="submit" value="로그인"></th>
            </tr>
        </table>
    </form>
</div>
</body>
<script src="./js/user.js"></script>
</html>