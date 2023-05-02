<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function go(){
	const xhttp = new XMLHttpRequest();
	let pro = document.getElementById("pro").value;
	
	if (pro == "0"){
		xhttp.open("POST", "${pageContext.request.contextPath}/admin/manage.do");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send();
		
		
		xhttp.onload = function(){
			let arr = JSON.parse(xhttp.responseText);
			let html = '';
			html += "<tr><td>글번호</td><td>제목</td><td>작성자</td><td>신고내용</td></tr>";
			for(let obj of arr){
				html += "<tr><td>"+ obj.boardNum;
				html += "</td><td>" + obj.title;
				html += "</td><td>" + obj.memberId;
				html += "</td><td><a href='${pageContext.request.contextPath}/admin/process.do?boardNum="+ obj.boardNum;
				html += "'>[상세보기]</a></td></tr>";
			}
			let table = document.getElementById("table");
			table.innerHTML = html;
		}
	} else if (pro == "1"){
		xhttp.open("GET", "${pageContext.request.contextPath}/admin/select.do");
		xhttp.send();
		
		xhttp.onload = function(){
			let arr = JSON.parse(xhttp.responseText);
			let html = '';
			html += "<tr><td>글번호</td><td>제목</td><td>작성자</td><td>신고내용</td></tr>";
			for(let obj of arr){
				html += "<tr><td>"+ obj.boardNum;
				html += "</td><td>" + obj.title;
				html += "</td><td>" + obj.memberId;
				html += "</td><td><a href='${pageContext.request.contextPath}/admin/process.do?boardNum="+ obj.boardNum;
				html += "'>[상세보기]</a></td></tr>";
			}
			let table = document.getElementById("table");
			table.innerHTML = html;
		}
	} else {
		xhttp.open("POST", "${pageContext.request.contextPath}/admin/select.do");
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhttp.send();
		
		xhttp.onload = function(){
			let arr = JSON.parse(xhttp.responseText);
			let html = '';
			html += "<tr><td>글번호</td><td>제목</td><td>작성자</td><td>신고내용</td></tr>";
			for(let obj of arr){
				html += "<tr><td>"+ obj.boardNum;
				html += "</td><td>" + obj.title;
				html += "</td><td>" + obj.memberId;
				html += "</td><td><a href='${pageContext.request.contextPath}/admin/process.do?boardNum="+ obj.boardNum;
				html += "'>[상세보기]</a></td></tr>";
			}
			let table = document.getElementById("table");
			table.innerHTML = html;
		}
	}
}
</script>
</head>
<body>
<h3>관리자 페이지</h3>
<select id="pro" onchange="go()">
	<option value="0">처리중</option>
	<option value="1">복구</option>
	<option value="2">정지</option>
</select>

<table border="1" id="table">
<tr><td>글번호</td><td>제목</td><td>작성자</td><td>신고내용</td></tr>
<c:forEach var="vo" items="${list}">
<tr>
<td>${vo.boardNum }</td><td>${vo.title }</td><td>${vo.memberId }</td>
<td><a href="${pageContext.request.contextPath}/admin/process.do?boardNum=${vo.boardNum}">상세보기</a></td>
</tr>
</c:forEach>
</table>
</body>
</html>