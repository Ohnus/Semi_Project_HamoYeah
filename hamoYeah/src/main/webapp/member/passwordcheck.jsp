<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login.css">
<script type="text/javascript">
	function check() {
		let inputpwd = document.getElementById("pwdip").value;
		let f = document.getElementById("f");
		if ("${vo.pwd}" != inputpwd) {
			alert("입력하신 비밀번호가 틀렸습니다.");
			event.preventDefault(); // 이벤트 default 동작 중지시키는 method(유효성 검사나, 페이지 재로드 예방에 좋음)
			document.getElementById("pwdip").value = "";
			return;
		} else {
			f.action = "${pageContext.request.contextPath }/member/mypage.do?memberId=${sessionScope.loginId}";
			f.submit();
		}
	}
</script>
</head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
	font-size: 13px;
}
</style>
<body>
<div class="login-box">
	<form action="" method="post" id="f">
	<div class="user-box">
	<input type="password" name="pwd" id="pwdip" required>
	<label>Password</label>
	</div>
	
	  <a href="#">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        
	<button class="button1" onclick="check();">확인</button>
	<button class="button2" style="float: right;" ><a href="${pageContext.request.contextPath}/board/boardAllList.do?memberId=${sessionScope.loginId}">취소</a></button>
	</form>
</div>
</body>
</html>