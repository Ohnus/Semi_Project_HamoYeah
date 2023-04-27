<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

function finCheck() {
	let title = document.getElementById("title").value;
	let content = document.getElementById("content").value;	
	let imagepath = document.getElementById("imagepath").value;	
	let place = document.getElementById("place").value;	
	let dDay = document.getElementById("dDay").value;	
	let tag = document.getElementById("tag").value;	
	let peopleMax = document.getElementById("peopleMax").value;	
	
	if (title == '' || content == '' || imagepath == '' || place == '' || dDay == '' || tag == '' || peopleMax == '') {
  		alert("입력되지 않은 값이 있습니다. 다시 확인해주세요.")
   		event.preventDefault();
   		return;
	}
	f.action = "${pageContext.request.contextPath }/board/addBoard.do";
	f.submit();
}


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

    
</script>
</head>
</body>


<body>

<form action ="" method="post" enctype="multipart/form-data" id="f" name="f">

<table border="1">
<tr><td colspan="4">모임 게시글 등록</td></tr>
<tr><td>작성자</td><td colspan="3">${sessionScope.loginId }</td></tr>
<tr><td colspan="4">
<input type="text" name="title" id="title" placeholder="제목을 입력해주세요(최대 40자)"> </td></tr>

<tr><td colspan="4">
<textarea rows="12" cols="20" name="content" id="content" placeholder="내용을 입력해주세요(최대 2000자)"></textarea></td></tr>

<tr>
<td rowspan="4"><input type="file" name="imagepath" id="imagepath" style="display:none">

<label for="imagepath">
	<img src="../systemImg/imageadd.png" width="150px" height="150px" id="upload-preview">
</label>

<input type="file" style="display:none" id="imagepath" accept="image/*">


<td>최대참여인원</td><td><input type="number" name="peopleMax" id="peopleMax"></td><td>명</td></tr>

<tr><td>모임진행일시</td><td colspan="2"><input type="datetime-local" name="dDay" id="dDay" onchange="checkDatetime()"></tr>


<tr><td>관심태그설정</td>
<td colspan="2">
<select name ="tag" id="tag">
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

<tr><td>모임장소설정</td><td colspan="2"><input type="text" name="place" id="place" placeholder="(예시)서울 여의도 한강공원"></td></tr>
<tr><td colspan="2"><input type="button" value="back" onclick="location.href='${pageContext.request.contextPath }/index.jsp'"></td>
<td colspan="2"><input type="button" value="등록" onclick="finCheck()"></td>
</tr>

</table>
</form>
</body>
</html>