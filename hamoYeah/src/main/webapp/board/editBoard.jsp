<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>


function checkDatetime() {
    // 입력된 날짜와 시간 가져오기
    var input = document.getElementById("dDay").value;

    var now = new Date();

    // 입력된 값과 현재 시간 비교
    var inputDatetime = new Date(input);
    if (inputDatetime < now) {
      alert("과거의 날짜와 시간을 입력하셨습니다.");
    } 
}

// function finCheck(num) {
// 	let title = document.getElementById("title").value;
// 	let content = document.getElementById("content").value;	
// 	let imagepath = document.getElementById("imagepath").value;	
// 	let place = document.getElementById("place").value;	
// 	let dDay = document.getElementById("dDay").value;	
// 	let tag = document.getElementById("tag").value;	
// 	let peopleMax = document.getElementById("peopleMax").value;	
	
// 	if (title == '' || content == '' || imagepath == '' || place == '' || dDay == '' || tag == '' || peopleMax == '') {
//   		alert("입력되지 않은 값이 있습니다. 다시 확인해주세요.")
//    		event.preventDefault();
//    		return;
// 	}
	
// 	let param = "?boardNum=" + num;
// 	f.action = "${pageContext.request.contextPath }/board/editBoard.do" + param;
// 	f.submit();
// }

window.onload = function() {
	  document.getElementById("imagepath").addEventListener("change", function(event) {
			var file = event.target.files[0];
	  		var reader = new FileReader();
	  
			reader.onload = function(e) {
	    	document.getElementById("upload-preview").src = e.target.result;
			document.getElementById("imagepath").src = e.target.result;
	  };

	  reader.readAsDataURL(file);
	});
}

function editBoard(boardNum) {
	let check = confirm("정말 수정하시겠습니까?");
	if (check == true) {
		let param = boardNum;
		let form = document.getElementById("f");
		f.action = "${pageContext.request.contextPath}/board/editBoard.do?boardNum=" + param;
		f.submit();
		return;
	}
}


function delBoard(boardNum) {
	let check = confirm("정말 삭제하시겠습니까?");
	if (check == true) {
		let param = boardNum;
		let form = document.getElementById("f");
		f.action = "${pageContext.request.contextPath}/board/deleteBoard.do?boardNum=" + param;
		f.submit();
		return;
	}
}

    
</script>
</body>


<body>

<form action ="${pageContext.request.contextPath }/board/editBoard.do" method="post" enctype="multipart/form-data" id="f" name="f">

<table border="1">
<tr><td colspan="4">모임 게시글 등록</td></tr>
<tr><td>작성자</td><td colspan="3">${vo.memberId }<input type="hidden" value="${vo.memberId }"></td></tr>
<tr><td colspan="4">
<input type="text" name="title" id="title" value="${vo.title }"> </td></tr>

<tr><td colspan="4">
<textarea rows="12" cols="20" name="content" id="content">${vo.title }</textarea></td></tr>

<tr>
<td rowspan="4"><input type="file" name="imagepath" id="imagepath" style="display:none">

<label for="imagepath">
	<img src="${vo.imagepath }" width="150px" height="150px" id="upload-preview">
</label>

<input type="file" style="display:none" id="imagepath" accept="image/*">


<td>최대참여인원</td><td><input type="number" name="peopleMax" id="peopleMax" value="${vo.peopleMax }"></td><td>명</td></tr>

<tr><td>모임진행일시</td><td colspan="2"><input type="datetime-local" name="dDay" id="dDay" value="${vo.dDay }" onchange="checkDatetime()"></tr>


<tr><td>관심태그설정</td>
<td colspan="2">
<span id="tagSelected">${vo.tag }</span>
<select name ="tag" id="tag" style="display:none">
	<option value="문화/예술">문화/예술</option>
	<option value="운동/액티비티">운동/액티비티</option>	
	<option value="푸드/드링크">푸드/드링크</option>
	<option value="취미">취미</option>
	<option value="봉사활동">봉사활동</option>
	<option value="반려동물">반려동물</option>
	<option value="성장/자기계발">성장/자기계발</option>
	<option value="대화/친목">대화/친목</option>
</select>
</td></tr>

<tr><td>모임장소설정</td><td colspan="2"><input type="text" name="place" id="place" value="${vo.place }"></td></tr>
<tr><td colspan="4"><input type="button" value="back" onclick="location.href='${pageContext.request.contextPath }/index.jsp'">
<input type="submit" value="수정" onclick="editBoard(${vo.boardNum})">
<input type="button" value="삭제" onclick="delBoard(${vo.boardNum})"></td></tr>


</table>
</form>
</body>
</html>