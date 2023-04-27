<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script>

function searchByTag(id) {

	let param = "?id=" + document.getElementById(id).value; // 해당 구문은 무조건 쌍으로 설정. 보냈을 때 어떤 것의 값인지 알아야하기 때문

	f.action = "${pageContext.request.contextPath }/board/tagList.do" + param;
	f.submit();
}
	
</script>
</head>

<body>


<form action="" method="post" id="f">
<input type="button" value="전체" onclick="location.href='${pageContext.request.contextPath }/board/boardList.do'">
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
<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/board/editBoard.do?boardNum=' + ${vo.boardNum}">
<table border="1" style="width:600px, height:200px">

<tr><td rowspan="4"><img src="${vo.imagepath }" style="width:100px; height:100px"></td><td>${vo.tag }</td><td>즐겨찾기 아이콘</td></tr>
<tr><td colspan="2"><a href="${pageContext.request.contextPath }/board/detail.do">${vo.title }</a></td></tr>
<tr><td colspan="2">${vo.dDay } ${vo.place }</td></tr>
<tr><td>참여인원 프로필</td><td>참가신청인원 / ${vo.peopleMax }</td></tr>

</table>

</c:forEach>


</body>
</html>