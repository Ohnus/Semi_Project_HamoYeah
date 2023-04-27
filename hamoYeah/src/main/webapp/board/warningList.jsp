<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Warning List</title>
</head>
<body>
	<h3>신고하기</h3>
         <form action="${pageContext.request.contextPath }/board/warning.do" method="post">
         <input type="text" name="memberId" value="${sessionScope.loginId}" readonly><br/>
         <input type="text" name="boardNum" value="${boardvo.boardNum}" readonly><br/>
         <input type= name="content"></textarea><br/>
         <input type="submit" value="제출">
         </form>
</body>
</html>