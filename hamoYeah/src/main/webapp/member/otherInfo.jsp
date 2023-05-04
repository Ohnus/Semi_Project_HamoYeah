<%@page import="member.HMemberVo"%>
<%@page import="member.HMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String memberId = request.getParameter("memberId");
HMemberService service = new HMemberService();
HMemberVo vo = service.getHMember(memberId);
request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="./otherInfostyle.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style type="text/css">
body{
font-family: 'NanumSquareNeo';
}
</style>

</head>
<body>
<form action="" method="post" name="ff">
  <div class="container">
    <div class="box">
      <div class="top">
        <div class="profile">
        <img src="${vo.imagepath }" style="width: 80px; height: 80px; border-radius: 70%">
        </div>
        <h1 class="title">${vo.nickname }</h1>
        <h3 class="job">${vo.tag1 }  ${vo.tag2 }  ${vo.tag3 }</h3>
      </div>
      <div class="bottom">
        <div class="links">
          <ul>
            <li>${vo.gender }</li>
            <li>${vo.age }</li>
            <li></li>
            <li><textarea rows=3px cols=25px disabled style="line-height:130%; resize:none; border:none; font-family: 'NanumSquareNeo';">${vo.intro }</textarea></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</form>
</body>
</html>