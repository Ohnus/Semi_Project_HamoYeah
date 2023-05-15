<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/login.css">
<!-- 구글 로그인 연동 구현 test.. 05.15.23 -->
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<!-- <script src="https://accounts.google.com/gsi/client" async defer></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script> -->
<script>
//     function handleCredentialResponse(response) {
// 		const responsePayload = parseJwt(response.credential);
// 		console.log("ID: " + responsePayload.sub);
// 		console.log('Full Name: ' + responsePayload.name);
// 		console.log("Image URL: " + responsePayload.picture);
// 		console.log("Email: " + responsePayload.email);
// 	$(document).ready(function() {
// 		alert(responsePayload.sub);
// 		$.ajax({
// 			url: '${pageContext.request.contextPath}/member/idcheck.do',
// 			type: 'get',
// 			data:{'memberId':responsePayload.sub},
// 			dataType:'json',
// 			success: function(result){
// 				if(result.flag){
// 					window.location.href = '${pageContext.request.contextPath}/member/join.do';
// 				} else {
// 					window.location.href = '${pageContext.request.contextPath }/index.jsp';
// 				}
// 			},
// 			error: function(req, status){
// 				alert(status);
// 			}
// 		});
// 	});	
//     }
//     function parseJwt(token) {
// 		var base64Url = token.split('.')[1];
// 		var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
// 		var jsonPayload = decodeURIComponent(atob(base64).split('').map(
// 				function(c) {
// 					return '%'
// 							+ ('00' + c.charCodeAt(0).toString(16)).slice(-2);
// 				}).join(''));

// 		return JSON.parse(jsonPayload);
// 	};
//     window.onload = function () {
//       google.accounts.id.initialize({
//         client_id: "119774536539-updnbhj9h7er7elhcqisnhclscrt32v4.apps.googleusercontent.com",
//         callback: handleCredentialResponse
//       });
//       google.accounts.id.renderButton(
//         document.getElementById("buttonDiv"),
//         { theme: "outline", size: "large" }  // customization attributes
//       );
//       google.accounts.id.prompt(); // also display the One Tap dialog
//     }
</script>
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
			location.href = "${pageContext.request.contextPath}/member/login.do";
		} else if(obj.flag == 1) {
			alert("일치하는 회원정보가 없습니다. 아이디, 비밀번호를 다시 확인해주세요.");
			location.href = "${pageContext.request.contextPath}/member/login.do";
		} else if(obj.flag == 2){
			location.href = "${pageContext.request.contextPath}/admin/manage.do";
		} else if(obj.flag == 3){
			location.href = "${pageContext.request.contextPath}/board/boardAllList.do?memberId="+f.memberId.value;
		}
	}
}
</script>
</head>
<body>
<div class="login-box">
    <h2>Login</h2>
    <form action="" method="post" id="f">
      <div class="user-box">
       <input type="text" name="memberId" id="memberId" required>
        <label>Username</label>
      </div>
      <div class="user-box">
        <input type="password" name="pwd" required>
        <label>Password</label>
      </div>
      
      <a href="">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>

        <button class="button1" onclick="loginbtn()">Login</button>
        <button class="button2" style="float: right;" ><a href="../member/join.do">join</a></button>
<!--         <div id="buttonDiv"></div>  -->


    </form>
  </div>
</body>
</html>