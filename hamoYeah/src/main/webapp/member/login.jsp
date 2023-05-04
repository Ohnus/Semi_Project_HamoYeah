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
      
      <a href="#">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        <span></span>

        <button class="button1" onclick="loginbtn()">Login</button>
        <button class="button2" style="float: right;" ><a href="../member/join.do">join</a></button>


    </form>
  </div>
</body>
</html>