<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여 신청 리스트</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel="stylesheet" href="./style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
body {
	font-family:'NanumSquareNeo';
}

 .list-container { 
 	display: grid; 
  	grid-template-columns: repeat(2, 1fr);
   	grid-gap: 1rem; 
 	justify-content: center; 
 	align-items: center; 
 	font-family: "NanumSquareNeoLight"; 
 	margin: 0 auto; 
 	font-family: 'NanumSquareNeoLight', sans-serif; 
}
</style>

</head>
<body>
<div id="" style="margin-top:5%"> </div>

<!-- <div class="container my-5"> -->
</br>
<c:if test="${empty listOn0 && empty listOn1 && empty listOn2}">
	<p style="text-align:center">참여 신청한 모임이 없습니다.</p>
</c:if>
<br/>

<c:if test="${not empty listOn0 || not empty listOn1 || not empty listOn2}">

<h5 style="font-weight:bold; text-align:center; line-height:250%">진행중인 모임</h5>
<br/>

<h6 style="font-weight:bold; text-align:left; line-height:250%; color:"#40e0d0">　승인 완료된 모임😆</h6> <!-- 승인 완료된 글 중에 신고 당하지 않은 글 -->

<div class="list-container grid">
<c:forEach var="vo" items="${listOn1}">
<c:if test="${vo.y_card ne 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="width:260px">
            <medium style="color:#40e0d0; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">⏰모임일시 | ${vo.dDay }</small></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">
        </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>


<c:forEach var="vo" items="${listOn1}"> <!-- 승인 완료된 글 중 신고 당한 글 -->
<c:if test="${vo.y_card eq 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="filter:blur(3px); width:260px">
            <medium style="color:#40e0d0; font-weight:bold; width:250px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">⏰모임일시 | ${vo.dDay }</small></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">
         <button disabled style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px; color:red">신고된 글</button>
         </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>
</div>

</br>
<h6 style="font-weight:bold; text-align:left; line-height:250%">　승인을 기다리는 모임🙄</h6>

<div class="list-container grid">
<c:forEach var="vo" items="${listOn0}"> <!-- 승인 기다리는 모임 중 신고 당하지 않은 글 -->
<c:if test="${vo.y_card ne 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="width:260px">
            <medium style="color:#40e0d0; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">⏰모임일시 | ${vo.dDay }</small></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">
        </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>

<c:forEach var="vo" items="${listOn0}"> <!-- 승인 기다리는 모임 중 신고 당한 글 -->
<c:if test="${vo.y_card eq 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="filter:blur(3px); width:260px">
            <medium style="color:#40e0d0; font-weight:bold; width:250px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">⏰모임일시 | ${vo.dDay }</small></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">
         <button disabled style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px; color:red">신고된 글</button>
         </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>
</div>


</br>
<h6 style="font-weight:bold; text-align:left; line-height:250%; color:"#40e0d0">　승인 거절된 모임😢</h6>

<div class="list-container grid">
<c:forEach var="vo" items="${listOn2}"> <!-- 승인 거절 된 모임 중 신고 당하지 않은 글 -->
<c:if test="${vo.y_card ne 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="width:260px">
            <medium style="color:#40e0d0; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">⏰모임일시 | ${vo.dDay }</small></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">
        </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>

<c:forEach var="vo" items="${listOn2}"> <!-- 승인 거절 된 모임 중 신고 당한 글 -->
<c:if test="${vo.y_card eq 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="filter:blur(3px); width:260px">
            <medium style="color:#40e0d0; font-weight:bold; width:250px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">⏰모임일시 | ${vo.dDay }</small></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div style="filter:blur(3px)"><small style="line-height:1; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">
         <button disabled style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px; color:red">신고된 글</button>
         </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>
</div>


<br/>
<br/>
<hr style="color:#EAEAEA; width:97%; margin:auto;"> <!-- 가로 줄 -->
<br/>
</c:if>

<c:if test="${empty listOff}">
</c:if>
<c:if test="${not empty listOff}">
<h5 style="font-weight:bold; text-align:center; line-height:250%">완료된 모임</h5>
<div class="list-container grid">
<c:forEach var="vo" items="${listOff}">
<c:if test="${vo.y_card ne 3}">
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">
       <img class="img-fluid mr-3" style="width:100px; height:100px" src="${vo.imagepath }"></a>
        <div>
          <div class="d-flex transition duration-500 ease-in-out flex-grow-2" style="width:260px">
            <medium style="color:#40e0d0; font-weight:bold; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">
            ${vo.title }</medium></div>
          <div><small style="line-height:1; width:100px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">⏰모임일시 | ${vo.dDay }</small></div>
          <div><small style="line-height:1; width:100px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🚩모임장소 | ${vo.place }</small></div>
          <div><small style="line-height:1; width:100px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis">🙋🏻‍♀️신청현황 | ${vo.ok} / ${vo.peopleMax }</small>
          </div>
        </div>
         <div class="d-flex transition duration-500 ease-in-out flex-grow-3">

			<c:if test="${vo.already eq 0 }">
        		 <button style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px" 
         		 onclick="location.href='${pageContext.request.contextPath}/review/add.do?boardNum=${vo.boardNum}'">후기 작성</button>
         		<button style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px" 
         		 onclick="location.href='${pageContext.request.contextPath}/review/search.do?boardNum=${vo.boardNum}'">후기 보기</button>
           </c:if> 
           <c:if test="${vo.already eq 1 }">
           		<button style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px" 
         		 onclick="location.href='${pageContext.request.contextPath}/review/search.do?boardNum=${vo.boardNum}'">후기</br>보러가기</button>
           </c:if>
        </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>
</div>
</c:if>

<br/>
</body>
</html>