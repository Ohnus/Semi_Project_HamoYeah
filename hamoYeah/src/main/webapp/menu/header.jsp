<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function showH(){
	let div = document.getElementById('history');
	div.style.display = '';
	hide('myInfo');
}
function showM(){
	let div = document.getElementById('myInfo');
	div.style.display = '';
	hide('history');
}
function hide(id){
	let div = document.getElementById(id);
	div.style.display = 'none';
}
function a(){
	hide('history');
	hide('myInfo');
}

</script>
</head>
<body>
<h3>하모예~</h3>
	<c:if test="${empty sessionScope.loginId }">
		<a href="${pageContext.request.contextPath}/member/join.do">회원가입</a>
		<a href="${pageContext.request.contextPath}/member/login.do">로그인</a>
	</c:if>
	<c:if test="${not empty sessionScope.loginId }">
<table>
<tr>
		<td><a onmouseover="a()" href="${pageContext.request.contextPath}/board/boardList.do">모임</a></td>
		<td><a onmouseover="a()" href="${pageContext.request.contextPath}/board/addBoard.do?memberId=${sessionScope.loginId}">모임등록</a></td>
		<td><a onmouseover="showH()">히스토리</a></td>
		<td><a onmouseover="a()" href="${pageContext.request.contextPath}/review/reviewList.do">후기</a></td>
		<td><a onmouseover="showM()">마이페이지</a></td>
		<td><a onmouseover="a()" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></td>
		</tr>
<tr>
		<td colspan="2"></td>
		<td>
		<div id="history" style="display: none;">
			<a href="${pageContext.request.contextPath}/board/host.do?memberId=${sessionScope.loginId}">주최한 모임</a><br/>
			<a href="${pageContext.request.contextPath}/board/participateList.do?memberId=${sessionScope.loginId}">참여한 모임</a>
		</div>
		</td>
		<td></td>
		<td>
		<div id="myInfo" style="display: none;">
			<a href="${pageContext.request.contextPath}/member/mypage.do?memberId=${sessionScope.loginId}">내정보 수정</a><br/>
			<a href="${pageContext.request.contextPath}/board/favorites.do?memberId=${sessionScope.loginId}">즐겨찾기</a><br/>
		</div>
		</td>
		<td></td>
</tr>
</table>
	</c:if>
</body>
</html>