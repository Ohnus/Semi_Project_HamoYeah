<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function pro(num){
	const xhttp = new XMLHttpRequest();
	let param = "proNum=" + num;
	param += "&boardNum=" + f.boardNum.value;
	alert(param);
	xhttp.open("POST", "${pageContext.request.contextPath}/admin/process.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);

	xhttp.onload = function() {
		let val = xhttp.responseText;
		let obj = JSON.parse(val);
		if (obj.proNum == 1) {
			document.getElementById("btn1").style.display = "none";
			document.getElementById("btn2").style.display = "none";
			let div = document.getElementById("d2");
			div.innerHTML = "복구가 완료되었습니다.";
		} else if(obj.proNum == 2) {
			document.getElementsById("btn1").style.display = "none";
			document.getElementById("btn2").style.display = "none";
			let div = document.getElementById("d2");
			div.innerHTML = "정지가 완료되었습니다.";
		}
	}
}

</script>
</head>
<body>
<h3>신고 처리 페이지</h3>
<form action="" method="post" name="f">
<div id="d1">
<table border="1">
<tr><td rowspan="6">신고 글 정보</td><td>글번호</td><td>${bvo.boardNum }111</td></tr>
<tr><td>작성자</td>
<td>
${bvo.memberId }111
<input type="hidden" name="boardNum" value="${bvo.boardNum }">
</td>
</tr>
<tr><td>글 제목</td><td>${bvo.title }111</td></tr>
<tr><td>글 내용</td><td>${bvo.content }111</td></tr>
<tr><td>모임장소</td><td>${bvo.place }111</td></tr>
<tr><td>모임시간</td><td>${bvo.dDay }111</td></tr>
<c:forEach var="wvo" items="${list }">
<tr><td>신고 정보</td><td colspan="2">신고자 아이디: ${wvo.memberId }<br/>신고 내용: ${wvo.content }</td></tr>
</c:forEach>
</table>
</div>
<div id="d2">
<input type="button" id="btn1" value="복구" onclick="pro(1)">
<input type="button" id="btn2" value="정지" onclick="pro(2)">
</div>
</form>
</body>
</html>