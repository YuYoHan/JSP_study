<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-10-22
  Time: 오전 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <style>
        body {
            background-color: rgb(245, 246,247);
        }
        input {
            box-sizing: border-box;
            cursor: pointer;
        }
        table {
            border-collapse: collapse;
        }
        th {
            text-align: left;
        }
        th::after {
            content: "";
            display: inline-block;
            box-sizing: border-box;
            width: 1px;
            height: 14px;
        }

        th,td {
            padding: 5px;
        }
        td {
            padding-left: 20px;
            width: 400px;
        }
        input[type=text], input[type=password]{
            padding:10px 15px 10px 10px;
            border:1px solid #ccc;
            width:250px;
        }
        input:focus{
            outline:none;
            border:1px solid rgb(0,200,80);
        }

        td > input[type=text]+input[type=button]{
            margin-left:10px;
            padding:8px 10px;
            background-color:rgb(0,200,80);
            color:#fff;
            font-size:14px;
            font-weight:bold;
            border:none;
            border-radius:5px;
            width:80px;
        }
        .gender_area > td{
            font-size:16px;
        }
        .zipcode_area > td > input[type=text]{
            width:200px;
        }
        .zipcode_area > td > input[type=button]{
            width:130px !important;
        }
        .addr_area > td > input[type=text], .addr_area+tr > td > input[type=text], .addr_area+tr+tr > td > input[type=text]{
            width:340px;
        }
        .hobby_area > td > div{
            display: flex;
            width:360px;
            flex-wrap: wrap;
        }
        .hobby_area > td > div > div{
            padding:10px;
            flex:1 1 40%;
        }
        .hobby_area > td > div > div:nth-child(2n){
            border-left:1px solid #ccc;
        }
        input[type=submit]{
            margin:0 auto;
            padding:10px 10px;
            margin-left:40px;
            background-color:rgb(0,200,80);
            color:#fff;
            font-size:20px;
            font-weight:bold;
            border:none;
            border-radius:5px;
            width:400px;
        }
    </style>
</head>
<body>
<form name="joinForm" method="post" action="join_db.jsp">
    <table>
        <tr>
            <td id="result" colspan="2"></td>
        </tr>
        <tr>
            <th><label for="userId">아이디</label> </th>
            <td>
                <input type="text" name="userId" id="userId">
                <input type="button" value="중복검사" onclick="checkId()">
            </td>
        </tr>
        <tr>
            <th><label for="userPw"></label></th>
            <td>
                <input type="password" name="userPw" id="userPw">
            </td>
        </tr>
        <tr>
            <th><label for="userPw_check"></label> </th>
            <td><input type="password" name="userPw_check" id="userPw_check"></td>
        </tr>
        <tr>
            <th><label for="userName">이름</label> </th>
            <td>
                <input type="text" name="userName" id="userName">
            </td>
        </tr>
        <tr class="gender_area">
            <th>성별</th>
            <td>
                <label>남자 <input type="radio" name="userGender" value="M"></label>
                <label>여자 <input type="radio" name="userGender" value="W"></label>
            </td>
        </tr>
        <tr class="zipcode_area">
            <th>우편번호</th>
            <td>
                <input readonly name="zipcode" type="text" id="simple6_postcode" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
            </td>
        </tr>
        <tr class="addr_area">
            <th>주소</th>
            <td>
                <input readonly name="addr" type="text" id="sample6_address" placeholder="주소">
            </td>
        </tr>
        <tr>
            <th>상세주소</th>
            <td>
                <input name="addrdetail" type="text" id="sample6_detailAddress" placeholder="상세주소">
            </td>
        </tr>
        <tr>
            <th>참고항목</th>
            <!-- readonly는 수정이 안되게 막는 것이다. -->
            <td><input readonly name="addretc" type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
        </tr>
        <tr class="hobby_area">
            <th>취미</th>
            <td>
                <div>
                    <div>
                        <label><input type="checkbox" name="userhobby" value="게임"> 게임하기</label>
                    </div>
                    <div>
                        <label><input type="checkbox" name="userhobby" value="그림"> 그림그리기</label>
                    </div>
                    <div>
                        <label><input type="checkbox" name="userhobby" value="영화"> 영화보기</label><br>
                    </div>
                    <div>
                        <label><input type="checkbox" name="userhobby" value="운동"> 운동하기</label>
                    </div>
                    <div>
                        <label><input type="checkbox" name="userhobby" value="노래"> 노래부르기</label>
                    </div>
                    <div>
                        <label><input type="checkbox" name="userhobby" value="코딩"> 코딩하기</label>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th colspan="2">
                <input type="submit" value="가입 완료">
            </th>
        </tr>
    </table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

    function checkId() {
        const userid = document.joinForm.userId;
        if(userid.value.length < 5 || userid.value.length > 12) {
            alert("아이디는 5자 이상 12자 이하로 작성해주세요");
            userid.focus();
            return false;
        }
        const result = document.getElementById("result");
        const xhr = new XMLHttpRequest();

        xhr.open("GET", "checkId_db.jsp?userid="+userid.value, true);
        xhr.onreadystatechange = function () {
            if(xhr.readyState == 4) {
                if(xhr.status == 200) {
                    let txt = xhr.responseText;
                    txt = txt.trim();

                    if(txt == "O") {
                        result.innerHTML ="사용할 수 있는 아이디입니다."
                    } else {
                        result.innerHTML = "이미 존재하는 아이디입니다."
                    }
                }
            }
        }
        xhr.send();
    }
</script>
</body>
</html>
