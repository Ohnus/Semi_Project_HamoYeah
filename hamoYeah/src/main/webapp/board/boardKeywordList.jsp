<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script>

function searchByKeyword() {
	let type = k.keywordSearch.value;
	let searchText = document.getElementById("searchText").value;
    let form = document.getElementById("f");

	if (type == "1") {
		let param = "?place=" + searchText;
		k.action = "${pageContext.request.contextPath }/board/placeList.do" + param;
		k.submit();
		
	} else if (type == "2") {
		let param = "?title=" + searchText;
		k.action = "${pageContext.request.contextPath }/board/titleList.do" + param;
		k.submit();
		
	} else if (type == "3") {
		let param = "?content=" + searchText;
		k.action = "${pageContext.request.contextPath }/board/contentList.do" + param;
		k.submit();
	}

}


function change(board, id) {
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function() {
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img_" + board);
		if(obj.color == 0){
			img.src = "../systemImg/F1.png";
		} else {
			img.src = "../systemImg/F2.jpeg";
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

<form action="" method="post" id="k">
<table border="1">
<tr><td>
<select name="keywordSearch" id="keywordSearch">
	<option value="1">장소</option>
	<option value="2">제목</option>
	<option value="3">내용</option>
</select>
<input type="text" id="searchText" name="searchText" placeholder="검색할 내용을 입력해주세요">
<input type="button" value="검색" onclick="searchByKeyword()">
</td>
</tr>
</table>
</form>

<br/>

<c:forEach var="vo" items="${list }">
<%-- <input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/board/editBoard.do?boardNum=' + ${vo.boardNum}"> --%>
<table border="1" style="width:600px, height:200px">


<tr><td rowspan="4">
<img src="${vo.imagepath }" style="width:100px; height:100px;"></td><td>${vo.tag }</td>
<td><img src="../img/F2.jpeg" id="img_${vo.boardNum }" style="width:20px; height:20px;" onclick="change('${vo.boardNum}', '${sessionScope.loginId }')"></td></tr>
<tr><td colspan="2"><a href="${pageContext.request.contextPath }/board/detail.do">${vo.title }</a></td></tr>
<tr><td>장소/시간</td><td>${vo.dDay } ${vo.place }</td></tr>
<tr><td><img src="../img/people.png" style="width:20x; height:20px;"></td><td>${vo.ok } / ${vo.peopleMax }</td></tr>

</table>

</c:forEach>




</body>
</html>