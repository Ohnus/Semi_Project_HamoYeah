<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h3, h4 {
	 text-align: center;
}

</style>
</head>
<body>
<h3>내가 주최한 모임</h3>
<h4>진행중인 모임</h4>
<c:forEach var="vo" items="${listOn}">
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td><td>${vo.tag}</td></tr>
		<tr><td>${vo.title }</td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
	<input type="button" value="승인하기" onclick="location.href='${pageContext.request.contextPath}/member/okList.do?boardNum=${vo.boardNum}'">
</c:forEach>

<h4>완료된 모임</h4>
<c:forEach var="vo" items="${listOff}">
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td><td>${vo.tag}</td></tr>
		<tr><td>${vo.title }</td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
	<input type="button" value="후기 보러가기" onclick="location.href='${pageContext.request.contextPath}/review/searchByBoard.do?boardNum=${vo.boardNum}'">
</c:forEach>

</body>
</html>