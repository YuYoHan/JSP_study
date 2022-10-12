<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>formInput</title>
</head>
<body>
    <form name="joinForm" action="join_db.jsp" method="post" onsubmit="sendit();">
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
            const id = /^[a-zA-Z0-9]+$/
            // 최소 8자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수문자
            const password = "^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"
            // 한글만
            const  kor = /^[가-힣]+$/;

            // joinForm안에 있는 userid이라는 name
            const userid = joinForm.userId;
            const userpw = joinForm.userPw;
            const username = joinForm.userName;

            if(userid.value === "") {
                alert("아이디를 입력하세요!");
                userid.focus();
                return false;
            }
            if(userid.value.length < 5 || userid.value.length > 12) {
                alert("아이디는 5자 이상 12자 이하로 작성해주세요!");
                userid.focus();
                return false;
            }
            if(userpw.value === "") {
                alert("비밀번호를 입력하세요");
                userpw.focus();
                return false;
            }
            if(userpw.value.length < 8 || userpw.value.length > 16) {
                alert("비밀빈호는 8이상 16이하로 작성해주세요!");
                return false;
            }
            if(username.value === "") {
                alert("이름을 입력하세요");
                if(username.value.length <2 || username.value.length >4) {
                    alert("이름은 2글자이상 4글자 이하로 작성해주세요");
                    return  false;
                }
            }
            if(userid.value === id && userpw.value === password && username === kor) {
                alert("양식에 맞게 입력했습니다.");
                return true;
            }
        }

    </script>
</body>
</html>
