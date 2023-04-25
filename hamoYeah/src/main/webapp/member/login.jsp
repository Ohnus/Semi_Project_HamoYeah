<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// function login(){
// 	const xhttp = new XMLHttpRequest();
// 	let param = "?memberId=" + f.memberId.value;
// 	param += "&pwd=" + f.pwd.value;
// 	xhttp.open("POST", "${pageContext.request.contextPath}/member/idcheck.do");
// 	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
// 	xhttp.send(param);

// 	xhttp.onload = function() {
// 		let val = xhttp.responseText;
// 		let html = '<h5 style="color:';
// 		let obj = JSON.parse(val);
// 		if (obj.flag) { // obj.flag(key) = true or false
// 			html += 'blue">사용가능한 아이디입니다.</h5>';
// 		} else {
// 			html += 'red">사용 불가능한 아이디입니다.</h5>';
// 		}
// 		let res = document.getElementById("res");
// 		res.innerHTML = html;
// 	}
// }
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/login.do" method="post" id="f">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="로그인">
				<a href="${pageContext.request.contextPath }/member/join.do">회원가입</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>