<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>

	<title>HAMO YEAH</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Untree.co">
	<link rel="shortcut icon" href="logo.png">

	<meta name="description" content="" />
	<meta name="keywords" content="bootstrap, bootstrap4" />

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/owl.theme.default.min.css">
	<link rel="stylesheet" href="../css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="../fonts/icomoon/style.css">
	<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
	<link rel="stylesheet" href="../css/daterangepicker.css">
	<link rel="stylesheet" href="../css/aos.css">
	<link rel="stylesheet" href="../css/style.css">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<style>
label {
	font-family: 'NanumSquareNeo', sans-serif;
}

body {
	font-family: 'NanumSquareNeoLight', sans-serif;
	font-size: 13px;
}
</style>

</head>

<body>

<div id="container">
	<c:if test="${empty sessionScope.loginId }">
	<!-- navbar code -->

		<nav class="site-nav">
		    <div class="container">
		      <div class="site-navigation">
		        <a href="${pageContext.request.contextPath}/index.jsp" class="logo m-0">HAMO YEAH<span class="text-primary"></span></a>
				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
				<li><a href="${pageContext.request.contextPath}/member/join.do">회원가입</a></li>
				<li><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
				</ul>

		        <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
					<span></span>
				</a>

			</div>
		</div>
	</nav>
	<!-- 페이지 줄어들면 햄버거 바 생기는 코드 -->
	<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
      <span></span>
    </a>
	</c:if>
</div>
	
	<c:if test="${not empty sessionScope.loginId && sessionScope.loginId eq 'master'}">
		<table>
			<tr><td><a href="${pageContext.request.contextPath}/admin/manage.do">관리자 페이지</a></td>
				<td><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></td></tr>
		</table>
	</c:if>
	
<c:if test="${not empty sessionScope.loginId && sessionScope.loginId ne 'master'}">

<!-- navbar code -->
	<nav class="site-nav">
    <div class="container">
      <div class="site-navigation">
        <a href="${pageContext.request.contextPath}/index.jsp" class="logo m-0">HAMO YEAH<span class="text-primary"></span></a>

        <ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
          <li><a href="${pageContext.request.contextPath}/board/boardAllList.do?memberId=${sessionScope.loginId}">모임</a></li>
          <li><a href="${pageContext.request.contextPath}/board/addBoard.do?memberId=${sessionScope.loginId}">모임 등록</a></li>

          <li class="has-children">
            <a href="#">History</a>
            <ul class="dropdown">
              <li><a href="${pageContext.request.contextPath}/board/host.do?memberId=${sessionScope.loginId}">주최한 모임</a></li>
              <li><a href="${pageContext.request.contextPath}/board/participateList.do?memberId=${sessionScope.loginId}">참여한 모임</a></li>
            </ul>
          </li>
          <li class="has-children">
            <a href="#">MyPage</a>
            <ul class="dropdown">
              <li><a href="${pageContext.request.contextPath}/member/mypage.do?memberId=${sessionScope.loginId}">내정보 수정</a></li>
              <li><a href="${pageContext.request.contextPath}/board/favorites.do?memberId=${sessionScope.loginId}">즐겨찾기</a></li>
            </ul>
          </li>
           <li><a href="${pageContext.request.contextPath}/review/list.do">후기</a></li>
           <li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
        </ul>
	<!-- 햄버거바  -->
        <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light" data-toggle="collapse" data-target="#main-navbar">
          <span></span>
        </a>
        
      </div>
    </div>
  </nav>
	
</c:if>
<!-- memberId=${sessionScope.loginId} -->

</body>
</html>