<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>관리자 페이지</h3>
<c:if test="${list.y_card == 3}">
<table border="1">
<tr><td>글번호</td><td>제목</td><td>작성자</td><td>신고내용</td><td>처리결과</td></tr>
<c:forEach var="vo" items="${list }">
<tr>
<td>${vo.boardNum }</td><td>${vo.title }</td><td>${vo.memberId }</td>
<td><a href="${pageContext.request.contextPath}/admin/process.do?boardNum=${vo.boardNum}">상세보기</a></td>
<td>${vo.process }</td>
</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>