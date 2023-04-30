<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function loginbtn(){
	const xhttp = new XMLHttpRequest();
	
	let param = "memberId=" + f.memberId.value;
	param += "&pwd=" + f.pwd.value;
	xhttp.open("POST", "${pageContext.request.contextPath}/member/login.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);

	xhttp.onload = function() {
		let val = xhttp.responseText;
		let obj = JSON.parse(val);
		if (obj.flag == 0) {
			alert("일치하는 회원정보가 없습니다. 아이디, 비밀번호를 다시 확인해주세요.");
			event.preventDefault();
		} else if(obj.flag == 1) {
			alert("일치하는 회원정보가 없습니다. 아이디, 비밀번호를 다시 확인해주세요.");
			event.preventDefault();
		} else if(obj.flag == 2){
			location.href = "${pageContext.request.contextPath}/admin/manage.do";
		} else if(obj.flag == 3){
			// 여기서 ${sessionScope.loginId} 가 안담기는 거 같음.. ㅎ..
			location.href = "${pageContext.request.contextPath}/board/boardAllList.do?memberId="+f.memberId.value;
		}
	}
// 			if("${sessionScope.loginId}" == "master"){
// 				location.href = "${pageContext.request.contextPath}/admin/manage.do";
// 			} else {
// 				location.href = "${pageContext.request.contextPath}/main.jsp";
// 			}
// 		}
}
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/login.do" method="post" id="f">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memberId" id="memberId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="button" value="로그인" onclick="loginbtn()">
				<a href="${pageContext.request.contextPath }/member/join.do">회원가입</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>