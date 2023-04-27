<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>

//선택한 파일로 미리보기 적용하는 함수
	  window.onload = function() {
	  document.getElementById("upload-file").addEventListener("change", function(event) {
			var file = event.target.files[0];
	  		var reader = new FileReader();
	  
			reader.onload = function(e) {
	    	document.getElementById("upload-preview").src = e.target.result;
			document.getElementById("imagepath").src = e.target.result;
	  };

	  reader.readAsDataURL(file);
	});
}

	  function save(){
	  alert('message');
	  window.location = '${pageContext.request.contextPath}/review/detail.do';

	  
	  function cancle(){
		  alert('message');
		  window.location = '${pageContext.request.contextPath}/participateList.do';
		  }

</script>

</head>
<body>

<h3>리뷰작성</h3>
<form name="f" action="${pageContext.request.contextPath }/review/add.do" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" id="member_id" value="${sessionScope.loginId}" readonly></td></tr>

<!-- <th>글번호(원글)</th> -->
<tr><td><input type="hidden" name="board_num" value="${vo.boardNum }"></td></tr>

<tr><th>태그</th><td><input type="text" name="tag" id="tag" value="${tag }"></td></tr>
<tr><th>글내용</th><td><textarea rows="10" cols="100" name="content" id="content"></textarea></td></tr>
<tr><th>이미지</th>
<td><input type="file" id="imagepath" name="imagepath"> 


</td></tr>
<tr><th>작성</th><td>
	<input type="submit" value="저장" onclick="save()">
	<a href="${pageContext.request.contextPath }/review/detail.do"><input type="button" value="작성취소" onclick="cancle()"></a></td></tr>

</table>
</form>
</body>
</html>