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
<c:if test="${empty listOn0 && empty listOn1 && empty listOn2}">
<h5>참여 신청한 모임이 없습니다.</h5>
</c:if>

<c:if test="${not empty listOn0 || not empty listOn1 || not empty listOn2}">
<h4>진행중인 모임</h4>
<div class="on">
<div class="on0">
<h5>미승인</h5>
<c:forEach var="vo" items="${listOn0}">
<c:if test="${vo.y_card eq 3}"> <!-- eq: == -->
	<table border="1" style="border-color:red;">
		<tr><td>신고된 게시글입니다.</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
	</table>
</c:if>
<c:if test="${vo.y_card ne 3}"> <!-- ne: != -->
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
			<td>${vo.tag}  <span></span></td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
</c:if>
</c:forEach>
</div>
<div class="on1">
<h5>승인</h5>
<c:forEach var="vo" items="${listOn1}">
<c:if test="${vo.y_card eq 3}"> <!-- eq: == -->
	<table border="1" style="border-color:red;">
		<tr><td>신고된 게시글입니다.</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
	</table>
</c:if>
<c:if test="${vo.y_card ne 3}"> <!-- ne: != -->
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
			<td>${vo.tag}  <span></span></td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
</c:if>
</c:forEach>
</div>
<div class="on2">
<h5>거절</h5>
<c:forEach var="vo" items="${listOn2}">
<c:if test="${vo.y_card eq 3}"> <!-- eq: == -->
	<table border="1" style="border-color:red;">
		<tr><td>신고된 게시글입니다.</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
	</table>
</c:if>
<c:if test="${vo.y_card ne 3}"> <!-- ne: != -->
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
			<td>${vo.tag}  <span></span></td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
</c:if>
</c:forEach>
</div>
</div>
</c:if>

<c:if test="${empty listOff}">
</c:if>
<c:if test="${not empty listOff}">
<h4>완료된 모임</h4>
<c:forEach var="vo" items="${listOff}">
<c:if test="${vo.y_card eq 3}"> <!-- eq: == -->
	<table border="1" style="border-color:red;">
		<tr><td>신고된 게시글입니다.</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
	</table>
</c:if>
<c:if test="${vo.y_card ne 3}"> <!-- ne: != -->
	<table border="1">
		<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td><td>${vo.tag}</td></tr>
		<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
		<tr><td>${vo.place}/${vo.dDay}</td></tr>
		<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
	</table>
	<c:if test="${vo.already eq 0 }">
	<input type="button" value="후기 작성하기" onclick="location.href='${pageContext.request.contextPath}/review/add.do?boardNum=${vo.boardNum}'">
	<input type="button" value="후기 보러가기" onclick="location.href='${pageContext.request.contextPath}/review/search.do?boardNum=${vo.boardNum}'">
	</c:if>
	<c:if test="${vo.already eq 1 }">
	<input type="button" value="후기 보러가기" onclick="location.href='${pageContext.request.contextPath}/review/search.do?boardNum=${vo.boardNum}'">
	</c:if>
</c:if>
</c:forEach>
</c:if>
</body>
</html>