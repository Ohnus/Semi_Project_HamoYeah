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
<style type="text/css">
.review-list {
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.review-list h2 {
  font-size: 24px;
  margin-bottom: 20px;
}

.review-list ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.review-list li {
  margin-bottom: 20px;
}

.review {
  border: 1px solid #ddd;
  border-radius: 5px;
  padding: 20px;
}

.review .review-info {
  margin-bottom: 10px;
}

.review .review-info .review-user {
  font-weight: bold;
  margin-right: 10px;
}

.review .review-info .review-date {
  color: #999;
}

.review .review-content .review-title {
  font-size: 18px;
  margin-bottom: 10px;
}

.review .review-content .review-text {
  margin: 0;
}


.review-text{
   display: inline-block;            
   width: 200px;                     
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}
/* 예시2 */
/* { */
/* overflow: hidden; */
/* text-overflow: ellipsis; */
/* white-space: nowrap; */
/* word-break:break-all; */
/* width: 100px; */
/* height: 20px; */
/* } */

</style>
</head>
<body>


<div class="review-list">
  <h2>리뷰 목록</h2>
	<c:if test= "${not empty sessionScope.loginId }">
  		<a href="${pageContext.request.contextPath }/board/participate.do?id=${vo.memberId}">리뷰작성하러 가기</a>
	</c:if>
  

  	<c:forEach var="vo" items="${list }">			
		    <form action="${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.boardNum}" method="post">
		 <ul>
		    <li>
		      <div class="review">
		        <div class="review-info">
		          <span class="review-user">${vo.memberId }</span>
		          <span class="review-date">${vo.rDate }</span>
		         
			<!--          자기가 작성한 글만 수정 및 삭제할 수 있음  -->
		           <c:if test="${not empty sessionScope.loginId }">
			          <input type="submit" value="수정">
			          <input type="button" value="삭제" onclick="javascript:location.href='${pageContext.request.contextPath }/review/edit?num=${vo.boardNum}'">
		        	</c:if>
		        </div>
		        
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
</div>
<script>
</script>
</body>
</html>