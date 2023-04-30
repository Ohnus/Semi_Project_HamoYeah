<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// 노란별을 누르면 회색별로 변하고 0->1 
// 회색별을 누르면 노란별로 변하고 1->0
function change(board, id){
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function(){
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img_"+board);
		if (obj.color == 0){ // true - 노랗게 변하기
			img.src = "../img/F1.png";
		} else { // false - 회색으로 변하기
			img.src = "../img/F2.jpeg";
		}
	}
	
    let param = "boardNum=" + board;
    param += "&memberId=" + id;
	xhttp.open("Post", "${pageContext.request.contextPath}/board/favorites.do");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
}
</script>
</head>  
<body>
<h3>내가 찜한 모임</h3>
<c:if test="${empty finalList}">
<h5>즐겨찾기한 모임이 없습니다.</h5>
</c:if>

<c:if test="${not empty finalList}">
<c:forEach var="vo" items="${finalList}">
		<table border="1">
			<tr><td rowspan="4"><img src="${vo.imagepath}" style="width:100px; height:100px;"></td>
				<td>${vo.tag}<img src="../img/F1.png" id="img_${vo.boardNum}" style="width:30ps; height:30px;" onclick="change('${vo.boardNum}', '${sessionScope.loginId}')"></td></tr>
			<tr><td><a href="${pageContext.request.contextPath }/board/boardDetail.do?boardNum=${vo.boardNum}&memberId=${sessionScope.loginId}">${vo.title }</a></td></tr>
			<tr><td>${vo.place}/${vo.dDay}</td></tr>
			<tr><td>참여인원 ${vo.ok}/${vo.peopleMax}</td></tr>
		</table>
</c:forEach>
</c:if>
</body>
</html>