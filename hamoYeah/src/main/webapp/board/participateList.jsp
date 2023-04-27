<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.on {
	display: flex;
}
div.on0 {
	flex: 1;
}
div.on1 {
	flex: 1;
}
div.on2 {
	flex: 1;
}
h3, h4, h5 {
	 text-align: center;
}
</style>

</head>
<body>
<h3>내가 참여한 모임</h3>
<h4>진행중인 모임</h4>
<div class="on">
<div class="on0">
<h5>미승인</h5>
<c:forEach var="vo" items="${listOn0}">
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
			<td>${vo.tag}  <span></span></td></tr>
		<tr><td>${vo.title }</td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
</c:forEach>
</div>
<div class="on1">
<h5>승인</h5>
<c:forEach var="vo" items="${listOn1}">
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
			<td>${vo.tag}  <span></span></td></tr>
		<tr><td>${vo.title }</td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
</c:forEach>
</div>
<div class="on2">
<h5>거절</h5>
<c:forEach var="vo" items="${listOn2}">
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
			<td>${vo.tag}  <span></span></td></tr>
		<tr><td>${vo.title }</td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
</c:forEach>
</div>
</div>


<h4>완료된 모임</h4>
<c:forEach var="vo" items="${listOff}">
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td><td>${vo.tag}</td></tr>
		<tr><td>${vo.title }</td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
	<input type="button" value="후기 작성하기" onclick="location.href='${pageContext.request.contextPath}/review/writeReview.do?boardNum=${vo.boardNum}'">
	<input type="button" value="후기 보러가기" onclick="location.href='${pageContext.request.contextPath}/review/searchByBoard.do?boardNum=${vo.boardNum}'">
</c:forEach>

</body>
</html>