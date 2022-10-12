<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-12
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>formInput</title>
</head>
<body>
    <form name="joinForm" action="#" method="post" onsubmit="sendit();">
        <fieldset>
            <legend>회원가입</legend>
            <input type="text" placeholder="아이디" name="userId" id="userId"> <br/>
            <input type="password" placeholder="비밀번호" name="userPw" id="userPw"> <br />
            <input type="text" placeholder="이름을 입력하세요" name="userName" id="userName"> <br/>
            <input type="submit" value="가입하기" >
        </fieldset>
    </form>
    <script>
        // name으로 받아오는 것이다.
        const joinForm = document.joinForm;


        function sendit() {
            // 영어와 숫자
            const email = /^[a-zA-Z0-9]+$/
            // 최소 8자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수문자
            const password = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
            // 한글만
            const  kor = /^[가-힣]+$/;

            // joinForm안에 있는 userid이라는 name
            const userid = joinForm.userId;
            const userpw = joinForm.userPw;
            const username = joinForm.userName;

            if(userid.value === email) {
                console.log("아이디 통과");
                if (userpw.value === password) {
                    console.log("비밀번호 통과");
                    if (username.value === username) {
                        console.log("이름 통과");
                    } else {
                        alert("이름 실패")
                    }
                } else {
                    alert("비밀번호 실패")
                }
            } else {
                alert("가입실패")
            }
        }

    </script>
</body>
</html>
