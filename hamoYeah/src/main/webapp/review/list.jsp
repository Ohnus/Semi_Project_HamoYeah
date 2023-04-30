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

  <h2>리뷰 목록</h2>
	<c:if test= "${not empty sessionScope.loginId }">
  		<a href="${pageContext.request.contextPath }/board/participateList.do?memberId=${sessionScope.loginId }">리뷰작성하러 가기</a>
	</c:if>
  

  	<c:forEach var="vo" items="${list }">			
		    <form action="${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.boardNum}" method="post">
		 <ul>
		    <li>
		      <div class="review">
		        <div class="review-info">
		          <span class="review-user">${vo.memberId }</span>
		          <span class="review-date">${vo.rDate }</span>
		         
		        
		        <div>
		          <h3>${vo.reviewNum } 리뷰</h3>
		             <div>
		            <a href="${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.reviewNum}" >
		            <img src="${vo.imagepath }" width="150" height="100"></a>
		         </div>
		          <p>${vo.content }</p>
		        </div>
		      </div>
		    </li>
		     </ul>
		    </form>
  	</c:forEach>

</body>
</html>
