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
<c:if test="${empty listOn && empty listOff}">
<h5>주최한 모임이 없습니다.</h5>
</c:if>

<c:if test="${not empty listOn || not empty listOff}">
<h4>진행중인 모임</h4>
<c:forEach var="vo" items="${listOn}">
<c:if test="${vo.y_card eq 3}"> <!-- eq: == -->
	<table border="1" style="border-color:red;">
		<tr><td>신고된 게시글입니다.</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">${vo.title }</a></td></tr> <!-- 디테일 링크 걸기 -->
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
	</table>
</c:if>
<c:if test="${vo.y_card ne 3}"> <!-- ne: != -->
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td><td>${vo.tag}</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
	<input type="button" value="승인하기" onclick="location.href='${pageContext.request.contextPath}/member/okList.do?boardNum=${vo.boardNum}'">
</c:if>
</c:forEach>

<h4>완료된 모임</h4>
<c:forEach var="vo" items="${listOff}">
<c:if test="${vo.y_card eq 3}">  <!-- eq: == -->
	<table border="1" style="border-color:red;">
		<tr><td>신고된 게시글입니다.</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">${vo.title }</a></td></tr> <!-- 디테일 링크 걸기 -->
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
	</table>
</c:if>
<c:if test="${vo.y_card ne 3}"> <!-- ne: != -->
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td><td>${vo.tag}</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
	<input type="button" value="후기 보러가기" onclick="location.href='${pageContext.request.contextPath}/review/search.do?boardNum=${vo.boardNum}'">
</c:if>
</c:forEach>
</c:if>
</body>
</html>