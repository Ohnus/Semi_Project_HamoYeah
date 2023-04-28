<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="${pageContext.request.contextPath }/review/detail.do" method="post">
<table border="1" width="800" height="250">


	<tr height="75">
		<td rowspan="2" width="150"><img src="${vo.imagepath }" width="150px" height="100px"></td>
		<td><input type="text" value="${vo.tag }" readonly></td>
	</tr>	
	<tr>
		<td><input type="text" value="${vo.content }"></td>
	</tr>

</table>
</form>

<!-- 상세페이지 밑에 리스트 띄우기 -->
		<div class="review-list">
		  <h1>더 많은 후기 피드</h1>
		 <ul>
		  <c:forEach var="vo" items="${list }">
		    <form action="" method="post">
		    <li>
		      <div class="review">
		        <div class="review-info">
		          <span class="review-user">${vo.memberId }</span>
		          <span class="review-date">${vo.rDate }</span>
		          
		           <c:if test="${not empty sessionScope.loginId }">
			          <input type="submit" value="수정">
			          <input type="button" value="삭제" onclick="javascript:location.href='${pageContext.request.contextPath }/review/edit?num=${vo.boardNum}'">
		        	</c:if>
		        </div>
		        
		        <div class="review-content">
		          <h3 class="review-title">${vo.reviewNum } 리뷰</h3>
		             <div class="images">
		            <img src="${vo.imagepath }" width="150px" height="100px">
		         </div>
		          <p class="review-text">${vo.content }</p>
		        </div>
		      </div>
		    </li>
		    </form>
		  </c:forEach>
		  </ul>
		</div>

</body>
</html>
