<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="upload.js"></script>
<script  type="text/javascript">
	function edit() {
		let password = document.getElementById("H_pwd").value;
		let phone = document.getElementById("H_phone").value;
		let age = document.getElementById("H_age").value;
		let nickname = document.getElementById("H_nickname").value;
		let str = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$*]).{8,}$/; // 비밀번호 입력 가능한 문자 & 글자수 제한
		if (password == '' || phone == '' || age == '' || nickname == '') {
			alert("관심사와 한줄 소개를 제외한 양식을 모두 입력해 주세요.")
			event.preventDefault();
			return;
		}
		if (!str.test(password)) {
			alert("비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.");
			event.preventDefault();
			return;
		}
		f.action = "${pageContext.request.contextPath}/member/edit.do?memberId=${sessionScope.loginId }";
	}
</script>
</head>
<body>
<form action="" method="post" enctype="multipart/form-data" name="f">
	<table border="1">
		<tr>
			<td>이미지</td>
			<td colspan="2">
			<input type="file" class="hidden_input" id="imageSelector" name="imagepath" accept="image/jpeg,image/jpg,image/png" multiple>
			<img src="${vo.imagepath }" class="thumb" style="width: 200px; height: 200px">
			<input type="button" value="삭제" class="dellink" onclick="void(0);">
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" id="H_pwd"><br />
				<h6 style="color: red">비밀번호는 영문 대소문자, 숫자, 특수문자(!, @, #, $, *)를 포함하고 8글자 이상이여야 합니다.</h6></td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td><input type="text" name="phone" ID="H_phone">
			<span id="res2"></span> <input type="button" value="중복확인" onclick="checkPhone()"></td>
		</tr>
		<tr>
			<td>연령대</td>
			<td><select name="age" id="H_age">
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="40대">40대</option>
					<option value="50대">50대</option>
					<option value="60대">60대</option>
					<option value="70대">70대</option>
					<option value="80대">80대</option>
					<option value="90대">90대</option>
			</select></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickname" id="H_nickname">
			<span id="res3"></span>
			<input type="button" value="중복확인" onclick="checkNickname()"></td>
		</tr>
		<tr>
			<td>관심사</td>
			<td><input type="checkbox" name="tag" value="1">문화/예술 <input
				type="checkbox" name="tag" value="2">운동/액티비티 <input
				type="checkbox" name="tag" value="3">푸드/드링크 <input
				type="checkbox" name="tag" value="4">취미 <input
				type="checkbox" name="tag" value="5">봉사활동 <br /> <input
				type="checkbox" name="tag" value="6">반려동물 <input
				type="checkbox" name="tag" value="7">자기계발 <input
				type="checkbox" name="tag" value="8">대화 <input
				type="checkbox" name="tag" value="9">창작 <input
				type="checkbox" name="tag" value="10">멍때리기 <script>
				const maxAllowed = 3;
				const checkboxes = document.querySelectorAll('input[type=checkbox]');
				checkboxes.forEach(function(checkbox) {
					checkbox.addEventListener('click', function() {
						const checkedCount = document.querySelectorAll('input[type=checkbox]:checked').length;
						if (checkedCount > maxAllowed) {
							checkbox.checked = false;
						}
					});
				});
				</script></td>
		</tr>
		<tr>
			<td>한줄 소개</td>
			<td><textarea cols="80" rows="10" name="intro"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<input type="submit" value="수정" onclick="edit();">
			<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/member/mypage.do?memberId=${sessionScope.loginId}'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>