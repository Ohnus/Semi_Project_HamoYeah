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
	// 비동기로 결과 리스트 전환하기
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


function searchByTag(id) {
	let param = "?id=" + document.getElementById(id).value; // 해당 구문은 무조건 쌍으로 설정. 보냈을 때 어떤 것의 값인지 알아야하기 때문

	f.action = "${pageContext.request.contextPath }/board/tagList.do" + param;
	f.submit();
}


function change(board, id) {
	const xhttp = new XMLHttpRequest();
	
	xhttp.onload = function() {
		let obj = JSON.parse(xhttp.responseText);
		let img = document.getElementById("img_" + board);
		if(obj.color == 0){
			img.src = "../img/F1.png";
		} else {
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

<form action="" method="post" id="f">
<input type="button" value="전체" onclick="location.href='${pageContext.request.contextPath }/board/boardAllList.do'">
<input type="button" id="1" value="문화/예술" onclick="searchByTag(1)">
<input type="button" id="2" value="운동/액티비티" onclick="searchByTag(2)">
<input type="button" id="3" value="푸드/드링크" onclick="searchByTag(3)">
<input type="button" id="4" value="취미" onclick="searchByTag(4)">
<input type="button" id="5" value="봉사활동" onclick="searchByTag(5)">
<input type="button" id="6" value="반려동물" onclick="searchByTag(6)">
<input type="button" id="7" value="성장/자기계발" onclick="searchByTag(7)">
<input type="button" id="8" value="대화/친목" onclick="searchByTag(8)">
</form>



<c:if test="${empty list }"><p>선택하신 관심사로 작성된 글이 없습니다.</p></c:if>

<c:forEach var="vo" items="${list }">
<%-- <input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/board/editBoard.do?boardNum=' + ${vo.boardNum}"> --%>
<table border="1" style="width:400px; height:100px">

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