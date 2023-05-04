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
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.7.3/tailwind.min.css'>
  <link rel="stylesheet" href="list.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'><link rel="stylesheet" href="./style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<title>후기 피드</title>
<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
	font-size: 13px;
}
.list-container {
	display: grid;
 	grid-template-columns: repeat(4, 1fr);
  	grid-gap: 4rem;
	justify-content: center;
	align-items: center;
	font-family: "NanumSquareNeoLight";
	margin: 0 auto;
	max-width: 1200px;
	font-family: 'NanumSquareNeoLight', sans-serif;
}

.grid {
  display: grid;
  grid-gap: 1rem;
  align-items: start;
}


.list {
  	width: 300px;
}

.tagbutton {
	font-family: "NanumSquareNeoBold";
	background-color: transparent;
    border: none;
    text-align: center;
}

.tagbutton button {
    margin: 10px; 
}

#f button {
	justify-content: center;
	align-items: center;
}

.icon{
justify-content: space-around;
}
.card{
overflow: hidden;  	
text-overflow: ellipsis; 
white-space: nowrap; 
word-break:break-all;
line-height: 1;
}
.con{
line-height:20px;
}
</style>
<script>

function searchByTag(id) {

   let param = "?id=" + document.getElementById(id).value; // 해당 구문은 무조건 쌍으로 설정. 보냈을 때 어떤 것의 값인지 알아야하기 때문

   location.href = "${pageContext.request.contextPath }/review/tagsearch.do" + param;
}
</script>
</head>
<body>
			<form action="" method="post" id="f" class="tagbutton">
			<button type="button" style="background-color: rgba(0, 0, 0, 0); border-color: transparent;" id="1" value="전체" 
			onclick="location.href='${pageContext.request.contextPath }/review/list.do'">ALL</button>
			<button type="button" id="1" value="문화/예술" onclick="searchByTag(1)">🎨문화/예술</button>
			<button type="button" id="2" value="운동/액티비티" onclick="searchByTag(2)">⚽운동/액티비티</button>
			<button type="button" id="3" value="푸드/드링크" onclick="searchByTag(3)">🍕푸드/드링크</button>
			<button type="button" id="4" value="취미" onclick="searchByTag(4)">🎮취미</button>
			<button type="button" id="5" value="봉사활동" onclick="searchByTag(5)">💙봉사활동</button>
			<button type="button" id="6" value="반려동물" onclick="searchByTag(6)">🐶반려동물</button>
			<button type="button" id="7" value="성장/자기계발" onclick="searchByTag(7)">📚성장/자기계발</button>
			<button type="button" id="8" value="대화/친목" onclick="searchByTag(8)">👨‍👩‍👦대화/친목</button>
			</form>
			<br/>

<!-- 	------------------------------------------------------------------------------------ -->
		<c:if test="${empty list }"><p align="center" class="text_not">선택하신 관심사로 작성된 글이 없습니다.</p></c:if>
<!-- 	------------------------------------------------------------------------------------ -->

		
<!-- 		<div class="icon" style="width:1000px;"> -->
<%-- 				<c:if test= "${not empty sessionScope.loginId }"> --%>
<%-- 		        <div class="writereview" style="text-align:center;"><a href="${pageContext.request.contextPath }/board/participateList.do?memberId=${sessionScope.loginId}" > --%>
<%-- 		        <img src="${pageContext.request.contextPath }/review/write.png" class="w_review" style="width:30px; height:30px; text-align:center;"> --%>
<!-- 		        </a></div> -->
<%-- 		  	 	</c:if> --%>
<!--   	 	</div> -->


<!-- 리뷰작성하러 가기  -->
		<div class="icon" style="width:1300px; display:flex; text-align:right; margin-left:5px;">
			<div class="container"  style="padding-right:0px">
				<c:if test= "${not empty sessionScope.loginId }">
		        <div class="1" style="text-align:right;">
		        <button href='${pageContext.request.contextPath }/board/participateList.do?memberId=${sessionScope.loginId}' >
		       	<img src="${pageContext.request.contextPath }/review/write.png" class="w_review rounded mx-auto d-block" style="width:30px; height:30px;"></button>
		       	<strong style="margin:auto;">리뷰작성하러 가기</strong></div>
		        </c:if></div>
  	 	</div>





		<div class="list-container grid">

		<c:forEach var="vo" items="${list }">
		
		
		<div class="container mx-auto px-10" id="list" style="width:300px; height:350px">
		  <div class="grid grid-cols-1 gap-10">
			<div class="card">		 
		    <div class="rounded overflow-hidden shadow-sm flex flex-col">
		    <a href="${pageContext.request.contextPath }/review/detail.do?reviewNum=${vo.reviewNum}">
		    <img class="w-full" src="${vo.imagepath }" style="width:300px; height:200px;"></a>    
			</div>		
		
		
		
		
		
		    <div class="px-6 py-3 mb-auto flex">
		    <div class="text-xs transition duration-500 ease-in-out flex-grow-1" style="color:rgb(64,224,208); font-family:NanumSquareNeo; font-size:17px"><strong>${vo.tag }</strong></div><div style="font-size:10px">${vo.rDate }</div></div>
		    
		 
	
		    <div class="text-gray-500 text-sm mb-2" style="width:225px; padding:5px; height:44px; font-family:NanumSquareNeo; display:-webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;"><strong>${vo.content }</strong></div>
		     </div></div></div>
		</c:forEach>
		</div>
</body>
</html>