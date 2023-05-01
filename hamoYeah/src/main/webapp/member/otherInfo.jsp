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
<title>Insert title here</title>
</head>
<body>
<h3>땡땡님 정보</h3>
<form action="" method="post" name="ff">
<table border="1">
<tr>
<td rowspan="2"><img src="${vo.imagepath }" name="img" style="width: 100px; height: 100px;"></td>
<td>${vo.nickname }</td>
</tr>
<tr><td>${vo.intro }</td></tr>
<tr><td>성별</td><td>${vo.gender }</td></tr>
<tr><td>연령대</td><td>${vo.age }</td></tr>
<tr><td>태그</td>
<td>
${vo.tag1 }<br/>
${vo.tag2 }<br/>
${vo.tag3 }
</td></tr>
</table>
</form>
</body>
</html>