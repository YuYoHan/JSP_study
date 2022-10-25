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
    if(userid.value.length<5 || userid.value.length>12) {
        alert("아이디는 5자 이상 12자 이하로 입력해주세요!");
        userid.focus();
        return false;
    }
    const result = document.getElementById("result");
    const xhr = new XMLHttpRequest();

    xhr.open("GET","checkId_db.jsp?userid="+userid.value,true);
    // 서버에서 응답이 도착하면 특정한 자바스크립트 함수를 호출
    xhr.onreadystatechange = function() {
        // readyState == 4란 의미는 데이터를 전부 받은 상태, 완료된 상태를 의미한다.
        if(xhr.readyState == 4) {
            // status == 200은 서버로 부터 응답상태가 요청에 성공하였다는 의미다.
            if(xhr.status == 200) {
                // 문자열로 응답 데이터를 얻음
                let txt = xhr.responseText;
                txt = txt.trim();

                if(txt == "O") {
                    result.innerHTML = "사용할 수 있는 아이디입니다!";
                } else {
                    result.innerHTML = "이미 존재하는 아이디입니다!";
                }
            }
        }
    }
    xhr.send();
}

// 회원가입 유효성 검사
function join() {
    const joinForm = document.joinForm;
    const result = document.getElementById("result");

    const userid = joinForm.userid;
    if(userid.value == ""){
        alert("아이디를 입력하세요!");
        userid.focus();
        //userid.style.borderColor = "red";
        return false;
    }
    if(userid.value.length < 5 || userid.value.length > 12){
        alert("아이디는 5자 이상 12자 이하로 작성해주세요!");
        userid.focus();
        return false;
    }
    //userid.style.borderColor = "black";
    if(result.innerHTML == ""){
        alert("아이디 중복검사를 해주세요!")
        return false;
    }
    if(result.innerHTML != "사용할 수 있는 아이디입니다!"){
        alert("아이디가 중복되었습니다!");
        userid.focus();
        return false;
    }
    const userpw = joinForm.userpw;
    const userpw_re = joinForm.userpw_re;
    if(userpw.value == ""){
        alert("비밀번호를 입력하세요!");
        userpw.focus();
        return false;
    }
    // 정규식 - https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions
    // /^(?=.*?)/ : 맨 뒤 ? 뒤에 문자를 쓰면 그 문자가 있는지 확인하는 정규식
    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/
    if(!reg.test(userpw.value)) {
        alert("비밀번호는 8자 이상, 숫자, 대문자, 소문자, 특수문자를 모두 포함해야 합니다!");
        userpw.focus();
        return false;
    }
    // ↓의미 \w : 어떤문자가 있고 \1\1\1 : 그 문자가 연속으로 3번 반복되는지
    // \w\1\1\1 : 어떤문자가 4번 연속으로 써지는지 확인
    if(/(\w\1\1\1/.test(userpw.value)) {
        alert("같은 문자를 4번 이상 연속해서 사용하실 수 없습니다!");
        userpw.focus();
        return false;
    }
    // 띄어쓰기가 포함되어 있는지 확인
    /*if(/\s/)*/
    // -1이면 띄어쓰기가 포함 x
    // -1이 아니면 띄어쓰기 포함
    if(userpw.value.search(" ") != -1) {
        alert("비밀번호는 공백을 포함할 수 없습니다!");
        userpw.focus();
        return false;
    }
    if(userpw_re.value == "") {
        alert("비밀번호를 확인을  해주세요!");
        userpw_re.focus();
        return false;
    }
    if(userpw.value != userpw_re.value ) {
        alert("비밀번호 확인을 다시 해주세요!");
        userpw.focus();
        return false;
    }

    const username = joinForm.username;
    if(username.value == ""){
        alert("이름을 입력하세요!");
        username.focus();
        return false;
    }
    const zipcode = joinForm.zipcode;
    if(zipcode.value == "") {
        alert("주소찾기를 진행해주세요!");
        sample6_execDaumPostcode();
        return false;
    }
    const addrdetail = joinForm.addrdetail;
    if(addrdetail.value =="") {
        alert("주소를 마저 입력해주세요!");
        addrdetail.focus();
        return false;
    }
    // userhobby를 찾으면 배열로 받아 올 수 있다.
    // for(let hobby of hobbies) : userhobby라고 되어 있는 name들을 전부 꺼내오면서 hobby에 넣어준다.
    const hobbies = joinForm.userhobby;
    let check = false;

    for(let hobby of hobbies) {
        // hobby.checked : 취미가 채크가 되어있는지 확인
        if(hobby.checked) {
            check = true;
            break;
        }
    }
    if(!check) {
        alert("취미를 하나 이상 선택하세요!");
        return false;
    }
    return true;
}



// 로그인 유효성 검사
function sendit() {
    const userid = document.loginForm.userid;
    const userpw = document.loginForm.userpw;

    if(userid.value=="") {
        alert("아이디를 입력하세요!")
        userid.focus();
        return false;
    }
    if(userpw.value=="") {
        alert("비밀번호를 입력하세요!")
        userpw.focus();
        return false;
    }
    return true;
}