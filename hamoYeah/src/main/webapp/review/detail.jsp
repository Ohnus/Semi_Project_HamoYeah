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


<form action="${pageContext.request.contextPath }/review/detail" method="post">
<table border="1" width="800" height="250">
	<tr height="75">
		<td rowspan="2" width="150">${ m.file} 이미지</td>
		<td>${m.tag } 태그</td>
	</tr>	
	<tr>
		<td>${m.content } 내용</td>
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
		          <span class="review-user">${vo.member_id }</span>
		          <span class="review-date">${vo.r_date }</span>
		          
		           <c:if test="${not empty sessionScope.loginId }">
			          <input type="submit" value="수정">
			          <input type="button" value="삭제" onclick="javascript:location.href='${pageContext.request.contextPath }/review/edit?num=${vo.board_num}'">
		        	</c:if>
		        </div>
		        
		        <div class="review-content">
		          <h3 class="review-title">${vo.review_num } 리뷰</h3>
		             <div class="images">
		            <img src="${vo.imagepath }" alt="사진을 추가해주세요.">
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