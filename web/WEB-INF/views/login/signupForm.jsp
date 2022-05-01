<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<style>
    .container {
        width: 500px;
        margin: 40px auto;
        line-height: 16px;
    }
    h5 {
        text-align: center;
    }
    h5 span {
        color: teal;
    }

    input {
        border: 1px solid lightgray;
        border-radius: 3px;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <script type="text/javascript">

        // window.onload = function() {
        //     var id = document.getElementById("memberId");
        //
        // }
        //
        // // 회원가입 입력값 유효성 검사
        // function allCheck() {
        //     return (idCheck() && pwCheck() && checkMail() && nameCheck() && checkAddr());
        // }
        //
        // var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
        // var re2 = /^[0-9a-zA-Z]{1,}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; // 이메일 조건 정규 표현식
        //
        // // 아이디
        // function idCheck() {
        //     var id = document.getElementById("memberId");
        //     var name = document.getElementById("memberName");
        //     // ^ 이 규칙으로 문장을 시작한다.
        //     // [문자 규칙을 입력]
        //     // {} = [] 안에 포함되는 문자가 최소 4개부터 12개까지
        //     if(name.value == "") {
        //         name.focus();
        //         return false;
        //     } else if (id.value == "") {
        //         window.alert("ID를 입력하세요");
        //         id.focus();
        //         id.value = "";
        //         return false;
        //     } else if (!re.test(id.value)) {
        //         window.alert("아이디는 4~12자와 영어 숫자로만 입력");
        //         id.focus();
        //         id.value = "";
        //         return false;
        //     } else return true;
        // }
        //
        // // 주소 유효성 판별 체크 (상세주소)
        // function checkAddr() {
        //     var sangaddr = document.getElementById("tbox3").value;
        //     var numaddr = document.getElementById("tbox1").value;
        //     if (numaddr == "") {
        //         alert("주소를 입력해 주세요.");
        //         document.getElementById("tbox1").focus;
        //         return false;
        //     }
        //     if (sangaddr == "") { //상세주소 없으면 안받아줌
        //         alert("상세주소를 입력해 주세요.");
        //         document.getElementById("tbox3").focus();
        //         return false;
        //     } else return true;
        // }
        //
        // // 비밀번호체크
        // function pwCheck() {
        //     var pw1 = document.getElementById("memberPwd");
        //
        //     // 아이디랑 비번이랑 같을 경우
        //     if (pw1.value == document.getElementById("memberId").value) {
        //         alert("아이디랑 비밀번호가 같으면 안됩니다.")
        //         pw1.focus;
        //         pw1.value = "";
        //         return false;
        //     }
        //         // 비번 길이와 영어소대문자 입력값이 올바른지
        //     // 정규표현식을 true false로 반환할거면 test
        //     else if (!re.test(pw1.value)) {
        //         alert("비밀번호는 4~12자 또는 영문 대소문자만 입력하세요.");
        //         pw1.focus;
        //         pw1.value = "";
        //         return false;
        //     } else return true;
        // }
        //
        // // 메일주소
        // function checkMail() {
        //     var mail = document.getElementById("memberEmail");
        //     if (mail.value == "") {
        //         alert("이메일 내용을 입력해주세요.");
        //         mail.focus;
        //         mail.value = "";
        //         return false;
        //     } else if (!re2.test(mail.value)) {
        //         alert("이메일 형식을 확인바랍니다.");
        //         mail.focus;
        //         mail.value = "";
        //         return false;
        //     } else return true;
        // }
        //
        // //이름
        // function nameCheck() {
        //     var name = document.getElementById("memberName");
        //     var reKor = /^[가-힣]{1,}$/;
        //     if (name.value == null) {
        //         alert("이름을 입력해주세요");
        //         name.focus;
        //         name.value = "";
        //         return false;
        //     }
        //         // else if(!reKor.test(name.value)){
        //         //     alert("한글을 입력해 주세요.")
        //         //     name.focus;
        //         //     name.value = "";
        //         //     return false;
        //     // }
        //     else return true;
        // }
        //
        // // 주소팝업
        // function addrFind() {
        //     new daum.Postcode({
        //         oncomplete: function (data) {
        //             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        //             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        //             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        //             var addr = ''; // 주소 변수
        //             var extraAddr = ''; // 참고항목 변수
        //
        //             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        //             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
        //                 addr = data.roadAddress;
        //             } else { // 사용자가 지번 주소를 선택했을 경우(J)
        //                 addr = data.jibunAddress;
        //             }
        //             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        //             if (data.userSelectedType === 'R') {
        //                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        //                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        //                 if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        //                     extraAddr += data.bname;
        //                 }
        //                 // 건물명이 있고, 공동주택일 경우 추가한다.
        //                 if (data.buildingName !== '' && data.apartment === 'Y') {
        //                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        //                 }
        //                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        //                 if (extraAddr !== '') {
        //                     extraAddr = ' (' + extraAddr + ')';
        //                 }
        //                 // 조합된 참고항목을 해당 필드에 넣는다.
        //                 document.getElementById("tbox4").value = extraAddr;
        //             } else {
        //                 document.getElementById("tbox4").value = '';
        //             }
        //             // 우편번호와 주소 정보를 해당 필드에 넣는다.
        //             document.getElementById('tbox1').value = data.zonecode;
        //             document.getElementById("tbox2").value = addr;
        //             // 커서를 상세주소 필드로 이동한다.
        //             document.getElementById("tbox3").focus();
        //         }
        //     }).open();
        // }

        $(document).on('click', '#btnSignup', function(e){
            e.preventDefault();
            $("#form").submit();
        });

        $(document).on('click', '#btnCancel', function(e){
            e.preventDefault();
            $('#memberId').val('');
            $('#memberName').val('');
            $('#memberPwd').val('');
            $('#memberEmail').val('');
            location.href="${pageContext.request.contextPath}/login/login";
        });

    </script>
</head>
<body>
<div class="container">
    <div>
        <h1>회원가입</h1>
    </div>
<%--    <form action="join.do" method="post" onsubmit="return allCheck()" >--%>
<%--        <ul>--%>
<%--            <li><label>이름:</label><input type="text" placeholder="이름" name="memberName" id="memberName" required autocomplete="off"></li>--%>
<%--            <li><label>아이디:</label><input type="text" placeholder="아이디" name="memberId" id="memberId" required autocomplete="off"></li>--%>
<%--            <li><label>비밀번호:</label><input type="password" placeholder="비밀번호" name="memberPwd" id="memberPwd" required autocomplete="off"></li>--%>
<%--            <li><label>이메일:</label><input type="email" placeholder="이메일" name="memberEmail" id="memberEmail" required autocomplete="off"></li>--%>
<%--            <li><label>성별:</label>--%>
<%--                <input type="radio" name="memberGender" value="남" checked>남자--%>
<%--                <input type="radio" name="memberGender" value="여">여자--%>
<%--            </li>--%>
<%--            <li><label>나이:</label><input type="number" value="0" placeholder="나이" name="memberAge" id="memberAge" autocomplete="off"></li>--%>
<%--            <li><label>전화번호</label><input type="number" value="01000000000" name="memberPhone" placeholder="-없이 입력바람" autocomplete="off"></li>--%>
<%--            <li><label>우편번호:</label>--%>
<%--                <input type="text" id="tbox1" name="memberAddress1" placeholder="우편번호" size=8 autocomplete="off">--%>
<%--                <input type="button" onclick="addrFind()" value="우편번호 찾기"><br>--%>
<%--                <input type="text" id="tbox2" name="memberAddress" placeholder="주소" size=28 autocomplete="off"><br>--%>
<%--                <input type="text" id="tbox4" name="memberAddress2" placeholder="참고항목" size=28 autocomplete="off">--%>
<%--                <input type="text" id="tbox3" name="memberAddress3" placeholder="상세주소" autocomplete="off">--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--        <p><input type="submit" value="가입하기" id="signUp" /></p>--%>
<%--    </form>--%>
<%--    <a href="login.do"><button>로그인 화면</button></a>--%>
    <form:form name="form" id="form" role="form" modelAttribute="userVo" method="post" action="${pageContext.request.contextPath}/user/insertUser">
        <label>아이디:</label><form:input path="memberId" id="memberId" placeholder="아이디 입력" />
        <label>이름:</label><form:input path="memberName" id="memberName" placeholder="이름 입력" />
        <label>비밀번호:</label><form:input path="memberPwd" id="memberPwd" placeholder="비밀번호 입력" />
        <label>이메일:</label><form:input path="memberEmail" id="memberEmail" placeholder="아메일 입력" />
    </form:form>
    <button type="button" id="btnSignup">회원가입</button>
    <button type="button" id="btnCancel">취소</button>

</div>

</body>
</html>
