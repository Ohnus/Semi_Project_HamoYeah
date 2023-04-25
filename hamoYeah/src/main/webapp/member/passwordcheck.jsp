<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<h3>My page</h3>
	<table border="1">
		<tr>
			<td>비밀번호</td>
			<td>
				<form action="" method="post" id="f">
					<input type="password" name="pwd" id="pwdip">
					<input type="submit" value="확인" onclick="check();">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>