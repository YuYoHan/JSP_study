<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>formInput</title>
</head>
<body>
    <form name="joinForm" action="join_db.jsp" method="post" onsubmit="return sendit();">
        <fieldset>
            <legend>회원가입</legend>
            <span id="result" style="color: red; font-weight: bold"></span><br/>
            <input type="text" placeholder="아이디" name="userId" id="userId"> <br/>
            <input type="button" value="중복체크" onclick="checkId();">
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
                return false;
            }
            if(username.value.length <2 || username.value.length >4) {
                alert("이름은 2글자이상 4글자 이하로 작성해주세요");
                return  false;
            }
            if(userid.value === id && userpw.value === password) {
                alert("양식에 맞게 입력했습니다.");
                return true;
            }
            // return true;
        }
        function checkId() {
            const userid = document.joinForm.userId;

            if(userid.value.length == 0) {
                result.innerHTML = "";
            } else {
                const xhr = new XMLHttpRequest();
                xhr.open("POST", "checkId_db.jsp", true);

                // xhr 객체가 상태가 변경이 되었으면 함수를 호출
                xhr.onreadystatechange = function () {
                    /*
                    *   통신이 완료되었으면 true
                    *   예를들면, 우편이 왔는데 우편함까지 오는 것은 성공한 것이다.
                    *   전달까지는 성공이지만 사람이 받았는지는 알 수 가 없다.
                    *   통신이 완료되어야만 if문 내부로 들어온다.
                    * */
                    if (xhr.readyState == XMLHttpRequest.DONE) {
                        /*
                        * 요청과 응답이 성공했다면 참
                        * xhr.status == 200은 성공을 뜻한다.
                        * */
                        if(xhr.status == 200) {
                            let txt = txt.trim();

                            if(txt == "O") {
                                result.innerHTML = "사용할 수 있는 아이디입니다."
                            } else {
                                result.innerHTML = "이미 존재하는 아이디입니다."
                            }
                        }
                        xhr.send("userid="+userid.value);
                    }
                }
            }
        }

    </script>
</body>
</html>
