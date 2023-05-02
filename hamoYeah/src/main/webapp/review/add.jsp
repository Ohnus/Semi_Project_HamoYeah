<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	//파일 업로드 미리보기
	function thumbnail(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = e.target.result;
		}
	}
	function imgReset() {
		document.getElementById('preview').src = "../img/nopic.jpg";
		document.getElementById('imgpath').value = null;
	}

	function fincheck() {
		let imagepath = document.getElementById("imagepath").value;
		let content = document.getElementById("content").value;
		if (imagepath == '' || content == '') {
			alert("입력되지 않은 값이 있습니다. 다시 확인해주세요.")
			event.preventDefault();
			return;
		}
		f.action = "${pageContext.request.contextPath }/review/add.do";
		f.submit();
	}

	function cancel() {
		let check = confirm("정말 취소하시겠습니까?");
		if (check == true) {
			f.action = "${pageContext.request.contextPath}/board/participateList.do?memberId=${sessionScope.loginId}";
			f.submit();
		}
	}
</script>

</head>
<body>

	<h3>리뷰작성</h3>
	<form action="" method="post" id="f" name="f"
		enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${sessionScope.loginId}
				<input type="hidden" name="memberId" id="memberId" value="${sessionScope.loginId}" readonly>
				<input type="hidden" name="boardNum" id="boardNum" value="${vo.boardNum }">
				</td>
			</tr>


			<tr>
				<th>태그</th>
				<td><input type="text" name="tag" id="tag" value="${vo.tag }" readonly></td>
			</tr>
			<tr>
				<th>글내용</th>
				<td><textarea rows="10" cols="100" name="content" id="content"></textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" id="imagepath" name="imagepath" accept="image/jpeg,image/jpg,image/png" onchange="thumbnail(this);">
					<img src="../img/nopic.jpg" id="preview" style="width: 200px; height: 200px"><br />
					<input type="button" value="삭제" id="del" onclick="imgReset();"></td>
			</tr>
			<tr>
				<th>작성</th>
				<td><input type="submit" value="저장" onclick="fincheck()">
					<input type="button" value="작성취소" onclick="cancel()"></td>
			</tr>
		</table>
	</form>
</body>
</html>