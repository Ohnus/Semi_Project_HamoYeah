<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주최한 모임 리스트</title>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel="stylesheet" href="./style.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
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
<c:if test="${empty listOn && empty listOff}"><p style="text-align:center"></br>주최한 모임이 없습니다.</p></c:if>

<c:if test="${not empty listOn || not empty listOff}">

<h5 style="font-weight:bold; text-align:center; line-height:250%; margin-top:5%;">진행중인 모임</h5><br/>

<div class="list-container grid">

<c:forEach var="vo" items="${listOn}">
<c:if test="${vo.y_card ne 3}"> <!-- eq: == -->
 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">
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
          <button style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px" 
          onclick="location.href='${pageContext.request.contextPath}/member/okList.do?boardNum=${vo.boardNum}'">멤버승인</br>하러가기</button>
        </div>
      </div>
    </div>
    </div>
    </div>
</c:if>
</c:forEach>

<c:forEach var="vo" items="${listOn}">
<c:if test="${vo.y_card eq 3}"> <!-- eq: == -->
<div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">
       <img class="img-fluid mr-3" style="width:100px; height:100px; filter:blur(3px)" src="${vo.imagepath }"></a>
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
          <button style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px; color:red" 
          onclick="location.href='${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}'">신고글</br>보러가기</button>
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
<hr style="color:#EAEAEA; width:97%; margin:auto;">
<br/>

<h5 style="font-weight:bold; text-align:center; line-height:250%">완료된 모임</h5>
<div class="list-container grid">

<c:forEach var="vo" items="${listOff}">
<c:if test="${vo.y_card ne 3}"> <!-- eq: == -->

 <div class="container mx-auto">
  <div class="grid-cols-3 gap-10">
   <div>
     <div class="d-flex transition duration-500 ease-in-out flex-grow-1 p-2 border" style="box-shadow: 0 0 2px #eee; width:470px">
     <a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}">
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
          <button style="background-color:transparent; border:none; font-family:NanumSquareNeoBold; font-size:15px" 
          onclick="location.href='${pageContext.request.contextPath}/review/search.do?boardNum=${vo.boardNum}'">후기</br>보러가기</button>
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