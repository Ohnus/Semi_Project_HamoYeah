<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
		<tr>
			<td colspan="2" style="height: 150px">
				<%@ include file="/menu/header.jsp"%></td>
		</tr>
		<tr style="height: 400px">
			<td style="width: 400px">
				<c:if test="${empty view }">
				<!-- 수정 필요!!! -->
					<%@ include file="/board/boardList.jsp" %>
				</c:if>
				<c:if test="${not empty view }">
					<jsp:include page="${view }" />
				</c:if>
			</td>
		</tr>
	</table>
	<%@ include file="/menu/tail.jsp"%>
</body>
</html>